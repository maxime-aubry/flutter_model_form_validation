import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_validator_attribute.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_error.dart';
import 'package:flutter_model_form_validation/src/form_builder/abstract_control.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_group.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:reflectable/mirrors.dart';

class FormControl<TModel extends PropertyChangeNotifier<String>>
    extends AbstractControl {
  FormControl(
    TModel model,
    Object value,
    String name,
    FormGroup parent,
  )   : assert(model != null),
        super() {
    this.model = model;
    this.value = value;
    this.name = name;
    this.parent = parent;
    this.status = EAbstractControlStatus.pure;
    this._init(value);
  }

  // public properties
  TModel model;
  Object value;
  String name;
  EAbstractControlStatus status;
  FormGroup parent;

  // private methods
  void _init(Object value) {
    InstanceMirror instanceMirror =
        this.getInstanceMirror(this.parent.currentPartOfModel);
    MethodMirror methodMirror =
        instanceMirror.type.declarations[this.name] as MethodMirror;
    this.validators = this.getValidators(methodMirror);
    this._addListener();
  }

  void _addListener() {
    this.parent.currentPartOfModel.addListener(
      () => _setValue(),
      ['${this.parent.currentPartOfModel.hashCode}.${this.name}'],
    );
  }

  Future _setValue() async {
    try {
      InstanceMirror instanceMirror =
          this.getInstanceMirror(this.parent.currentPartOfModel);
      this.value = instanceMirror.invokeGetter(this.name);
      this.status = EAbstractControlStatus.validationInProgress;
      this.status = await this._validate()
          ? EAbstractControlStatus.valid
          : EAbstractControlStatus.invalid;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> _validate() async {
    bool isValid = true;
    this.error = null;

    for (FormValidatorAttribute validator in this.validators) {
      isValid = await validator.isValid(this.value, this.model);
      if (!isValid) {
        this.error = ValidationError(
          propertyName: this.name,
          validatorType: validator.runtimeType,
          error: validator.error,
        );
        break;
      }
    }
    return isValid;
  }
}
