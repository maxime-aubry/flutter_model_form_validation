import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

void main() {}

//#region ComplexFormTest
@flutterModelFormValidator
class FormBuilderTest extends ModelForm {
  FormBuilderTest(
    this.firstName,
    this.lastName,
    this.birthDay,
    this.subscriptionDate,
  );

  @FormControlDeclarer()
  @Required(error: 'error message here')
  @StringLength(min: 3, max: 50, error: 'error message here')
  String firstName;

  @FormControlDeclarer()
  @Required(error: 'error message here')
  @StringLength(min: 3, max: 50, error: 'error message here')
  String lastName;

  @FormControlDeclarer()
  @Required(error: 'error message here')
  DateTime birthDay;

  @FormControlDeclarer()
  @Required(error: 'error message here')
  @GreaterOrEqualTo(
    valueToCompareOnProperty: 'birthDay',
    error: 'error message here',
  )
  @SmallerOrEqualTo(valueToCompare: '2020-01-01', error: 'error message here')
  DateTime subscriptionDate;

  @FormArrayDeclarer()
  @NbItems(min: '1', max: '3', error: 'error message here')
  List<Book> books;

  @FormGroupDeclarer()
  @Required(error: 'error message here')
  Book favoriteBook;

  void addItemOnBooks(Book item) {
    if (this.books == null) this.books = new List<Book>();
    this.books.add(item);
  }

  void removeItemOnBook(Book item) {
    if (this.books.contains(item)) this.books.remove(item);
  }
}

@flutterModelFormValidator
class Book extends ModelForm {
  Book(this.name, this.price, this.loanDate);

  @FormControlDeclarer()
  @Required(error: 'error message here')
  @StringLength(min: 3, max: 100, error: 'error message here')
  String name;

  @FormControlDeclarer()
  @Required(error: 'price is required')
  @GreaterThan(valueToCompare: '0', error: 'error message here')
  num price;

  @FormControlDeclarer()
  @Required(error: 'error message here')
  DateTime loanDate;
}
//#endregion

//#region DateTimeRange
@flutterModelFormValidator
class DateTimeRangeTest extends ModelForm {
  DateTimeRangeTest(
    this.value, [
    this.min,
    this.max,
  ]);

  @Range(
    min: '2019-01-01',
    max: '2019-12-31',
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  DateTime value;
  DateTime min;
  DateTime max;
}
//#endregion

//#region Email
@flutterModelFormValidator
class EmailTest extends ModelForm {
  EmailTest(this.value);

  @Email(error: 'error message here')
  String value;
}
//#endregion

//#region EqualToDatetimeTest
@flutterModelFormValidator
class EqualToDatetimeTest extends ModelForm {
  EqualToDatetimeTest(
    this.value, [
    this.valueToCompare = null,
  ]);

  @EqualTo(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  DateTime value;
  DateTime valueToCompare;
}
//#endregion

//#region EqualToNumberTest
@flutterModelFormValidator
class EqualToNumberTest extends ModelForm {
  EqualToNumberTest(
    this.value, [
    this.valueToCompare = null,
  ]);

  @EqualTo(
    valueToCompare: '1',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  num value;
  num valueToCompare;
}
//#endregion

//#region EqualToStringTest
@flutterModelFormValidator
class EqualToStringTest extends ModelForm {
  EqualToStringTest(
    this.value, [
    this.valueToCompare = null,
  ]);

  @EqualTo(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  String value;
  String valueToCompare;
}
//#endregion

//#region FileMimeType
@flutterModelFormValidator
class FileMimeTypeTest extends ModelForm {
  FileMimeTypeTest(this.value);

  @FileMimeType(
    mimeTypes: ['image/jpeg', 'image/bmp'],
    error: 'error message here',
  )
  List<int> value;
}
//#endregion

//#region FileSize
@flutterModelFormValidator
class FileSizeTest extends ModelForm {
  FileSizeTest(this.value);

  @FileSize(
    size: 1048576,
    error: 'error message here',
  )
  List<int> value;
}
//#endregion

//#region GreaterOrEqualToDatetime
@flutterModelFormValidator
class GreaterOrEqualToDatetimeTest extends ModelForm {
  GreaterOrEqualToDatetimeTest(
    this.value, [
    this.valueToCompare,
  ]);

  @GreaterOrEqualTo(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'error message here',
  )
  DateTime value;
  DateTime valueToCompare;
}
//#endregion

//#region GreaterOrEqualToNumber
@flutterModelFormValidator
class GreaterOrEqualToNumberTest extends ModelForm {
  GreaterOrEqualToNumberTest(
    this.value, [
    this.valueToCompare,
  ]);

