import 'dart:io';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

/*group('xxxx.', () {
    group('Test the priority between user and developer static data.', () {});
    group('Test the validation > success.', () {});
    group('Test the validation > failure.', () {});
  });*/

void main() {}

//#region ContainsDateTime
@flutterModelFormValidator
class ContainsDateTimeTest {
  ContainsDateTimeTest(this.value);

  @ContainsDateTime(
    items: ['2020-01-01', '2020-06-01', '2020-12-31'],
    error: 'Invalid datetime',
  )
  final DateTime value;
}
//#endregion

//#region ContainsNumber
@flutterModelFormValidator
class ContainsNumberTest {
  ContainsNumberTest(this.value);

  @ContainsNumber(
    items: [1, 2, 3],
    error: 'Invalid number',
  )
  final num value;
}
//#endregion

//#region ContainsString
@flutterModelFormValidator
class ContainsStringTest {
  ContainsStringTest(this.value);

  @ContainsString(
    items: ['lorem', 'ipsum', 'dolor', 'sit', 'amet'],
    error: 'Invalid keyword',
  )
  final String value;
}
//#endregion

//#region DateTimeRange
@flutterModelFormValidator
class DateTimeRangeTest {
  DateTimeRangeTest(this.value, this.min, this.max);

  @DateTimeRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'This datetime is not in the range',
  )
  final DateTime value;
  final DateTime min;
  final DateTime max;
}

@flutterModelFormValidator
class DateTimeRangeWithUserAndDeveloperValuesTest {
  DateTimeRangeWithUserAndDeveloperValuesTest(this.value, this.min, this.max);

  @DateTimeRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    min: '2019-01-01',
    max: '2019-12-31',
    error: 'This datetime is not in the range',
  )
  final DateTime value;
  final DateTime min;
  final DateTime max;
}

@flutterModelFormValidator
class DateTimeRangeWithUserValuesTest {
  DateTimeRangeWithUserValuesTest(this.value, this.min, this.max);

  @DateTimeRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'This datetime is not in the range',
  )
  final DateTime value;
  final DateTime min;
  final DateTime max;
}

@flutterModelFormValidator
class DateTimeRangeWithDeveloperValuesTest {
  DateTimeRangeWithDeveloperValuesTest(this.value);

  @DateTimeRange(
    min: '2019-01-01',
    max: '2019-12-31',
    error: 'This datetime is not in the range',
  )
  final DateTime value;
}
//#endregion

//#region Email
@flutterModelFormValidator
class EmailTest {
  EmailTest(this.value);

  @Email(
    error: 'Invalid email',
  )
  final String value;
}
//#endregion

//#region EqualToDatetime
@flutterModelFormValidator
class EqualToDatetimeTest {
  EqualToDatetimeTest(this.value, this.valueToCompare);

