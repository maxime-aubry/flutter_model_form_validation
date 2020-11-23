import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:reflectable/reflectable.dart';

enum EFormDeclarer {
  FormGroup,
  FormArray,
  FormControl,
}

class ModelFormGroup extends FormGroup with ModelFormValidator {
  ModelFormGroup({
    @required String name,
    @required ModelFormGroup parentGroup,
    @required ModelForm current,
    bool isArrayItem = false,
    ModelFormBuilder formBuilder,
  }) : super(
          name: null,
          parentGroup: null,
          formBuilder: formBuilder,
          validators: new List<FormValidatorAnnotation>(),
          controls: new Map<String, AbstractControl>(),
        ) {
    this.current = current;
    this.initialize(name, parentGroup, isArrayItem);
  }

  ModelForm current;

  String get modelPartfullname {
    if (this.controlName == null || this.controlName.isEmpty) return null;
    if (this.controlName == 'root' && this.parentGroup == null) return null;
    ModelFormGroup parentGroup2 = this.parentGroup as ModelFormGroup;
    return '${parentGroup2.current.hashCode}.${this.controlName}';
  }

  @override
  @protected
  void initialize(
    String name,
    FormGroup parentGroup,
    bool isArrayItem,
  ) {
    assert(name != null && !name.isEmpty,
        'Cannot initialize form group if its name is not provided.');
    assert(!super.isInitialized,
        'Cannot initialize form group if this one is already initialized.');

    super.controlName = name;
    super.parentGroup = parentGroup;
    super.isArrayItem = isArrayItem;

    if (super.controlName != 'root' &&
        super.parentGroup != null &&
        !isArrayItem) {
      ModelFormGroup parentGroup2 = parentGroup as ModelFormGroup;
      ModelFormBuilder formBuilder = super.getFormBuilder() as ModelFormBuilder;

      formBuilder.addCorrespondence(
        this.modelPartfullname,
        this,
      );

      super.validators = super.getValidators(
        parentGroup2.current,
        super.controlName,
      );

      formBuilder.formState.update(
        super.fullname,
        null,
        super.validation_status,
      );

      FormGroupElement<ModelForm> formElement =
          super.getModelPart<FormGroupElement<ModelForm>>(
        parentGroup2.current,
        this.controlName,
      );
      formElement.addListener(() async {
        // each time a new sub-object is instanciated, controls are updated and the form group is validated
        this._actualizeChildren();
        await this.validate();
      });
    }

    if (this.current != null) this._actualizeChildren();

    super.isInitialized = true;
  }

  void _actualizeChildren() {
    InstanceMirror instanceMirror = super.getInstanceMirror(this.current);
    Iterable<MapEntry<String, DeclarationMirror>> formControls = instanceMirror
        .type.declarations.entries
        .where((element) => element.value is VariableMirror)
        .toList();

    for (MapEntry<String, DeclarationMirror> formControl in formControls) {
      VariableMirror variableMirror = formControl.value as VariableMirror;

      if (variableMirror.dynamicReflectedType == FormGroupElement) {
        this._addChildFormGroup(instanceMirror, formControl.key);
        continue;
      }

      if (variableMirror.dynamicReflectedType == FormArrayElement) {
        this._addChildFormArray(instanceMirror, formControl.key);
        continue;
      }

      if (variableMirror.dynamicReflectedType == FormControlElement) {
        this._addChildFormControl(instanceMirror, formControl.key);
        continue;
      }
    }
  }

  void _addChildFormGroup(
    InstanceMirror instanceMirror,
    String property,
  ) {
    FormGroupElement<ModelForm> element =
        super.getModelPart<FormGroupElement<ModelForm>>(this.current, property);

    ModelFormGroup formGroup = new ModelFormGroup(
      name: property,
      parentGroup: this,
      current: element.value,
    );
    super.addControl(property, formGroup);

    // element.addListener(() async {
    //   print('add listener 1');
    // });
  }

  void _addChildFormArray(
    InstanceMirror instanceMirror,
    String property,
  ) {
    FormArrayElement<ModelForm> element =
        super.getModelPart<FormArrayElement<ModelForm>>(this.current, property);

    ModelFormArray formArray = new ModelFormArray(
      name: property,
      parentGroup: this,
      items: element.value,
    );
    super.addControl(property, formArray);

    // element.addListener(() async {
    //   print('add listener 2');
    // });
  }

  void _addChildFormControl(
    InstanceMirror instanceMirror,
    String property,
  ) {
    FormControlElement element =
        super.getModelPart<FormControlElement>(this.current, property);

    ModelFormControl formControl = new ModelFormControl(
      name: property,
      parentGroup: this,
      value: element.value,
    );
    super.addControl(property, formControl);

    // element.addListener(() async {
    //   print('add listener 3');
    // });
  }

  @override
  Future validate() async => await super
      .validateControl(this.current, super.formPath, super.modelPath);
}