  @GreaterOrEqualTo(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '1',
    error: 'error message here',
  )
  num value;
  num valueToCompare;
}
//#endregion

//#region GreaterOrEqualToString
@flutterModelFormValidator
class GreaterOrEqualToStringTest extends ModelForm {
  GreaterOrEqualToStringTest(
    this.value, [
    this.valueToCompare,
  ]);

  @GreaterOrEqualTo(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'error message here',
  )
  String value;
  String valueToCompare;
}
//#endregion

//#region GreaterThanDatetime
@flutterModelFormValidator
class GreaterThanDatetimeTest extends ModelForm {
  GreaterThanDatetimeTest(
    this.value, [
    this.valueToCompare,
  ]);

  @GreaterThan(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  DateTime value;
  DateTime valueToCompare;
}
//#endregion

//#region GreaterThanNumber
@flutterModelFormValidator
class GreaterThanNumberTest extends ModelForm {
  GreaterThanNumberTest(
    this.value, [
    this.valueToCompare,
  ]);

  @GreaterThan(
    valueToCompare: '1',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  num value;
  num valueToCompare;
}
//#endregion

//#region GreaterThanString
@flutterModelFormValidator
class GreaterThanStringTest extends ModelForm {
  GreaterThanStringTest(
    this.value, [
    this.valueToCompare,
  ]);

  @GreaterThan(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  String value;
  String valueToCompare;
}
//#endregion

//#region ImageSize
@flutterModelFormValidator
class ImageSizeTest extends ModelForm {
  ImageSizeTest(this.value);

  @ImageSize(
    minWidth: 500,
    minHeight: 500,
    maxWidth: 1000,
    maxHeight: 1000,
    error: 'error message here',
  )
  List<int> value;
}
//#endregion

//#region InText
@flutterModelFormValidator
class InTextTest extends ModelForm {
  InTextTest(
    this.value, [
    this.text,
  ]);

  @InText(
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    textOnProperty: 'text',
    error: 'error message here',
  )
  String value;
  String text;
}
//#endregion

//#region MultiSelectDatetime
@flutterModelFormValidator
class MultiSelectDatetimeTest extends ModelForm {
  MultiSelectDatetimeTest(this.value);

  @MultiSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  List<DateTime> value;
}
//#endregion

//#region MultiSelectNumber
@flutterModelFormValidator
class MultiSelectNumberTest extends ModelForm {
  MultiSelectNumberTest(this.value);

  @MultiSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  List<num> value;
}
//#region

//#region MultiSelectString
@flutterModelFormValidator
class MultiSelectStringTest extends ModelForm {
  MultiSelectStringTest(this.value);

  @MultiSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  List<String> value;
}
//#endregion

//#region MembershipPassword
@flutterModelFormValidator
class MembershipPasswordTest extends ModelForm {
  MembershipPasswordTest(this.value);

  @MembershipPassword(
    minLength: 8,
    maxLength: 16,
    includesAlphabeticalCharacters: true,
    includesUppercaseCharacters: true,
    includesNumericalCharacters: true,
    includesSpecialCharacters: true,
    error: 'error message here',
  )
  String value;
}
//#endregion

//#region NbItems
@flutterModelFormValidator
class NbItemsTest extends ModelForm {
  NbItemsTest(
    this.value, [
    this.min,
    this.max,
  ]);

  @NbItems(
    min: '1',
    max: '3',
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  List<String> value;
  int min;
  int max;
}
//#endregion

//#region NotEqualToDatetimeTest
@flutterModelFormValidator
class NotEqualToDatetimeTest extends ModelForm {
  NotEqualToDatetimeTest(
    this.value, [
    this.valueToCompare = null,
  ]);

  @NotEqualTo(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  DateTime value;
  DateTime valueToCompare;
}
//#endregion

//#region NotEqualToNumberTest
@flutterModelFormValidator
class NotEqualToNumberTest extends ModelForm {
  NotEqualToNumberTest(
    this.value, [
    this.valueToCompare = null,
  ]);

  @NotEqualTo(
    valueToCompare: '1',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  num value;
  num valueToCompare;
}
//#endregion

//#region NotEqualToStringTest
@flutterModelFormValidator
class NotEqualToStringTest extends ModelForm {
  NotEqualToStringTest(
    this.value, [
    this.valueToCompare = null,
  ]);

  @NotEqualTo(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  String value;
  String valueToCompare;
}
//#endregion

//#region NumberRange
@flutterModelFormValidator
class NumberRangeTest extends ModelForm {
  NumberRangeTest(
    this.value, [
    this.min,
    this.max,
  ]);

