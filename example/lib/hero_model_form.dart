import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

@flutterModelFormValidator
class HeroModelForm extends ModelForm {
  HeroModelForm(this._name, this._gender, this._birthDay, this._powers) {
    this._today = DateTime.now();
  }

  String _name;
  String _gender;
  DateTime _birthDay;
  DateTime _today;
  List<String> _powers;

  // getters
  @Required(error: 'name is required')
  @StringLength(
      min: 1, max: 50, error: 'name must have between 1 and 50 characters')
  String get name => this._name;

  @Required(error: 'gender is required')
  @SingleSelect(serviceName: 'getGenderItems', error: 'invalid gender')
  String get gender => this._gender;

  @Required(error: 'birthday is required')
  @SmallerThan(
      valueToCompareOnProperty: 'today',
      error: 'hero must be born before today')
  DateTime get birth_day => this._birthDay;

  @Required(error: 'powers are required')
  @MultiSelect(
    serviceName: 'getPowerItems',
    error: 'item is not int he list of powers',
  )
  List<String> get powers => this._powers;

  DateTime get today => this._today;

  // setters
  set name(String value) {
    this._name = value;
    super.notifyModelState('name');
  }

  set gender(String value) {
    this._gender = value;
    super.notifyModelState('gender');
  }

  set birth_day(DateTime value) {
    this._birthDay = value;
    super.notifyModelState('birth_day');
  }

  void addPower(String power) {
    if (this._powers == null) this._powers = new List<String>();
    this._powers.add(power);
    super.notifyModelState('powers');
  }

  void removePower(String power) {
    if (this._powers == null) this._powers = new List<String>();
    this._powers.remove(power);
    super.notifyModelState('powers');
  }
}
