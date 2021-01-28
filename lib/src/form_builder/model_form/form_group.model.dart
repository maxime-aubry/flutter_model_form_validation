import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_declarers/index.dart';
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
          validators: [],
          controls: new Map<String, AbstractControl>(),
        ) {
    this.current = current;
    this.initialize(name, parentGroup, isArrayItem);
  }

  ModelForm current;

  String get modelPartfullname {
    if (this.name == null || this.name.isEmpty) return null;
    if (this.name == 'root' && this.parentGroup == null) return null;
    ModelFormGroup parentGroup2 = this.parentGroup as ModelFormGroup;
    return '${parentGroup2.current.hashCode}.${this.name}';
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

    super.name = name;
    super.parentGroup = parentGroup;
    super.isArrayItem = isArrayItem;

    if (super.name != 'root' && super.parentGroup != null && !isArrayItem) {
      ModelFormGroup parentGroup2 = parentGroup as ModelFormGroup;
      ModelFormBuilder formBuilder = super.getFormBuilder() as ModelFormBuilder;
      FormGroupElement<ModelForm> formElement =
          super.getModelPart<FormGroupElement<ModelForm>>(
        parentGroup2.current,
        this.name,
      );

      formBuilder.addCorrespondence(
        this.modelPartfullname,
        this,
      );

      super.validators = super.getValidators(
        parentGroup2.current,
        super.name,
      );

      formBuilder.formState.update(
        super.fullname,
        null,
        super.status,
      );

      formElement.addListener(() {
        this.current = formElement.value;
        this._actualizeChildren();
      });
    }

    if (this.current != null) this._actualizeChildren();

    super.isInitialized = true;
  }

  void _actualizeChildren() {
    if (this.current == null) {
      super.clearControls();
      return;
    }

    InstanceMirror instanceMirror = super.getInstanceMirror(this.current);
    Iterable<MapEntry<String, DeclarationMirror>> formControls = instanceMirror
        .type.declarations.entries
        .where((element) => element.value is VariableMirror)
        .toList();

    for (MapEntry<String, DeclarationMirror> formControl in formControls) {
      VariableMirror variableMirror = formControl.value as VariableMirror;

      if (variableMirror.dynamicReflectedType == FormGroupElement) {
        this._addChildFormGroup(formControl.key);
        continue;
      }

      if (variableMirror.dynamicReflectedType == FormArrayElement) {
        this._addChildFormArray(formControl.key);
        continue;
      }

      if (variableMirror.dynamicReflectedType == FormControlElement) {
        this._addChildFormControl(variableMirror, formControl.key);
        continue;
      }
    }
  }

  void _addChildFormGroup(String property) {
    ModelForm model = super
        .getModelPart<FormGroupElement<ModelForm>>(this.current, property)
        .value;

    super.addControl(
      property,
      new ModelFormGroup(
        name: property,
        parentGroup: this,
        current: model,
      ),
    );
  }

  void _addChildFormArray(String property) {
    List<ModelForm> model = super
        .getModelPart<FormArrayElement<ModelForm>>(this.current, property)
        .value;

    super.addControl(
      property,
      new ModelFormArray(
        name: property,
        parentGroup: this,
        items: model,
      ),
    );
  }

  void _addChildFormControl(
    VariableMirror variableMirror,
    String property,
  ) {
    Object value =
        super.getModelPart<FormControlElement>(this.current, property).value;

    super.addControl(
      property,
      new ModelFormControl(
        name: property,
        parentGroup: this,
        value: value,
      ),
    );
  }

  @override
  Future validate() async => await super
      .validateControl(this.current, super.formPath, super.modelPath);
}
