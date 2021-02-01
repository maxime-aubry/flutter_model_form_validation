import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form/model_form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
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
    // assert(!super.isInitialized,
    //     'Cannot initialize form group if this one is already initialized.');

    super.name = name;
    super.parentGroup = parentGroup;
    super.isArrayItem = isArrayItem;

    if (this._isRootFormGroup() && !isArrayItem) {
      super.getValidators(super.parentGroup, super.name);
      this._updateValueOnModelChange(super.parentGroup);
    }

    this._actualizeChildren();
    // super.isInitialized = true;
  }

  @override
  Future validate() async => await super
      .validateControl(this.current, super.formPath, super.modelPath);

  /* Private methods */
  bool _isRootFormGroup() =>
      (super.name != 'root' && super.parentGroup != null);

  void _updateValueOnModelChange(ModelFormGroup parentGroup) {
    FormGroupElement<ModelForm> formElement =
        super.getModelPart<FormGroupElement<ModelForm>>(
      parentGroup.current,
      this.name,
    );
    formElement.addListener(() {
      this.current = formElement.value;
      this._actualizeChildren();
    });
  }

  void _actualizeChildren() {
    if (this.current == null) {
      super.clearControls();
      return;
    }

    for (MapEntry<String, VariableMirror> formControl in this._getChildren()) {
      if (formControl.value.dynamicReflectedType == FormGroupElement) {
        this._addChildFormGroup(formControl.key);
        continue;
      }

      if (formControl.value.dynamicReflectedType == FormArrayElement) {
        this._addChildFormArray(formControl.key);
        continue;
      }

      if (formControl.value.dynamicReflectedType == FormControlElement) {
        this._addChildFormControl(formControl.value, formControl.key);
        continue;
      }
    }
  }

  Iterable<MapEntry<String, VariableMirror>> _getChildren() {
    InstanceMirror instanceMirror = super.getInstanceMirror(this.current);
    Iterable<MapEntry<String, VariableMirror>> children = instanceMirror
        .type.declarations.entries
        .where((element) => element.value is VariableMirror)
        .cast<MapEntry<String, VariableMirror>>()
        .toList();
    return children;
  }

  void _addChildFormGroup(String property) {
    ModelForm model = super
        .getModelPart<FormGroupElement<ModelForm>>(this.current, property)
        .value;

    super.addControl(
      property,
      new ModelFormGroup(
        name: null,
        parentGroup: null,
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
        name: null,
        parentGroup: null,
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
        name: null,
        parentGroup: null,
        value: value,
      ),
    );
  }
}