  @Range(
    min: '-10',
    max: '-1',
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  num value;
  num min;
  num max;
}
//#endregion

//#region PhoneNumber
@flutterModelFormValidator
class PhoneNumberTest extends ModelForm {
  PhoneNumberTest(
    this.value, [
    this.countryCode,
    this.phoneNumberType,
  ]);

  @PhoneNumber(
    phoneNumberTypeOnProperty: 'phoneNumberType',
    countryCodeOnProperty: 'countryCode',
    error: 'error message here',
  )
  String value;
  String countryCode;
  String phoneNumberType;
}
//#endregion

//#region RegularExpression
@flutterModelFormValidator
class RegularExpressionTest extends ModelForm {
  RegularExpressionTest(this.value);

  @RegularExpression(
    expression: r'^Hello|Bye$',
    error: 'error message here',
  )
  String value;
}
//#endregion

//#region Required
@flutterModelFormValidator
class RequiredTest extends ModelForm {
  RequiredTest(this.value);

  @Required(error: 'error message here')
  String value;
}
//#endregion

//#region SingleSelectDateTime
@flutterModelFormValidator
class SingleSelectDatetimeTest extends ModelForm {
  SingleSelectDatetimeTest(this.value);

  @SingleSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  DateTime value;
}
//#endregion

//#region SingleSelectNumber
@flutterModelFormValidator
class SingleSelectNumberTest extends ModelForm {
  SingleSelectNumberTest(this.value);

  @SingleSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  num value;
}
//#region

//#region SingleSelectString
@flutterModelFormValidator
class SingleSelectStringTest extends ModelForm {
  SingleSelectStringTest(this.value);

  @SingleSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  String value;
}
//#endregion

//#region SmallerOrEqualToDatetime
@flutterModelFormValidator
class SmallerOrEqualToDatetimeTest extends ModelForm {
  SmallerOrEqualToDatetimeTest(
    this.value, [
    this.valueToCompare,
  ]);

  @SmallerOrEqualTo(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  DateTime value;
  DateTime valueToCompare;
}
//#endregion

//#region SmallerOrEqualToNumber
@flutterModelFormValidator
class SmallerOrEqualToNumberTest extends ModelForm {
  SmallerOrEqualToNumberTest(
    this.value, [
    this.valueToCompare,
  ]);

  @SmallerOrEqualTo(
    valueToCompare: '1',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  num value;
  num valueToCompare;
}
//#endregion

//#region SmallerOrEqualToString
@flutterModelFormValidator
class SmallerOrEqualToStringTest extends ModelForm {
  SmallerOrEqualToStringTest(
    this.value, [
    this.valueToCompare,
  ]);

  @SmallerOrEqualTo(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  String value;
  String valueToCompare;
}
//#endregion

//#region SmallerThanDatetime
@flutterModelFormValidator
class SmallerThanDatetimeTest extends ModelForm {
  SmallerThanDatetimeTest(
    this.value, [
    this.valueToCompare,
  ]);

  @SmallerThan(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  DateTime value;
  DateTime valueToCompare;
}
//#endregion

//#region SmallerThanNumber
@flutterModelFormValidator
class SmallerThanNumberTest extends ModelForm {
  SmallerThanNumberTest(
    this.value, [
    this.valueToCompare,
  ]);

  @SmallerThan(
    valueToCompare: '1',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  num value;
  num valueToCompare;
}
//#endregion

//#region SmallerThanString
@flutterModelFormValidator
class SmallerThanStringTest extends ModelForm {
  SmallerThanStringTest(
    this.value, [
    this.valueToCompare,
  ]);

  @SmallerThan(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  String value;
  String valueToCompare;
}
//#endregion

//#region StringLength
@flutterModelFormValidator
class StringLengthTest extends ModelForm {
  StringLengthTest(
    this.value,
  );

  @StringLength(
    min: 10,
    max: 20,
    error: 'error message here',
  )
  String value;
}
//#endregion

//#region StringRange
@flutterModelFormValidator
class StringRangeTest extends ModelForm {
  StringRangeTest(
    this.value, [
    this.min,
    this.max,
  ]);

  @Range(
    min: 'a',
    max: 'd',
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  String value;
  String min;
  String max;
}
//#endregion

//#region URL
@flutterModelFormValidator
class UrlTest extends ModelForm {
  UrlTest(
    this.value,
  );

  @URL(
    error: 'error message here',
  )
  String value;
}
//#endregion
