import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

/*group('xxxx.', () {
    group('Test the priority between user and developer static data.', () {});
    group('Test the validation > success.', () {});
    group('Test the validation > failure.', () {});
  });*/

void main() {}

@flutterModelFormValidator
class ComplexFormTest with PropertyChangeNotifier<String> {
  ComplexFormTest(
      this.firstName, this.lastName, this.birthDay, this.dateOfDeath);

  @Required(error: 'firstname is required')
  @StringLength(min: 3, max: 50, error: 'Invalid string length')
  String firstName;

  @Required(error: 'lastname is required')
  @StringLength(min: 3, max: 50, error: 'Invalid string length')
  String lastName;

  @Required(error: 'birthday is required')
  DateTime birthDay;

  @GreaterOrEqualToDateTime(
      valueToCompareOnProperty: 'birthDay',
      error: 'date of death must be greater or equal to birthday')
  @SmallerOrEqualToDateTime(
      valueToCompare: '2020-01-01',
      error: 'date of death must be smaller or equal than 2020-01-01')
  DateTime dateOfDeath;

  // getters
  String get first_name => this.firstName;
  String get last_name => this.lastName;
  DateTime get birth_day => this.birthDay;
  DateTime get date_of_death => this.dateOfDeath;

  // setters
  set first_name(String firstName) {
    this.firstName = firstName;
    notifyListeners('firstName');
  }

  set last_name(String lastName) {
    this.lastName = lastName;
    notifyListeners('lastName');
  }

  set birth_day(DateTime birthDay) {
    this.birthDay = birthDay;
    notifyListeners('birthDay');
  }

  set date_of_death(DateTime dateOfDeath) {
    this.dateOfDeath = dateOfDeath;
    notifyListeners('dateOfDeath');
  }
}

//#region ContainsDateTime
@flutterModelFormValidator
class ContainsDateTimeTest with PropertyChangeNotifier<String> {
  ContainsDateTimeTest(this.value);

  @ContainsDateTime(
    items: ['2020-01-01', '2020-06-01', '2020-12-31'],
    error: 'Invalid datetime',
  )
  DateTime value;
}
//#endregion

//#region ContainsNumber
@flutterModelFormValidator
class ContainsNumberTest with PropertyChangeNotifier<String> {
  ContainsNumberTest(this.value);

  @ContainsNumber(
    items: [1, 2, 3],
    error: 'Invalid number',
  )
  num value;
}
//#endregion

//#region ContainsString
@flutterModelFormValidator
class ContainsStringTest with PropertyChangeNotifier<String> {
  ContainsStringTest(this.value);

  @ContainsString(
    items: ['lorem', 'ipsum', 'dolor', 'sit', 'amet'],
    error: 'Invalid keyword',
  )
  String value;
}
//#endregion

//#region DateTimeRange
@flutterModelFormValidator
class DateTimeRangeTest with PropertyChangeNotifier<String> {
  DateTimeRangeTest(this.value, this.min, this.max);

  @DateTimeRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'This datetime is not in the range',
  )
  DateTime value;
  DateTime min;
  DateTime max;
}

@flutterModelFormValidator
class DateTimeRangeWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  DateTimeRangeWithUserAndDeveloperValuesTest(this.value, this.min, this.max);

  @DateTimeRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    min: '2019-01-01',
    max: '2019-12-31',
    error: 'This datetime is not in the range',
  )
  DateTime value;
  DateTime min;
  DateTime max;
}

@flutterModelFormValidator
class DateTimeRangeWithUserValuesTest with PropertyChangeNotifier<String> {
  DateTimeRangeWithUserValuesTest(this.value, this.min, this.max);

  @DateTimeRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'This datetime is not in the range',
  )
  DateTime value;
  DateTime min;
  DateTime max;
}

@flutterModelFormValidator
class DateTimeRangeWithDeveloperValuesTest with PropertyChangeNotifier<String> {
  DateTimeRangeWithDeveloperValuesTest(this.value);

  @DateTimeRange(
    min: '2019-01-01',
    max: '2019-12-31',
    error: 'This datetime is not in the range',
  )
  DateTime value;
}
//#endregion

//#region Email
@flutterModelFormValidator
class EmailTest with PropertyChangeNotifier<String> {
  EmailTest(this.value);

