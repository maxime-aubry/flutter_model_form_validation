import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_array_attribute.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_control_attribute.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_group_attribute.dart';
import 'package:flutter_model_form_validation/src/form_builder/abstract_control.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_array.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_control.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

class FormGroup<TModel extends PropertyChangeNotifier<String>,
        TCurrentModel extends PropertyChangeNotifier<String>>
    extends AbstractControl {
  FormGroup(
    TModel model,
    Object currentPartOfModel,
    FormGroup parent,
  )   : assert(model != null),
        assert(currentPartOfModel != null),
        super() {
    this.model = model;
    this.currentPartOfModel = currentPartOfModel as TCurrentModel;
    this.parent = parent;
    this.controls = {};
    this._init();
  }

  // private properties
  InstanceMirror _instanceMirror;

  // public properties
  TModel model;
  TCurrentModel currentPartOfModel;
  FormGroup parent;
  Map<String, AbstractControl> controls;

  void _init() {
    this._instanceMirror = this.getInstanceMirror(this.currentPartOfModel);

    Iterable<MapEntry<String, DeclarationMirror>> formControls = this
        ._instanceMirror
        .type
        .declarations
        .entries
        .where((element) =>
            !element.key.endsWith('=') && element.value is MethodMirror);

    for (MapEntry<String, DeclarationMirror> formControl in formControls) {
      EFormDeclarer formDeclarer =
          this._getFormDeclarer(formControl.value as MethodMirror);

      if (formDeclarer == EFormDeclarer.FormGroup)
        this._addChildFormGroup(formControl.key);

      if (formDeclarer == EFormDeclarer.FormArray)
        this._addChildFormArray(formControl.key);

      if (formDeclarer == EFormDeclarer.FormControl)
        this._addChildFormControl(formControl.key);

      // add validators
      this.validators = this.getValidators(formControl.value as MethodMirror);
    }
  }

  EFormDeclarer _getFormDeclarer(MethodMirror childDeclaration) {
    bool isFormGroup = Collection(childDeclaration.metadata)
        .any((arg1) => arg1 is FormGroupAttribute);
    bool isFormArray = Collection(childDeclaration.metadata)
        .any((arg1) => arg1 is FormArrayAttribute);
    bool isFormControl = Collection(childDeclaration.metadata)
        .any((arg1) => arg1 is FormControlAttribute);

    int nbPropertyTypes = Collection([isFormGroup, isFormArray, isFormControl])
        .count((arg1) => arg1 == true);

    if (nbPropertyTypes > 1)
      throw new PropertyTypeException(
          'More than one property type has been declared on this class member.');
    if (isFormGroup) return EFormDeclarer.FormGroup;
    if (isFormArray) return EFormDeclarer.FormArray;
    if (isFormControl) return EFormDeclarer.FormControl;

    // In the case of a collection item, there is not @FormInput annotation
    // so, let's return Input response
    return EFormDeclarer.FormControl;
  }

  Object _getSubObject(String propertyName) {
    Object child = this._instanceMirror.invokeGetter(propertyName);
    return child;
  }

  void _addChildFormGroup(String propertyName) {
    Object child = this._getSubObject(propertyName);
    if (child != null)
      this.controls[propertyName] = new FormGroup(
        this.model,
        child,
        this,
      );
  }

  void _addChildFormArray(String propertyName) {
    List children = this._getSubObject(propertyName);
    if (children != null)
      this.controls[propertyName] = new FormArray(
        this.model,
        children,
        this,
      );
  }

  void _addChildFormControl(String propertyName) {
    Object child = this._getSubObject(propertyName);
    this.controls[propertyName] = new FormControl(
      this.model,
      child,
      propertyName,
      this,
    );
  }
}

class PropertyTypeException implements Exception {
  PropertyTypeException(this.message);

  final String message;
}

enum EFormDeclarer {
  FormGroup,
  FormArray,
  FormControl,
}
