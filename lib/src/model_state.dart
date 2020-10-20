import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/annotations/flutter_model_form_validator.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:flutter_model_form_validation/src/form_properties.dart';
import 'package:flutter_model_form_validation/src/form_property.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

enum FormStatus {
  pure,
  valid,
  invalid,
  validationInProgress,
  submissionInProgress,
  submissionSuccess,
  submissionFailure,
}

class ModelState<TModel extends PropertyChangeNotifier<String>> {
  ModelState(TModel model) : assert(model != null) {
    this.model = model;
    this._init();
  }

  TModel model;
  List<FormProperty> _properties;
  FormStatus _status;

  /// Gets the list of properties.
  List<FormProperty> get properties => this._properties;

  /// Gets the form status (pure, valid, invalid, validation in progress, submission in progress, submission success, submission failure).
  FormStatus get status => this._status;

  /// Gets the list of properties errors.
  Map<String, ValidationError> get errors {
    Map<String, ValidationError> _errors = {};
    for (FormProperty property in this._properties)
      if (property.error != null) _errors[property.name] = property.error;
    return _errors;
  }

  /// Initialize the form.
  /// Declare the form status to pure.
  /// Add listeners for each property, what will trigger validators when a value is setted.
  void _init() {
    try {
      ClassMirror classMirror = flutterModelFormValidator.reflectType(TModel);
      FormProperties formProperties = new FormProperties();
      this._status = FormStatus.pure;
      this._properties =
          formProperties.getProperties<TModel>(this.model, classMirror);
      this._addListeners();
    } catch (e) {
      print(e);
    }
  }

  /// Each time a value is setted in the form, the targeted property is updated and validated.
  void _addListeners() {
    try {
      for (FormProperty property in this._properties)
        this
            .model
            .addListener(() => _actualizeInput(property), [property.name]);
    } catch (e) {
      print(e);
    }
  }

  /// Actualize a property of the current model, and validate it.
  Future _actualizeInput(FormProperty property) async {
    try {
      await property.update(model);
      bool isValidForm = !Collection(this._properties)
          .any((arg1) => arg1.status == InputStatus.invalid);
      this._status = (isValidForm) ? FormStatus.valid : FormStatus.invalid;
    } catch (e) {
      print(e);
    }
  }

  /// Returns the property with provided name.
  FormProperty getProperty(String propertyName) {
    try {
      FormProperty property = Collection(this._properties)
          .where((arg1) => arg1.name == propertyName)
          .singleOrDefault();
      return property;
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// Validate the current form with [model] binding of [TModel] type.
  /// Browses all declared metadata of [ValidationAnnotation] type, for each property into your class model.
  /// Then, set the form input status on each property and the form status.
  /// Returns true is form is valid, or false if is not.
  Future<bool> validateForm() async {
    try {
      this._status = FormStatus.validationInProgress;

      // validate each property
      for (FormProperty property in this._properties)
        await property.update(this.model);

      // validate the form
      bool isValid = !Collection(this._properties)
          .any((arg1) => arg1.status == InputStatus.invalid);
      this._status = isValid ? FormStatus.valid : FormStatus.invalid;
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
