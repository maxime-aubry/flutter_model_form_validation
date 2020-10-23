import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_validator_attribute.dart';
import 'package:flutter_model_form_validation/src/annotations/helpers/validation_helper.dart';
import 'package:flutter_model_form_validation/src/utils/rules.dart';

/// [PhoneNumber] validator permits you to check that a string value is a valid phone number.
/// {@category Metadata}
/// {@subCategory Validators}
class PhoneNumber extends FormValidatorAttribute<String> {
  const PhoneNumber({
    this.countryCode,
    this.phoneNumberType,
    this.countryCodeOnProperty,
    this.phoneNumberTypeOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [countryCode] is the country code.
  final String countryCode;

  /// [phoneNumberType] is the type of phone number, landline or mobile phone.
  final PhoneNumberType phoneNumberType;

  /// [countryCodeOnProperty] is the name of targeted property that user uses to provide country code. This one has priority on [countryCode] value.
  final String countryCodeOnProperty;

  /// [phoneNumberTypeOnProperty] is the name of targeted property that user uses to provide phone number type. This one has priority on [phoneNumberType] value.
  final String phoneNumberTypeOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid<TModel>(String value, TModel model) async {
    try {
      String _countryCode = ValidationHelper.getLinkedProperty<TModel, String>(
              model, this.countryCodeOnProperty) ??
          this.countryCode;
      PhoneNumberType _phoneNumberType =
          ValidationHelper.getLinkedProperty<TModel, PhoneNumberType>(
                  model, this.phoneNumberTypeOnProperty) ??
              this.phoneNumberType;

      bool isValid = _validate(value, _countryCode?.toUpperCase(),
          _phoneNumberType?.toString()?.split('.')[1]);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(
      String value, String countryCodeValue, String phoneNumberTypeValue) {
    if (value == null) return true;
    if (countryCodeValue == null || phoneNumberTypeValue == null) return false;
    if (!Rules.phone.containsKey('$countryCodeValue-$phoneNumberTypeValue'))
      return false;

    // sanitize the value
    value = value.replaceAll(new RegExp(r'[\D]'), '');

    RegExp regExp =
        new RegExp(Rules.phone['$countryCodeValue-$phoneNumberTypeValue']);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
