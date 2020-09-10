import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_helper.dart';
import 'package:flutter_model_form_validation/src/utils/rules.dart';

/// [PhoneNumber] validator permits you to check that a string value is a valid phone number.
/// {@category Metadata}
/// {@subCategory Validators}
class PhoneNumber extends ValidationAnnotation<String> {
  const PhoneNumber({
    this.countryCode,
    this.countryCodeOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [countryCode] is the country code.
  final String countryCode;

  /// [countryCodeOnProperty] is the name of targeted property that user uses to provide country code. This one has priority on [countryCode] value.
  final String countryCodeOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(String value, TModel model) {
    try {
      String _countryCode = ValidationHelper.getLinkedProperty<TModel, String>(
              model, this.countryCodeOnProperty) ??
          this.countryCode;

      bool isValid = _validate(value, _countryCode.toUpperCase());
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value, String countryCodeValue) {
    if (!Rules.phone.containsKey(countryCodeValue)) return false;

    RegExp regExp = new RegExp(Rules.phone[countryCodeValue]);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
