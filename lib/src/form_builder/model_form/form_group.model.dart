import 'package:flutter_model_form_validation/src/annotations/form_declarers/index.dart';
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
    extends FormGroupBase with ModelFormValidator {
  ModelFormGroup(
    ModelFormState<TModel> formState,
    Object current,
    String name,
    FormGroupBase parentGroup, [
    bool isArrayItem = false,
  ])  : assert(formState != null),
        super(name, parentGroup, null, isArrayItem) {
    this.formState = formState;
    this.current = current as TCurrentModel;
    this.controls = new Map<String, AbstractControl>();
    this.status = EAbstractControlStatus.pure;
    this._initialize();
  }

  // public properties
  TCurrentModel current;

  // private methods
  void _initialize() {
    if (this.parentGroup != null && this.parentGroup is ModelFormGroup) {
      super.initialize(parentGroup as ModelFormGroup, name, () async {
        await _setValue(parentGroup as ModelFormGroup);
      });
    }

    // create sub-object if it is not null
    if (this.current != null) this._actualizeChildren();
  }

  void _actualizeChildren() {
    InstanceMirror instanceMirror = this.getInstanceMirror(this.current);
    Iterable<MapEntry<String, DeclarationMirror>> formControls = instanceMirror
        .type.declarations.entries
        .where((element) =>
            !element.key.endsWith('=') &&
            (element.value as MethodMirror).isGetter)
        .toList();
    this.controls = new Map<String, AbstractControl>();

    for (MapEntry<String, DeclarationMirror> formControl in formControls) {
      EFormDeclarer formDeclarer = this._getFormDeclarer(
        formControl.value as MethodMirror,
      );

      if (formDeclarer == EFormDeclarer.FormGroup)
        this._addChildFormGroup(instanceMirror, formControl.key);

      if (formDeclarer == EFormDeclarer.FormArray)
        this._addChildFormArray(instanceMirror, formControl.key);

      if (formDeclarer == EFormDeclarer.FormControl)
        this._addChildFormControl(instanceMirror, formControl.key);
    }
  }

  EFormDeclarer _getFormDeclarer(MethodMirror declarationMirror) {
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
    String propertyName,
  ) {
    print('Add ${this.name}.$propertyName form group.');

    Object child = this.getSubObject(instanceMirror, propertyName);
    this.controls[propertyName] = new ModelFormGroup(
      this.formState,
      child,
      propertyName,
      this,
    );
  }

  void _addChildFormArray(
    InstanceMirror instanceMirror,
    String propertyName,
  ) {
    print('Add ${this.name}.$propertyName form array.');

    List children = this.getSubObject(instanceMirror, propertyName);
    this.controls[propertyName] = new ModelFormArray(
      this.formState,
      children,
      propertyName,
      this,
    );
  }

  void _addChildFormControl(
    InstanceMirror instanceMirror,
    String propertyName,
  ) {
    print('Add ${this.name}.$propertyName form control.');

    Object child = this.getSubObject(instanceMirror, propertyName);
    this.controls[propertyName] = new ModelFormControl(
      this.formState,
      child,
      propertyName,
      this,
    );
  }

  /// [_setValue] method set this form control with the new value from form.
  /// Next, this value is validated, and the model state too.
  Future _setValue(ModelFormGroup parentGroup) async {
    assert(parentGroup != null);

    // set new sub-object
    InstanceMirror instanceMirror = this.getInstanceMirror(parentGroup.current);
    this.current = this.getSubObject(instanceMirror, this.name);

    if (this.current != null) {
      this._actualizeChildren();
      await this.validate(
        this.formState,
        this.parentGroup,
        this.name,
        this.current,
        this.formPath,
        this.modelPath,
      );
    }
  }
}
