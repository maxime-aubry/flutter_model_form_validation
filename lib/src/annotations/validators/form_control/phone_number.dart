import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';

/// [PhoneNumber] validator permits you to check that a string value is a valid phone number.
/// {@category Metadata}
/// {@subCategory Validators}
class PhoneNumber extends FormValidator<String> {
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
  Future<bool> isValid<TModel extends ModelForm>(
    FormBuilder<TModel> formBuilder,
    FormGroup<ModelForm, ModelForm> formGroup,
    String value,
  ) async {
    try {
      String _countryCode = this.getLinkedProperty<TModel, String>(
        formBuilder.group.modelState.model,
        this.countryCode,
        this.countryCodeOnProperty,
      );
      PhoneNumberType _phoneNumberType =
          this.getLinkedProperty<TModel, PhoneNumberType>(
        formBuilder.group.modelState.model,
        this.phoneNumberType,
        this.phoneNumberTypeOnProperty,
      );

      bool isValid = _validate(value, _countryCode?.toUpperCase(),
          _phoneNumberType?.toString()?.split('.')[1]);
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
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