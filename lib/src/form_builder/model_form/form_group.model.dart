import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

enum EFormDeclarer {
  FormGroup,
  FormArray,
  FormControl,
}

class ModelFormGroup<TModel extends ModelForm, TCurrentModel extends ModelForm>
    extends FormGroup with ModelFormValidator {
  ModelFormGroup({
    @required String name,
    @required ModelFormGroup parentGroup,
    @required Object current,
    bool isArrayItem = false,
    ModelFormBuilder<TModel> formBuilder,
  }) : super(
          name: null,
          parentGroup: null,
          formBuilder: formBuilder,
          validators: new List<FormValidatorAnnotation>(),
          controls: new Map<String, AbstractControl>(),
        ) {
    this.current = current as TCurrentModel;
    this.initialize(name, parentGroup, isArrayItem);
  }

  TCurrentModel current;

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
      ModelFormState<TModel> formState =
          super.getFormState() as ModelFormState<TModel>;
      ModelFormGroup parentGroup2 = parentGroup as ModelFormGroup;

      super.validators = super.getValidators(
        parentGroup2.current,
        super.controlName,
      );

      formState.update(
        super.fullname,
        null,
        super.status,
      );
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
      EFormDeclarer formDeclarer = this._getFormDeclarer(
        formControl.value as VariableMirror,
      );

      if (formDeclarer == EFormDeclarer.FormGroup)
        this._addChildFormGroup(instanceMirror, formControl.key);

      if (formDeclarer == EFormDeclarer.FormArray)
        this._addChildFormArray(instanceMirror, formControl.key);

      if (formDeclarer == EFormDeclarer.FormControl)
        this._addChildFormControl(instanceMirror, formControl.key);
    }
  }

  EFormDeclarer _getFormDeclarer(VariableMirror declarationMirror) {
    bool isFormGroup = Collection(declarationMirror.metadata)
        .any((arg1) => arg1 is FormGroupDeclarer);
    bool isFormArray = Collection(declarationMirror.metadata)
        .any((arg1) => arg1 is FormArrayDeclarer);
    bool isFormControl = Collection(declarationMirror.metadata)
        .any((arg1) => arg1 is FormControlDeclarer);

    int nbPropertyTypes = Collection([isFormGroup, isFormArray, isFormControl])
        .count((arg1) => arg1 == true);

    if (nbPropertyTypes > 1)
      throw new Exception(
          'More than one property type has been declared on this class member.');
    if (isFormGroup) return EFormDeclarer.FormGroup;
    if (isFormArray) return EFormDeclarer.FormArray;
    if (isFormControl) return EFormDeclarer.FormControl;

    // In the case of a collection item, there is not @FormInput annotation
    // so, let's return Input response
    return EFormDeclarer.FormControl;
  }

  void _addChildFormGroup(
    InstanceMirror instanceMirror,
    String name,
  ) {
    Object child = super.getSubObject(instanceMirror, name);
    super.addControl(
      name,
      new ModelFormGroup(
        name: name,
        parentGroup: this,
        current: child,
      ),
    );
  }

  void _addChildFormArray(
    InstanceMirror instanceMirror,
    String name,
  ) {
    List<ModelForm> children =
        super.getSubObject(instanceMirror, name) as List<ModelForm>;

    super.addControl(
      name,
      new ModelFormArray(
        name: name,
        parentGroup: this,
        items: children,
      ),
    );
  }

  void _addChildFormControl(
    InstanceMirror instanceMirror,
    String name,
  ) {
    Object child = super.getSubObject(instanceMirror, name);
    super.addControl(
      name,
      new ModelFormControl(
        name: name,
        parentGroup: this,
        value: child,
      ),
    );
  }

  @override
  Future validate() async => await super
      .validateControl(this.current, super.formPath, super.modelPath);
}
