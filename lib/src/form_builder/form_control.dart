import 'package:flutter_model_form_validation/src/annotations/flutter_model_form_validator.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_validator.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_error.dart';
import 'package:flutter_model_form_validation/src/form_builder/abstract_control.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:reflectable/mirrors.dart';

class FormControl<TModel extends PropertyChangeNotifier<String>>
    extends AbstractControl {
  FormControl(
    InstanceMirror instanceMirror,
    MethodMirror declaration,
    TModel model,
    Object value,
  )   : assert(model != null),
        super(declaration) {
    this._init(instanceMirror, declaration, model, value);
  }

  TModel _model;
  String name;
  Object value;
  EAbstractControlStatus status;

  void _init(InstanceMirror instanceMirror, MethodMirror declaration,
      TModel model, Object value) {
    this._model = model;
    this.name = declaration.simpleName;
    this.value = value;
    this.status = EAbstractControlStatus.pure;
    this._addListener();
  }

  void _addListener() {
    this._model.addListener(
      () => _setValue(),
      ['${this._model.hashCode}.${this.name}'],
    );
  }

  Future _setValue() async {
    try {
      InstanceMirror instanceMirror =
          flutterModelFormValidator.reflect(this._model);
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

    for (FormValidator validator in this.validators) {
      isValid = await validator.isValid(this.value, this._model);
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
