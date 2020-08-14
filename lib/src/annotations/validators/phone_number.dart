import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';
import '../validation_helper.dart';
import '../../utils/rules.dart';

/// [PhoneNumber] validator permits you to check that a string value is a valid phone number.
/// {@category Metadata}
/// {@subCategory Validators}
class PhoneNumber extends ValidationAnnotation {
  const PhoneNumber({
    this.countryCode,
    this.countryCodeOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// This is the country code.
  final String countryCode;

  /// This is the country code on a targeted property.
  final String countryCodeOnProperty;

  /// This is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(Object value, TModel model) {
    try {
      if (value is! String) return false;

      String countryCodeOnProperty = ValidationHelper.getLinkedProperty<TModel>(
          model, this.countryCodeOnProperty);

      return _validate(value, countryCodeOnProperty ?? this.countryCode);
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value, String countryCode) {
    if (!Rules.phone.containsKey(countryCode.toUpperCase())) return false;

    RegExp regExp = new RegExp(Rules.phone[countryCode.toUpperCase()]);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
