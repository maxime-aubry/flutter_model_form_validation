import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

/// [PhoneNumber] validator permits you to check that a string value is a valid phone number.
/// {@category Metadata}
/// {@subCategory Validators}
class PhoneNumber extends FormValidatorAnnotation {
  const PhoneNumber({
    this.countryCode,
    this.phoneNumberType,
    this.countryCodeOnProperty,
    this.phoneNumberTypeOnProperty,
    @required this.error,
  }) : super(error: error);

  /// [countryCode] is the country code.
  final String countryCode;

  /// [phoneNumberType] is the type of phone number, landline or mobile phone.
  final String phoneNumberType;

  /// [countryCodeOnProperty] is the name of targeted property that user uses to provide country code. This one has priority on [countryCode] value.
  final String countryCodeOnProperty;

  /// [phoneNumberTypeOnProperty] is the name of targeted property that user uses to provide phone number type. This one has priority on [phoneNumberType] value.
  final String phoneNumberTypeOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid(
    FormGroup root,
    FormGroup fg,
    Object value,
    String formPath,
    String modelFormPath,
  ) async {
    try {
      if (value == null) return true;

      if (value is! String) throw new Exception('field type must be a string');

      bool isValid = _validate(
        value: (value as String)?.toLowerCase(),
        countryCodeValue: this
            .getRemoteValue<String>(
                fg, this.countryCodeOnProperty, this.countryCode)
            ?.toUpperCase(),
        phoneNumberTypeValue: this
            .getRemoteValue<String>(
                fg, this.phoneNumberTypeOnProperty, this.phoneNumberType)
            ?.toLowerCase(),
      );
      return isValid;
    } on RemotePropertyException catch (e) {
      throw e;
    } catch (e) {
      throw new ValidationException(
          'An error occured with validator on form element with validator of type');
    }
  }

  bool _validate({
    @required String value,
    @required String countryCodeValue,
    @required String phoneNumberTypeValue,
  }) {
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