  @EqualToDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class EqualToDatetimeWithUserAndDeveloperValuesTest {
  EqualToDatetimeWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @EqualToDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class EqualToDatetimeWithUserValuesTest {
  EqualToDatetimeWithUserValuesTest(this.value, this.valueToCompare);

  @EqualToDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class EqualToDatetimeWithDeveloperValuesTest {
  EqualToDatetimeWithDeveloperValuesTest(this.value);

  @EqualToDatetime(
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
}
//#endregion

//#region EqualToNumber
@flutterModelFormValidator
class EqualToNumberTest {
  EqualToNumberTest(this.value, this.valueToCompare);

  @EqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class EqualToNumberWithUserAndDeveloperValuesTest {
  EqualToNumberWithUserAndDeveloperValuesTest(this.value, this.valueToCompare);

  @EqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class EqualToNumberWithUserValuesTest {
  EqualToNumberWithUserValuesTest(this.value, this.valueToCompare);

  @EqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class EqualToNumberWithDeveloperValuesTest {
  EqualToNumberWithDeveloperValuesTest(this.value);

  @EqualToNumber(
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  final num value;
}
//#endregion

//#region EqualToString
@flutterModelFormValidator
class EqualToStringTest {
  EqualToStringTest(this.value, this.valueToCompare);

  @EqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class EqualToStringWithUserAndDeveloperValuesTest {
  EqualToStringWithUserAndDeveloperValuesTest(this.value, this.valueToCompare);

  @EqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class EqualToStringWithUserValuesTest {
  EqualToStringWithUserValuesTest(this.value, this.valueToCompare);

  @EqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class EqualToStringWithDeveloperValuesTest {
  EqualToStringWithDeveloperValuesTest(this.value);

  @EqualToString(
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
}
//#endregion

//#region FileMimeType
@flutterModelFormValidator
class FileMimeTypeTest {
  FileMimeTypeTest(this.value);

  @FileMimeType(
    mimeTypes: ['image/jpeg', 'image/bmp'],
    error: 'Invalid mime type',
  )
  final File value;
}
//#endregion

//#region FileSize
@flutterModelFormValidator
class FileSizeTest {
  FileSizeTest(this.value);

  @FileSize(
    size: 1048576,
    error: 'Invalid file size',
  )
  final File value;
}
//#endregion

//#region GreaterOrEqualToDatetime
@flutterModelFormValidator
class GreaterOrEqualToDatetimeTest {
  GreaterOrEqualToDatetimeTest(this.value, this.valueToCompare);

  @GreaterOrEqualToDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest {
  GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @GreaterOrEqualToDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToDatetimeWithUserValuesTest {
  GreaterOrEqualToDatetimeWithUserValuesTest(this.value, this.valueToCompare);

  @GreaterOrEqualToDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToDatetimeWithDeveloperValuesTest {
  GreaterOrEqualToDatetimeWithDeveloperValuesTest(this.value);

  @GreaterOrEqualToDatetime(
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
}
//#endregion

//#region GreaterOrEqualToNumber
@flutterModelFormValidator
class GreaterOrEqualToNumberTest {
  GreaterOrEqualToNumberTest(this.value, this.valueToCompare);

  @GreaterOrEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToNumberWithUserAndDeveloperValuesTest {
  GreaterOrEqualToNumberWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @GreaterOrEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToNumberWithUserValuesTest {
  GreaterOrEqualToNumberWithUserValuesTest(this.value, this.valueToCompare);

  @GreaterOrEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToNumberWithDeveloperValuesTest {
  GreaterOrEqualToNumberWithDeveloperValuesTest(this.value);

  @GreaterOrEqualToNumber(
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  final num value;
}
//#endregion

//#region GreaterOrEqualToString
@flutterModelFormValidator
class GreaterOrEqualToStringTest {
  GreaterOrEqualToStringTest(this.value, this.valueToCompare);

  @GreaterOrEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToStringWithUserAndDeveloperValuesTest {
  GreaterOrEqualToStringWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @GreaterOrEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToStringWithUserValuesTest {
  GreaterOrEqualToStringWithUserValuesTest(this.value, this.valueToCompare);

  @GreaterOrEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToStringWithDeveloperValuesTest {
  GreaterOrEqualToStringWithDeveloperValuesTest(this.value);

  @GreaterOrEqualToString(
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
}
//#endregion

//#region GreaterThanDatetime
@flutterModelFormValidator
class GreaterThanDatetimeTest {
  GreaterThanDatetimeTest(this.value, this.valueToCompare);

  @GreaterThanDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class GreaterThanDatetimeWithUserAndDeveloperValuesTest {
  GreaterThanDatetimeWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @GreaterThanDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class GreaterThanDatetimeWithUserValuesTest {
  GreaterThanDatetimeWithUserValuesTest(this.value, this.valueToCompare);

  @GreaterThanDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class GreaterThanDatetimeWithDeveloperValuesTest {
  GreaterThanDatetimeWithDeveloperValuesTest(this.value);

  @GreaterThanDatetime(
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
}
//#endregion

//#region GreaterThanNumber
@flutterModelFormValidator
class GreaterThanNumberTest {
  GreaterThanNumberTest(this.value, this.valueToCompare);

  @GreaterThanNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class GreaterThanNumberWithUserAndDeveloperValuesTest {
  GreaterThanNumberWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @GreaterThanNumber(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class GreaterThanNumberWithUserValuesTest {
  GreaterThanNumberWithUserValuesTest(this.value, this.valueToCompare);

  @GreaterThanNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class GreaterThanNumberWithDeveloperValuesTest {
  GreaterThanNumberWithDeveloperValuesTest(this.value);

  @GreaterThanNumber(
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  final num value;
}
//#endregion

//#region GreaterThanString
@flutterModelFormValidator
class GreaterThanStringTest {
  GreaterThanStringTest(this.value, this.valueToCompare);

  @GreaterThanString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class GreaterThanStringWithUserAndDeveloperValuesTest {
  GreaterThanStringWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @GreaterThanString(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class GreaterThanStringWithUserValuesTest {
  GreaterThanStringWithUserValuesTest(this.value, this.valueToCompare);

  @GreaterThanString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class GreaterThanStringWithDeveloperValuesTest {
  GreaterThanStringWithDeveloperValuesTest(this.value);

  @GreaterThanString(
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
}
//#endregion

//#region ImageSize
@flutterModelFormValidator
class ImageSizeTest {
  ImageSizeTest(this.value);

  @ImageSize(
    minWidth: 500,
    minHeight: 500,
    maxWidth: 1000,
    maxHeight: 1000,
    error: 'Taille d\'image incorrecte',
  )
  final File value;
}
//#endregion

//#region InText
@flutterModelFormValidator
class InTextTest {
  InTextTest(this.value, this.text);

  @InText(
    textOnProperty: 'text',
    error: 'Keyword is not in the string',
  )
  final String value;
  final String text;
}

@flutterModelFormValidator
class InTextWithUserAndDeveloperValuesTest {
  InTextWithUserAndDeveloperValuesTest(this.value, this.text);

  @InText(
    textOnProperty: 'text',
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    error: 'Keyword is not in the string',
  )
  final String value;
  final String text;
}

@flutterModelFormValidator
class InTextWithUserValuesTest {
  InTextWithUserValuesTest(this.value, this.text);

  @InText(
    textOnProperty: 'text',
    error: 'Keyword is not in the string',
  )
  final String value;
  final String text;
}

@flutterModelFormValidator
class InTextWithDeveloperValuesTest {
  InTextWithDeveloperValuesTest(this.value);

  @InText(
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    error: 'Keyword is not in the string',
  )
  final String value;
}
//#endregion

//#region MembershipPassword
@flutterModelFormValidator
class MembershipPasswordTest {
  MembershipPasswordTest(this.value);

  @MembershipPassword(
    minLength: 8,
    maxLength: 16,
    includesAlphabeticalCharacters: true,
    includesUppercaseCharacters: true,
    includesNumericalCharacters: true,
    includesSpecialCharacters: true,
    error: 'Invalid password',
  )
  final String value;
}
//#endregion

//#region NotEqualToDatetime
@flutterModelFormValidator
class NotEqualToDatetimeTest {
  NotEqualToDatetimeTest(this.value, this.valueToCompare);

  @NotEqualToDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class NotEqualToDatetimeWithUserAndDeveloperValuesTest {
  NotEqualToDatetimeWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @NotEqualToDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class NotEqualToDatetimeWithUserValuesTest {
  NotEqualToDatetimeWithUserValuesTest(this.value, this.valueToCompare);

  @NotEqualToDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class NotEqualToDatetimeWithDeveloperValuesTest {
  NotEqualToDatetimeWithDeveloperValuesTest(this.value);

  @NotEqualToDatetime(
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
}
//#endregion

//#region NotEqualToNumber
@flutterModelFormValidator
class NotEqualToNumberTest {
  NotEqualToNumberTest(this.value, this.valueToCompare);

  @NotEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class NotEqualToNumberWithUserAndDeveloperValuesTest {
  NotEqualToNumberWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @NotEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class NotEqualToNumberWithUserValuesTest {
  NotEqualToNumberWithUserValuesTest(this.value, this.valueToCompare);

  @NotEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class NotEqualToNumberWithDeveloperValuesTest {
  NotEqualToNumberWithDeveloperValuesTest(this.value);

  @NotEqualToNumber(
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  final num value;
}
//#endregion

//#region NotEqualToString
@flutterModelFormValidator
class NotEqualToStringTest {
  NotEqualToStringTest(this.value, this.valueToCompare);

  @NotEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class NotEqualToStringWithUserAndDeveloperValuesTest {
  NotEqualToStringWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @NotEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class NotEqualToStringWithUserValuesTest {
  NotEqualToStringWithUserValuesTest(this.value, this.valueToCompare);

  @NotEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class NotEqualToStringWithDeveloperValuesTest {
  NotEqualToStringWithDeveloperValuesTest(this.value);

  @NotEqualToString(
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
}
//#endregion

//#region NumberRange
@flutterModelFormValidator
class NumberRangeTest {
  NumberRangeTest(this.value, this.min, this.max);

  @NumberRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'This Number is not in the range',
  )
  final num value;
  final num min;
  final num max;
}

@flutterModelFormValidator
class NumberRangeWithUserAndDeveloperValuesTest {
  NumberRangeWithUserAndDeveloperValuesTest(this.value, this.min, this.max);

  @NumberRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    min: -10,
    max: -1,
    error: 'This Number is not in the range',
  )
  final num value;
  final num min;
  final num max;
}

@flutterModelFormValidator
class NumberRangeWithUserValuesTest {
  NumberRangeWithUserValuesTest(this.value, this.min, this.max);

  @NumberRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'This Number is not in the range',
  )
  final num value;
  final num min;
  final num max;
}

@flutterModelFormValidator
class NumberRangeWithDeveloperValuesTest {
  NumberRangeWithDeveloperValuesTest(this.value);

  @NumberRange(
    min: -10,
    max: -1,
    error: 'This Number is not in the range',
  )
  final num value;
}
//#endregion

//#region PhoneNumber
@flutterModelFormValidator
class PhoneNumberTest {
  PhoneNumberTest(this.value, this.countryCode, this.phoneNumberType);

  @PhoneNumber(
    phoneNumberTypeOnProperty: 'phoneNumberType',
    countryCodeOnProperty: 'countryCode',
    error: 'Invalid phone number',
  )
  final String value;
  final String countryCode;
  final PhoneNumberType phoneNumberType;
}

@flutterModelFormValidator
class PhoneNumberWithUserAndDeveloperValuesTest {
  PhoneNumberWithUserAndDeveloperValuesTest(
      this.value, this.countryCode, this.phoneNumberType);

  @PhoneNumber(
    countryCodeOnProperty: 'countryCode',
    phoneNumberTypeOnProperty: 'phoneNumberType',
    countryCode: 'US',
    phoneNumberType: PhoneNumberType.mobile,
    error: 'Invalid phone number',
  )
  final String value;
  final String countryCode;
  final PhoneNumberType phoneNumberType;
}

@flutterModelFormValidator
class PhoneNumberWithUserValuesTest {
  PhoneNumberWithUserValuesTest(
      this.value, this.countryCode, this.phoneNumberType);

  @PhoneNumber(
    countryCodeOnProperty: 'countryCode',
    phoneNumberTypeOnProperty: 'phoneNumberType',
    error: 'Invalid phone number',
  )
  final String value;
  final String countryCode;
  final PhoneNumberType phoneNumberType;
}

@flutterModelFormValidator
class PhoneNumberWithDeveloperValuesTest {
  PhoneNumberWithDeveloperValuesTest(this.value);

  @PhoneNumber(
    countryCode: 'US',
    phoneNumberType: PhoneNumberType.mobile,
    error: 'Invalid phone number',
  )
  final String value;
}
//#endregion

//#region RegularExpression
@flutterModelFormValidator
class RegularExpressionTest {
  RegularExpressionTest(this.value);

  @RegularExpression(
    expression: r'^Hello|Bye$',
    error: 'Invalid regular expression',
  )
  final String value;
}
//#endregion

//#region Required
@flutterModelFormValidator
class RequiredTest {
  RequiredTest(this.value);

  @Required(
    error: 'Value is required',
  )
  final String value;
}
//#endregion

//#region SmallerOrEqualToDatetime
@flutterModelFormValidator
class SmallerOrEqualToDatetimeTest {
  SmallerOrEqualToDatetimeTest(this.value, this.valueToCompare);

  @SmallerOrEqualToDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToDatetimeWithUserAndDeveloperValuesTest {
  SmallerOrEqualToDatetimeWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @SmallerOrEqualToDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToDatetimeWithUserValuesTest {
  SmallerOrEqualToDatetimeWithUserValuesTest(this.value, this.valueToCompare);

  @SmallerOrEqualToDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToDatetimeWithDeveloperValuesTest {
  SmallerOrEqualToDatetimeWithDeveloperValuesTest(this.value);

  @SmallerOrEqualToDatetime(
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
}
//#endregion

//#region SmallerOrEqualToNumber
@flutterModelFormValidator
class SmallerOrEqualToNumberTest {
  SmallerOrEqualToNumberTest(this.value, this.valueToCompare);

  @SmallerOrEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToNumberWithUserAndDeveloperValuesTest {
  SmallerOrEqualToNumberWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @SmallerOrEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToNumberWithUserValuesTest {
  SmallerOrEqualToNumberWithUserValuesTest(this.value, this.valueToCompare);

  @SmallerOrEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToNumberWithDeveloperValuesTest {
  SmallerOrEqualToNumberWithDeveloperValuesTest(this.value);

  @SmallerOrEqualToNumber(
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  final num value;
}
//#endregion

//#region SmallerOrEqualToString
@flutterModelFormValidator
class SmallerOrEqualToStringTest {
  SmallerOrEqualToStringTest(this.value, this.valueToCompare);

  @SmallerOrEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToStringWithUserAndDeveloperValuesTest {
  SmallerOrEqualToStringWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @SmallerOrEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToStringWithUserValuesTest {
  SmallerOrEqualToStringWithUserValuesTest(this.value, this.valueToCompare);

  @SmallerOrEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToStringWithDeveloperValuesTest {
  SmallerOrEqualToStringWithDeveloperValuesTest(this.value);

  @SmallerOrEqualToString(
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
}
//#endregion

//#region SmallerThanDatetime
@flutterModelFormValidator
class SmallerThanDatetimeTest {
  SmallerThanDatetimeTest(this.value, this.valueToCompare);

  @SmallerThanDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class SmallerThanDatetimeWithUserAndDeveloperValuesTest {
  SmallerThanDatetimeWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @SmallerThanDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class SmallerThanDatetimeWithUserValuesTest {
  SmallerThanDatetimeWithUserValuesTest(this.value, this.valueToCompare);

  @SmallerThanDatetime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
  final DateTime valueToCompare;
}

@flutterModelFormValidator
class SmallerThanDatetimeWithDeveloperValuesTest {
  SmallerThanDatetimeWithDeveloperValuesTest(this.value);

  @SmallerThanDatetime(
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  final DateTime value;
}
//#endregion

//#region SmallerThanNumber
@flutterModelFormValidator
class SmallerThanNumberTest {
  SmallerThanNumberTest(this.value, this.valueToCompare);

  @SmallerThanNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class SmallerThanNumberWithUserAndDeveloperValuesTest {
  SmallerThanNumberWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @SmallerThanNumber(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class SmallerThanNumberWithUserValuesTest {
  SmallerThanNumberWithUserValuesTest(this.value, this.valueToCompare);

  @SmallerThanNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final num value;
  final num valueToCompare;
}

@flutterModelFormValidator
class SmallerThanNumberWithDeveloperValuesTest {
  SmallerThanNumberWithDeveloperValuesTest(this.value);

  @SmallerThanNumber(
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  final num value;
}
//#endregion

//#region SmallerThanString
@flutterModelFormValidator
class SmallerThanStringTest {
  SmallerThanStringTest(this.value, this.valueToCompare);

  @SmallerThanString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class SmallerThanStringWithUserAndDeveloperValuesTest {
  SmallerThanStringWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @SmallerThanString(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class SmallerThanStringWithUserValuesTest {
  SmallerThanStringWithUserValuesTest(this.value, this.valueToCompare);

  @SmallerThanString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
  final String valueToCompare;
}

@flutterModelFormValidator
class SmallerThanStringWithDeveloperValuesTest {
  SmallerThanStringWithDeveloperValuesTest(this.value);

  @SmallerThanString(
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  final String value;
}
//#endregion

//#region StringLength
@flutterModelFormValidator
class StringLengthTest {
  StringLengthTest(this.value);

  @StringLength(
    min: 10,
    max: 20,
    error: '"value" property must have between 10 and 20 characters',
  )
  final String value;
}
//#endregion

//#region StringRange
@flutterModelFormValidator
class StringRangeTest {
  StringRangeTest(this.value, this.min, this.max);

  @StringRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'This string is not in the range',
  )
  final String value;
  final String min;
  final String max;
}

@flutterModelFormValidator
class StringRangeWithUserAndDeveloperValuesTest {
  StringRangeWithUserAndDeveloperValuesTest(this.value, this.min, this.max);

  @StringRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    min: 'a',
    max: 'd',
    error: 'This String is not in the range',
  )
  final String value;
  final String min;
  final String max;
}

@flutterModelFormValidator
class StringRangeWithUserValuesTest {
  StringRangeWithUserValuesTest(this.value, this.min, this.max);

  @StringRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'This String is not in the range',
  )
  final String value;
  final String min;
  final String max;
}

@flutterModelFormValidator
class StringRangeWithDeveloperValuesTest {
  StringRangeWithDeveloperValuesTest(this.value);

  @StringRange(
    min: 'a',
    max: 'd',
    error: 'This String is not in the range',
  )
  final String value;
}
//#endregion

//#region URL
@flutterModelFormValidator
class UrlTest {
  UrlTest(this.value);

  @URL(
    error: 'Invalid URL',
  )
  final String value;
}
//#endregion
