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
  ModelState(TModel model) {
    this.model = model;
    this._init();
  }

  TModel model;
  List<FormProperty> _properties;
  FormStatus _status;

  List<FormProperty> get properties {
    return this._properties;
  }

  FormStatus get status {
    return this._status;
  }

  void _init() {
    try {
      ClassMirror classMirror = flutterModelFormValidator.reflectType(TModel);
      this._status = FormStatus.pure;
      this._properties =
          FormProperties.getProperties<TModel>(this.model, classMirror);
      this._addListeners();
    } catch (e) {
      print(e);
    }
  }

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

  void _actualizeInput(FormProperty property) {
    try {
      property.update<TModel>(model);
      bool isValidForm = !Collection(this._properties)
          .any((arg1) => arg1.status == InputStatus.invalid);
      this._status = (isValidForm) ? FormStatus.valid : FormStatus.invalid;
    } catch (e) {
      print(e);
    }
  }

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

  /// Gets the state of current [model] binding of [TModel] type.
  /// Browses all declared metadata of [ValidationAnnotation] type, for each property into your class model.
  /// Then, executes "IsValid" method that returns true or false. For each property, first of them that returns false invalidates your property, and so, your model. If there is none, your property and model are valid.
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