  @Email(
    error: 'Invalid email',
  )
  String value;
}
//#endregion

//#region EqualToDatetime
@flutterModelFormValidator
class EqualToDatetimeTest with PropertyChangeNotifier<String> {
  EqualToDatetimeTest(this.value, this.valueToCompare);

  @EqualToDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class EqualToDatetimeWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  EqualToDatetimeWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @EqualToDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class EqualToDatetimeWithUserValuesTest with PropertyChangeNotifier<String> {
  EqualToDatetimeWithUserValuesTest(this.value, this.valueToCompare);

  @EqualToDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class EqualToDatetimeWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  EqualToDatetimeWithDeveloperValuesTest(this.value);

  @EqualToDateTime(
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
}
//#endregion

//#region EqualToNumber
@flutterModelFormValidator
class EqualToNumberTest with PropertyChangeNotifier<String> {
  EqualToNumberTest(this.value, this.valueToCompare);

  @EqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class EqualToNumberWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  EqualToNumberWithUserAndDeveloperValuesTest(this.value, this.valueToCompare);

  @EqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class EqualToNumberWithUserValuesTest with PropertyChangeNotifier<String> {
  EqualToNumberWithUserValuesTest(this.value, this.valueToCompare);

  @EqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class EqualToNumberWithDeveloperValuesTest with PropertyChangeNotifier<String> {
  EqualToNumberWithDeveloperValuesTest(this.value);

  @EqualToNumber(
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  num value;
}
//#endregion

//#region EqualToString
@flutterModelFormValidator
class EqualToStringTest with PropertyChangeNotifier<String> {
  EqualToStringTest(this.value, this.valueToCompare);

  @EqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class EqualToStringWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  EqualToStringWithUserAndDeveloperValuesTest(this.value, this.valueToCompare);

  @EqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class EqualToStringWithUserValuesTest with PropertyChangeNotifier<String> {
  EqualToStringWithUserValuesTest(this.value, this.valueToCompare);

  @EqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class EqualToStringWithDeveloperValuesTest with PropertyChangeNotifier<String> {
  EqualToStringWithDeveloperValuesTest(this.value);

  @EqualToString(
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  String value;
}
//#endregion

//#region FileMimeType
@flutterModelFormValidator
class FileMimeTypeTest with PropertyChangeNotifier<String> {
  FileMimeTypeTest(this.value);

  @FileMimeType(
    mimeTypes: ['image/jpeg', 'image/bmp'],
    error: 'Invalid mime type',
  )
  List<int> value;
}
//#endregion

//#region FileSize
@flutterModelFormValidator
class FileSizeTest with PropertyChangeNotifier<String> {
  FileSizeTest(this.value);

  @FileSize(
    size: 1048576,
    error: 'Invalid file size',
  )
  List<int> value;
}
//#endregion

//#region GreaterOrEqualToDatetime
@flutterModelFormValidator
class GreaterOrEqualToDatetimeTest with PropertyChangeNotifier<String> {
  GreaterOrEqualToDatetimeTest(this.value, this.valueToCompare);

  @GreaterOrEqualToDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @GreaterOrEqualToDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToDatetimeWithUserValuesTest
    with PropertyChangeNotifier<String> {
  GreaterOrEqualToDatetimeWithUserValuesTest(this.value, this.valueToCompare);

  @GreaterOrEqualToDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToDatetimeWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  GreaterOrEqualToDatetimeWithDeveloperValuesTest(this.value);

  @GreaterOrEqualToDateTime(
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
}
//#endregion

//#region GreaterOrEqualToNumber
@flutterModelFormValidator
class GreaterOrEqualToNumberTest with PropertyChangeNotifier<String> {
  GreaterOrEqualToNumberTest(this.value, this.valueToCompare);

  @GreaterOrEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToNumberWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  GreaterOrEqualToNumberWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @GreaterOrEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToNumberWithUserValuesTest
    with PropertyChangeNotifier<String> {
  GreaterOrEqualToNumberWithUserValuesTest(this.value, this.valueToCompare);

  @GreaterOrEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToNumberWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  GreaterOrEqualToNumberWithDeveloperValuesTest(this.value);

  @GreaterOrEqualToNumber(
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  num value;
}
//#endregion

//#region GreaterOrEqualToString
@flutterModelFormValidator
class GreaterOrEqualToStringTest with PropertyChangeNotifier<String> {
  GreaterOrEqualToStringTest(this.value, this.valueToCompare);

  @GreaterOrEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToStringWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  GreaterOrEqualToStringWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @GreaterOrEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToStringWithUserValuesTest
    with PropertyChangeNotifier<String> {
  GreaterOrEqualToStringWithUserValuesTest(this.value, this.valueToCompare);

  @GreaterOrEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class GreaterOrEqualToStringWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  GreaterOrEqualToStringWithDeveloperValuesTest(this.value);

  @GreaterOrEqualToString(
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  String value;
}
//#endregion

//#region GreaterThanDatetime
@flutterModelFormValidator
class GreaterThanDatetimeTest with PropertyChangeNotifier<String> {
  GreaterThanDatetimeTest(this.value, this.valueToCompare);

  @GreaterThanDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class GreaterThanDatetimeWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  GreaterThanDatetimeWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @GreaterThanDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class GreaterThanDatetimeWithUserValuesTest
    with PropertyChangeNotifier<String> {
  GreaterThanDatetimeWithUserValuesTest(this.value, this.valueToCompare);

  @GreaterThanDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class GreaterThanDatetimeWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  GreaterThanDatetimeWithDeveloperValuesTest(this.value);

  @GreaterThanDateTime(
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
}
//#endregion

//#region GreaterThanNumber
@flutterModelFormValidator
class GreaterThanNumberTest with PropertyChangeNotifier<String> {
  GreaterThanNumberTest(this.value, this.valueToCompare);

  @GreaterThanNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class GreaterThanNumberWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  GreaterThanNumberWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @GreaterThanNumber(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class GreaterThanNumberWithUserValuesTest with PropertyChangeNotifier<String> {
  GreaterThanNumberWithUserValuesTest(this.value, this.valueToCompare);

  @GreaterThanNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class GreaterThanNumberWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  GreaterThanNumberWithDeveloperValuesTest(this.value);

  @GreaterThanNumber(
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  num value;
}
//#endregion

//#region GreaterThanString
@flutterModelFormValidator
class GreaterThanStringTest with PropertyChangeNotifier<String> {
  GreaterThanStringTest(this.value, this.valueToCompare);

  @GreaterThanString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class GreaterThanStringWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  GreaterThanStringWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @GreaterThanString(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class GreaterThanStringWithUserValuesTest with PropertyChangeNotifier<String> {
  GreaterThanStringWithUserValuesTest(this.value, this.valueToCompare);

  @GreaterThanString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class GreaterThanStringWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  GreaterThanStringWithDeveloperValuesTest(this.value);

  @GreaterThanString(
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  String value;
}
//#endregion

//#region ImageSize
@flutterModelFormValidator
class ImageSizeTest with PropertyChangeNotifier<String> {
  ImageSizeTest(this.value);

  @ImageSize(
    minWidth: 500,
    minHeight: 500,
    maxWidth: 1000,
    maxHeight: 1000,
    error: 'Taille d\'image incorrecte',
  )
  List<int> value;
}
//#endregion

//#region InText
@flutterModelFormValidator
class InTextTest with PropertyChangeNotifier<String> {
  InTextTest(this.value, this.text);

  @InText(
    textOnProperty: 'text',
    error: 'Keyword is not in the string',
  )
  String value;
  String text;
}

@flutterModelFormValidator
class InTextWithUserAndDeveloperValuesTest with PropertyChangeNotifier<String> {
  InTextWithUserAndDeveloperValuesTest(this.value, this.text);

  @InText(
    textOnProperty: 'text',
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    error: 'Keyword is not in the string',
  )
  String value;
  String text;
}

@flutterModelFormValidator
class InTextWithUserValuesTest with PropertyChangeNotifier<String> {
  InTextWithUserValuesTest(this.value, this.text);

  @InText(
    textOnProperty: 'text',
    error: 'Keyword is not in the string',
  )
  String value;
  String text;
}

@flutterModelFormValidator
class InTextWithDeveloperValuesTest with PropertyChangeNotifier<String> {
  InTextWithDeveloperValuesTest(this.value);

  @InText(
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    error: 'Keyword is not in the string',
  )
  String value;
}
//#endregion

//#region MembershipPassword
@flutterModelFormValidator
class MembershipPasswordTest with PropertyChangeNotifier<String> {
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
  String value;
}
//#endregion

//#region NotEqualToDatetime
@flutterModelFormValidator
class NotEqualToDatetimeTest with PropertyChangeNotifier<String> {
  NotEqualToDatetimeTest(this.value, this.valueToCompare);

  @NotEqualToDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class NotEqualToDatetimeWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  NotEqualToDatetimeWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @NotEqualToDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class NotEqualToDatetimeWithUserValuesTest with PropertyChangeNotifier<String> {
  NotEqualToDatetimeWithUserValuesTest(this.value, this.valueToCompare);

  @NotEqualToDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class NotEqualToDatetimeWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  NotEqualToDatetimeWithDeveloperValuesTest(this.value);

  @NotEqualToDateTime(
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
}
//#endregion

//#region NotEqualToNumber
@flutterModelFormValidator
class NotEqualToNumberTest with PropertyChangeNotifier<String> {
  NotEqualToNumberTest(this.value, this.valueToCompare);

  @NotEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class NotEqualToNumberWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  NotEqualToNumberWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @NotEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class NotEqualToNumberWithUserValuesTest with PropertyChangeNotifier<String> {
  NotEqualToNumberWithUserValuesTest(this.value, this.valueToCompare);

  @NotEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class NotEqualToNumberWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  NotEqualToNumberWithDeveloperValuesTest(this.value);

  @NotEqualToNumber(
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  num value;
}
//#endregion

//#region NotEqualToString
@flutterModelFormValidator
class NotEqualToStringTest with PropertyChangeNotifier<String> {
  NotEqualToStringTest(this.value, this.valueToCompare);

  @NotEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class NotEqualToStringWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  NotEqualToStringWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @NotEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class NotEqualToStringWithUserValuesTest with PropertyChangeNotifier<String> {
  NotEqualToStringWithUserValuesTest(this.value, this.valueToCompare);

  @NotEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class NotEqualToStringWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  NotEqualToStringWithDeveloperValuesTest(this.value);

  @NotEqualToString(
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  String value;
}
//#endregion

//#region NumberRange
@flutterModelFormValidator
class NumberRangeTest with PropertyChangeNotifier<String> {
  NumberRangeTest(this.value, this.min, this.max);

  @NumberRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'This Number is not in the range',
  )
  num value;
  num min;
  num max;
}

@flutterModelFormValidator
class NumberRangeWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  NumberRangeWithUserAndDeveloperValuesTest(this.value, this.min, this.max);

  @NumberRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    min: -10,
    max: -1,
    error: 'This Number is not in the range',
  )
  num value;
  num min;
  num max;
}

@flutterModelFormValidator
class NumberRangeWithUserValuesTest with PropertyChangeNotifier<String> {
  NumberRangeWithUserValuesTest(this.value, this.min, this.max);

  @NumberRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'This Number is not in the range',
  )
  num value;
  num min;
  num max;
}

@flutterModelFormValidator
class NumberRangeWithDeveloperValuesTest with PropertyChangeNotifier<String> {
  NumberRangeWithDeveloperValuesTest(this.value);

  @NumberRange(
    min: -10,
    max: -1,
    error: 'This Number is not in the range',
  )
  num value;
}
//#endregion

//#region PhoneNumber
@flutterModelFormValidator
class PhoneNumberTest with PropertyChangeNotifier<String> {
  PhoneNumberTest(this.value, this.countryCode, this.phoneNumberType);

  @PhoneNumber(
    phoneNumberTypeOnProperty: 'phoneNumberType',
    countryCodeOnProperty: 'countryCode',
    error: 'Invalid phone number',
  )
  String value;
  String countryCode;
  PhoneNumberType phoneNumberType;
}

@flutterModelFormValidator
class PhoneNumberWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  PhoneNumberWithUserAndDeveloperValuesTest(
      this.value, this.countryCode, this.phoneNumberType);

  @PhoneNumber(
    countryCodeOnProperty: 'countryCode',
    phoneNumberTypeOnProperty: 'phoneNumberType',
    countryCode: 'US',
    phoneNumberType: PhoneNumberType.mobile,
    error: 'Invalid phone number',
  )
  String value;
  String countryCode;
  PhoneNumberType phoneNumberType;
}

@flutterModelFormValidator
class PhoneNumberWithUserValuesTest with PropertyChangeNotifier<String> {
  PhoneNumberWithUserValuesTest(
      this.value, this.countryCode, this.phoneNumberType);

  @PhoneNumber(
    countryCodeOnProperty: 'countryCode',
    phoneNumberTypeOnProperty: 'phoneNumberType',
    error: 'Invalid phone number',
  )
  String value;
  String countryCode;
  PhoneNumberType phoneNumberType;
}

@flutterModelFormValidator
class PhoneNumberWithDeveloperValuesTest with PropertyChangeNotifier<String> {
  PhoneNumberWithDeveloperValuesTest(this.value);

  @PhoneNumber(
    countryCode: 'US',
    phoneNumberType: PhoneNumberType.mobile,
    error: 'Invalid phone number',
  )
  String value;
}
//#endregion

//#region RegularExpression
@flutterModelFormValidator
class RegularExpressionTest with PropertyChangeNotifier<String> {
  RegularExpressionTest(this.value);

  @RegularExpression(
    expression: r'^Hello|Bye$',
    error: 'Invalid regular expression',
  )
  String value;
}
//#endregion

//#region Required
@flutterModelFormValidator
class RequiredTest with PropertyChangeNotifier<String> {
  RequiredTest(this.value);

  @Required(
    error: 'Value is required',
  )
  String value;
}
//#endregion

//#region SmallerOrEqualToDatetime
@flutterModelFormValidator
class SmallerOrEqualToDatetimeTest with PropertyChangeNotifier<String> {
  SmallerOrEqualToDatetimeTest(this.value, this.valueToCompare);

  @SmallerOrEqualToDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToDatetimeWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  SmallerOrEqualToDatetimeWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @SmallerOrEqualToDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToDatetimeWithUserValuesTest
    with PropertyChangeNotifier<String> {
  SmallerOrEqualToDatetimeWithUserValuesTest(this.value, this.valueToCompare);

  @SmallerOrEqualToDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToDatetimeWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  SmallerOrEqualToDatetimeWithDeveloperValuesTest(this.value);

  @SmallerOrEqualToDateTime(
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
}
//#endregion

//#region SmallerOrEqualToNumber
@flutterModelFormValidator
class SmallerOrEqualToNumberTest with PropertyChangeNotifier<String> {
  SmallerOrEqualToNumberTest(this.value, this.valueToCompare);

  @SmallerOrEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToNumberWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  SmallerOrEqualToNumberWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @SmallerOrEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToNumberWithUserValuesTest
    with PropertyChangeNotifier<String> {
  SmallerOrEqualToNumberWithUserValuesTest(this.value, this.valueToCompare);

  @SmallerOrEqualToNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToNumberWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  SmallerOrEqualToNumberWithDeveloperValuesTest(this.value);

  @SmallerOrEqualToNumber(
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  num value;
}
//#endregion

//#region SmallerOrEqualToString
@flutterModelFormValidator
class SmallerOrEqualToStringTest with PropertyChangeNotifier<String> {
  SmallerOrEqualToStringTest(this.value, this.valueToCompare);

  @SmallerOrEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToStringWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  SmallerOrEqualToStringWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @SmallerOrEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToStringWithUserValuesTest
    with PropertyChangeNotifier<String> {
  SmallerOrEqualToStringWithUserValuesTest(this.value, this.valueToCompare);

  @SmallerOrEqualToString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class SmallerOrEqualToStringWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  SmallerOrEqualToStringWithDeveloperValuesTest(this.value);

  @SmallerOrEqualToString(
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  String value;
}
//#endregion

//#region SmallerThanDatetime
@flutterModelFormValidator
class SmallerThanDatetimeTest with PropertyChangeNotifier<String> {
  SmallerThanDatetimeTest(this.value, this.valueToCompare);

  @SmallerThanDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class SmallerThanDatetimeWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  SmallerThanDatetimeWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @SmallerThanDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class SmallerThanDatetimeWithUserValuesTest
    with PropertyChangeNotifier<String> {
  SmallerThanDatetimeWithUserValuesTest(this.value, this.valueToCompare);

  @SmallerThanDateTime(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
  DateTime valueToCompare;
}

@flutterModelFormValidator
class SmallerThanDatetimeWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  SmallerThanDatetimeWithDeveloperValuesTest(this.value);

  @SmallerThanDateTime(
    valueToCompare: '2019-01-01T00:00:00',
    error: 'Value is not equal to the value to compare',
  )
  DateTime value;
}
//#endregion

//#region SmallerThanNumber
@flutterModelFormValidator
class SmallerThanNumberTest with PropertyChangeNotifier<String> {
  SmallerThanNumberTest(this.value, this.valueToCompare);

  @SmallerThanNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class SmallerThanNumberWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  SmallerThanNumberWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @SmallerThanNumber(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class SmallerThanNumberWithUserValuesTest with PropertyChangeNotifier<String> {
  SmallerThanNumberWithUserValuesTest(this.value, this.valueToCompare);

  @SmallerThanNumber(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  num value;
  num valueToCompare;
}

@flutterModelFormValidator
class SmallerThanNumberWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  SmallerThanNumberWithDeveloperValuesTest(this.value);

  @SmallerThanNumber(
    valueToCompare: 1,
    error: 'Value is not equal to the value to compare',
  )
  num value;
}
//#endregion

//#region SmallerThanString
@flutterModelFormValidator
class SmallerThanStringTest with PropertyChangeNotifier<String> {
  SmallerThanStringTest(this.value, this.valueToCompare);

  @SmallerThanString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class SmallerThanStringWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  SmallerThanStringWithUserAndDeveloperValuesTest(
      this.value, this.valueToCompare);

  @SmallerThanString(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class SmallerThanStringWithUserValuesTest with PropertyChangeNotifier<String> {
  SmallerThanStringWithUserValuesTest(this.value, this.valueToCompare);

  @SmallerThanString(
    valueToCompareOnProperty: 'valueToCompare',
    error: 'Value is not equal to the value to compare',
  )
  String value;
  String valueToCompare;
}

@flutterModelFormValidator
class SmallerThanStringWithDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  SmallerThanStringWithDeveloperValuesTest(this.value);

  @SmallerThanString(
    valueToCompare: 'b',
    error: 'Value is not equal to the value to compare',
  )
  String value;
}
//#endregion

//#region StringLength
@flutterModelFormValidator
class StringLengthTest with PropertyChangeNotifier<String> {
  StringLengthTest(this.value);

  @StringLength(
    min: 10,
    max: 20,
    error: '"value" property must have between 10 and 20 characters',
  )
  String value;
}
//#endregion

//#region StringRange
@flutterModelFormValidator
class StringRangeTest with PropertyChangeNotifier<String> {
  StringRangeTest(this.value, this.min, this.max);

  @StringRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'This string is not in the range',
  )
  String value;
  String min;
  String max;
}

@flutterModelFormValidator
class StringRangeWithUserAndDeveloperValuesTest
    with PropertyChangeNotifier<String> {
  StringRangeWithUserAndDeveloperValuesTest(this.value, this.min, this.max);

  @StringRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    min: 'a',
    max: 'd',
    error: 'This String is not in the range',
  )
  String value;
  String min;
  String max;
}

@flutterModelFormValidator
class StringRangeWithUserValuesTest with PropertyChangeNotifier<String> {
  StringRangeWithUserValuesTest(this.value, this.min, this.max);

  @StringRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'This String is not in the range',
  )
  String value;
  String min;
  String max;
}

@flutterModelFormValidator
class StringRangeWithDeveloperValuesTest with PropertyChangeNotifier<String> {
  StringRangeWithDeveloperValuesTest(this.value);

  @StringRange(
    min: 'a',
    max: 'd',
    error: 'This String is not in the range',
  )
  String value;
}
//#endregion

//#region URL
@flutterModelFormValidator
class UrlTest with PropertyChangeNotifier<String> {
  UrlTest(this.value);

  @URL(
    error: 'Invalid URL',
  )
  String value;
}
//#endregion
