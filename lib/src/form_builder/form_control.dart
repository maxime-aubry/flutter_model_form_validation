import 'package:flutter_model_form_validation/src/form_builder/abstract_control.dart';
import 'package:reflectable/mirrors.dart';

class FormControl extends AbstractControl {
  FormControl(
      InstanceMirror instanceMirror, MethodMirror declaration, Object value)
      : super(declaration) {
    this._init(instanceMirror, declaration, value);
  }

  String name;
  Object value;
  EAbstractControlStatus status;

  void _init(
      InstanceMirror instanceMirror, MethodMirror declaration, Object value) {
    this.name = declaration.simpleName;
    this.value = value;
    this.status = EAbstractControlStatus.pure;
  }

  void _addListener() {

  }
}
