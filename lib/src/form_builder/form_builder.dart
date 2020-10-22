import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/annotations/flutter_model_form_validator.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_array.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_control.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_group.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/mirrors.dart';

enum EPropertyType {
  Input,
  Object,
  Collection,
}

class PropertyTypeException implements Exception {
  PropertyTypeException(this.message);

  final String message;
}

class FormBuilder<TModel> {
  FormBuilder(TModel model) : assert(model != null) {
    this.group = new FormGroup();
    this._init(model);
  }

  // properties
  FormGroup group;

  // methods
  void _init(TModel model) {
    ClassMirror classMirror = flutterModelFormValidator.reflectType(TModel);
    InstanceMirror instanceMirror = flutterModelFormValidator.reflect(model);

    for (MapEntry<String, DeclarationMirror> control in classMirror.declarations
        .entries) this._browse(instanceMirror, control, this.group);
  }

  void _browse(
    InstanceMirror instanceMirror,
    MapEntry<String, DeclarationMirror> control,
    FormGroup group,
  ) {
    try {
      // if it's a getter
      if (control.value is MethodMirror && !control.key.endsWith('=')) {
        EPropertyType propertyType = this._getPropertyType(control.value);

        if (propertyType == EPropertyType.Input) {
          group.controls[control.key] = this
              ._createFormControl(instanceMirror, control.key, control.value);
        }

        if (propertyType == EPropertyType.Object) {
          // get child and it's instance mirror
          Object child = this._getSubObject(instanceMirror, control.key);

          // browse each child of this object
          // and fill form group with new form controls
          if (child != null) {
            group.controls[control.key] = new FormGroup(control.value);
            this._fillFormGroup(child, group.controls[control.key]);
          }
        }

        if (propertyType == EPropertyType.Collection) {
          // get child and it's instance mirror
          Object children = this._getSubObject(instanceMirror, control.key);

          // browse each item of this collection
          // for each of them, add a form group to the array
          // into those, browser each child of this object
          if (children != null) {
            FormArray formArray = new FormArray(control.value);
            group.controls[control.key] = formArray;

            for (Object child in children) {
              formArray.groups.add(new FormGroup());
              // browse each child of this object
              // and fill form group with new form controls
              this._fillFormGroup(child, formArray.groups.last);
            }
          }
        }
      }
    } on PropertyTypeException catch (e) {
      print(e);
    }
  }

  EPropertyType _getPropertyType(MethodMirror declaration) {
    bool isFormInput =
        Collection(declaration.metadata).any((arg1) => arg1 is FormInput);
    bool isFormObject =
        Collection(declaration.metadata).any((arg1) => arg1 is FormObject);
    bool isFormCollection =
        Collection(declaration.metadata).any((arg1) => arg1 is FormCollection);

    int nbPropertyTypes =
        Collection([isFormInput, isFormObject, isFormCollection])
            .count((arg1) => arg1 == true);

    if (nbPropertyTypes > 1)
      throw new PropertyTypeException(
          'More than one property type has been declared on this class member.');
    if (isFormInput) return EPropertyType.Input;
    if (isFormObject) return EPropertyType.Object;
    if (isFormCollection) return EPropertyType.Collection;

    // In the case of a collection item, there is not @FormInput annotation
    // so, let's return Input response
    return EPropertyType.Input;
  }

  Object _getSubObject(InstanceMirror instanceMirror, String propertyName) {
    Object child = instanceMirror.invokeGetter(propertyName);
    return child;
  }

  InstanceMirror _getSubObjectInstanceMirror(Object child) {
    InstanceMirror instanceMirror = flutterModelFormValidator.reflect(child);
    return instanceMirror;
  }

  /// Create a form group
  void _fillFormGroup(
    Object child,
    FormGroup formGroup,
  ) {
    InstanceMirror childInstanceMirror =
        this._getSubObjectInstanceMirror(child);

    // browse each child of this object
    for (MapEntry<String, DeclarationMirror> objectControl
        in childInstanceMirror.type.declarations.entries) {
      this._browse(
        childInstanceMirror,
        objectControl,
        formGroup,
      );
    }
  }

  FormControl _createFormControl(
    InstanceMirror instanceMirror,
    String propertyName,
    MethodMirror declaration,
  ) {
    Object value = this._getSubObject(instanceMirror, propertyName);
    FormControl formControl =
        new FormControl(instanceMirror, declaration, value);
    return formControl;
  }
}
