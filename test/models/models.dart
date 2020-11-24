import 'dart:typed_data';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

void main() {}

//#region ComplexFormTest
@flutterModelFormValidator
class FormBuilderTest extends ModelForm {
  FormBuilderTest(
    String firstName,
    String lastName,
    DateTime birthDay,
    DateTime subscriptionDate,
  ) {
    this.firstName = new FormControlElement<String>(firstName);
    this.lastName = new FormControlElement<String>(lastName);
    this.birthDay = new FormControlElement<DateTime>(birthDay);
    this.subscriptionDate = new FormControlElement<DateTime>(subscriptionDate);
    this.books = new FormArrayElement(null);
    this.favoriteBook = new FormGroupElement<Book>(null);
  }

  @Required(error: 'error message here')
  @StringLength(min: 3, max: 50, error: 'error message here')
  FormControlElement<String> firstName;

  @Required(error: 'error message here')
  @StringLength(min: 3, max: 50, error: 'error message here')
  FormControlElement<String> lastName;

  @Required(error: 'error message here')
  FormControlElement<DateTime> birthDay;

  @Required(error: 'error message here')
  @GreaterOrEqualTo(
    valueToCompareOnProperty: 'birthDay',
    error: 'error message here',
  )
  @SmallerOrEqualTo(valueToCompare: '2020-01-01', error: 'error message here')
  FormControlElement<DateTime> subscriptionDate;

  @NbItems(min: '1', max: '3', error: 'error message here')
  FormArrayElement<Book> books;

  @Required(error: 'error message here')
  FormGroupElement<Book> favoriteBook;
}

@flutterModelFormValidator
class Book extends ModelForm {
  Book(
    String name,
    num price,
    DateTime loanDate,
  ) {
    this.name = new FormControlElement<String>(name);
    this.price = new FormControlElement<num>(price);
    this.loanDate = new FormControlElement<DateTime>(loanDate);
  }

  @Required(error: 'error message here')
  @StringLength(min: 3, max: 100, error: 'error message here')
  FormControlElement<String> name;

  @Required(error: 'price is required')
  @GreaterThan(valueToCompare: '0', error: 'error message here')
  FormControlElement<num> price;

  @Required(error: 'error message here')
  FormControlElement<DateTime> loanDate;
}
//#endregion

//#region DateTimeRange
@flutterModelFormValidator
class DateTimeRangeTest extends ModelForm {
  DateTimeRangeTest(
    DateTime value, [
    DateTime min,
    DateTime max,
  ]) {
    this.value = new FormControlElement<DateTime>(value);
    this.min = new FormControlElement<DateTime>(min);
    this.max = new FormControlElement<DateTime>(max);
  }

  @Range(
    min: '2019-01-01',
    max: '2019-12-31',
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  FormControlElement<DateTime> value;
  FormControlElement<DateTime> min;
  FormControlElement<DateTime> max;
}
//#endregion

//#region Email
@flutterModelFormValidator
class EmailTest extends ModelForm {
  EmailTest(String value) {
    this.value = new FormControlElement<String>(value);
  }

  @Email(error: 'error message here')
  FormControlElement<String> value;
}
//#endregion

//#region EqualToDatetimeTest
@flutterModelFormValidator
class EqualToDatetimeTest extends ModelForm {
  EqualToDatetimeTest(
    DateTime value, [
    DateTime valueToCompare,
  ]) {
    this.value = new FormControlElement<DateTime>(value);
    this.valueToCompare = new FormControlElement<DateTime>(valueToCompare);
  }

  @EqualTo(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<DateTime> value;
  FormControlElement<DateTime> valueToCompare;
}
//#endregion

//#region EqualToNumberTest
@flutterModelFormValidator
class EqualToNumberTest extends ModelForm {
  EqualToNumberTest(
    num value, [
    num valueToCompare,
  ]) {
    this.value = new FormControlElement<num>(value);
    this.valueToCompare = new FormControlElement<num>(valueToCompare);
  }

  @EqualTo(
    valueToCompare: '1',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<num> value;
  FormControlElement<num> valueToCompare;
}
//#endregion

//#region EqualToStringTest
@flutterModelFormValidator
class EqualToStringTest extends ModelForm {
  EqualToStringTest(
    String value, [
    String valueToCompare,
  ]) {
    this.value = new FormControlElement<String>(value);
    this.valueToCompare = new FormControlElement<String>(valueToCompare);
  }

  @EqualTo(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<String> value;
  FormControlElement<String> valueToCompare;
}
//#endregion

//#region FileMimeType
@flutterModelFormValidator
class FileMimeTypeTest extends ModelForm {
  FileMimeTypeTest(Uint8List value) {
    this.value = new FormControlElement<Uint8List>(value);
  }

  @FileMimeType(
    mimeTypes: ['image/jpeg', 'image/bmp'],
    error: 'error message here',
  )
  FormControlElement<Uint8List> value;
}
//#endregion

//#region FileSize
@flutterModelFormValidator
class FileSizeTest extends ModelForm {
  FileSizeTest(Uint8List value) {
    this.value = new FormControlElement<Uint8List>(value);
  }

  @FileSize(
    size: 1048576,
    error: 'error message here',
  )
  FormControlElement<Uint8List> value;
}
//#endregion

//#region GreaterOrEqualToDatetime
@flutterModelFormValidator
class GreaterOrEqualToDatetimeTest extends ModelForm {
  GreaterOrEqualToDatetimeTest(
    DateTime value, [
    DateTime valueToCompare,
  ]) {
    this.value = new FormControlElement<DateTime>(value);
    this.valueToCompare = new FormControlElement<DateTime>(valueToCompare);
  }

  @GreaterOrEqualTo(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'error message here',
  )
  FormControlElement<DateTime> value;
  FormControlElement<DateTime> valueToCompare;
}
//#endregion

//#region GreaterOrEqualToNumber
@flutterModelFormValidator
class GreaterOrEqualToNumberTest extends ModelForm {
  GreaterOrEqualToNumberTest(
    num value, [
    num valueToCompare,
  ]) {
    this.value = new FormControlElement<num>(value);
    this.valueToCompare = new FormControlElement<num>(valueToCompare);
  }

  @GreaterOrEqualTo(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: '1',
    error: 'error message here',
  )
  FormControlElement<num> value;
  FormControlElement<num> valueToCompare;
}
//#endregion

//#region GreaterOrEqualToString
@flutterModelFormValidator
class GreaterOrEqualToStringTest extends ModelForm {
  GreaterOrEqualToStringTest(
    String value, [
    String valueToCompare,
  ]) {
    this.value = new FormControlElement<String>(value);
    this.valueToCompare = new FormControlElement<String>(valueToCompare);
  }

  @GreaterOrEqualTo(
    valueToCompareOnProperty: 'valueToCompare',
    valueToCompare: 'b',
    error: 'error message here',
  )
  FormControlElement<String> value;
  FormControlElement<String> valueToCompare;
}
//#endregion

//#region GreaterThanDatetime
@flutterModelFormValidator
class GreaterThanDatetimeTest extends ModelForm {
  GreaterThanDatetimeTest(
    DateTime value, [
    DateTime valueToCompare,
  ]) {
    this.value = new FormControlElement<DateTime>(value);
    this.valueToCompare = new FormControlElement<DateTime>(valueToCompare);
  }

  @GreaterThan(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<DateTime> value;
  FormControlElement<DateTime> valueToCompare;
}
//#endregion

//#region GreaterThanNumber
@flutterModelFormValidator
class GreaterThanNumberTest extends ModelForm {
  GreaterThanNumberTest(
    num value, [
    num valueToCompare,
  ]) {
    this.value = new FormControlElement<num>(value);
    this.valueToCompare = new FormControlElement<num>(valueToCompare);
  }

  @GreaterThan(
    valueToCompare: '1',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<num> value;
  FormControlElement<num> valueToCompare;
}
//#endregion

//#region GreaterThanString
@flutterModelFormValidator
class GreaterThanStringTest extends ModelForm {
  GreaterThanStringTest(
    String value, [
    String valueToCompare,
  ]) {
    this.value = new FormControlElement<String>(value);
    this.valueToCompare = new FormControlElement<String>(valueToCompare);
  }

  @GreaterThan(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<String> value;
  FormControlElement<String> valueToCompare;
}
//#endregion

//#region ImageSize
@flutterModelFormValidator
class ImageSizeTest extends ModelForm {
  ImageSizeTest(Uint8List value) {
    this.value = new FormControlElement<Uint8List>(value);
  }

  @ImageSize(
    minWidth: 500,
    minHeight: 500,
    maxWidth: 1000,
    maxHeight: 1000,
    error: 'error message here',
  )
  FormControlElement<Uint8List> value;
}
//#endregion

//#region InText
@flutterModelFormValidator
class InTextTest extends ModelForm {
  InTextTest(
    String value, [
    String text,
  ]) {
    this.value = new FormControlElement<String>(value);
    this.text = new FormControlElement<String>(text);
  }

  @InText(
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    textOnProperty: 'text',
    error: 'error message here',
  )
  FormControlElement<String> value;
  FormControlElement<String> text;
}
//#endregion

//#region MultiSelectDatetime
@flutterModelFormValidator
class MultiSelectDatetimeTest extends ModelForm {
  MultiSelectDatetimeTest(List<DateTime> value) {
    this.value = new FormControlElement<List<DateTime>>(value);
  }

  @MultiSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  FormControlElement<List<DateTime>> value;
}
//#endregion

//#region MultiSelectNumber
@flutterModelFormValidator
class MultiSelectNumberTest extends ModelForm {
  MultiSelectNumberTest(List<num> value) {
    this.value = new FormControlElement<List<num>>(value);
  }

  @MultiSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  FormControlElement<List<num>> value;
}
//#region

//#region MultiSelectString
@flutterModelFormValidator
class MultiSelectStringTest extends ModelForm {
  MultiSelectStringTest(List<String> value) {
    this.value = new FormControlElement<List<String>>(value);
  }

  @MultiSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  FormControlElement<List<String>> value;
}
//#endregion

//#region MembershipPassword
@flutterModelFormValidator
class MembershipPasswordTest extends ModelForm {
  MembershipPasswordTest(String value) {
    this.value = new FormControlElement<String>(value);
  }

  @MembershipPassword(
    minLength: 8,
    maxLength: 16,
    includesAlphabeticalCharacters: true,
    includesUppercaseCharacters: true,
    includesNumericalCharacters: true,
    includesSpecialCharacters: true,
    error: 'error message here',
  )
  FormControlElement<String> value;
}
//#endregion

//#region NbItems
@flutterModelFormValidator
class NbItemsTest extends ModelForm {
  NbItemsTest(
    List<String> value, [
    int min,
    int max,
  ]) {
    this.value = new FormControlElement<List<String>>(value);
    this.min = new FormControlElement<int>(min);
    this.max = new FormControlElement<int>(max);
  }

  @NbItems(
    min: '1',
    max: '3',
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  FormControlElement<List<String>> value;
  FormControlElement<int> min;
  FormControlElement<int> max;
}
//#endregion

//#region NotEqualToDatetimeTest
@flutterModelFormValidator
class NotEqualToDatetimeTest extends ModelForm {
  NotEqualToDatetimeTest(
    DateTime value, [
    DateTime valueToCompare,
  ]) {
    this.value = new FormControlElement<DateTime>(value);
    this.valueToCompare = new FormControlElement<DateTime>(valueToCompare);
  }

  @NotEqualTo(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<DateTime> value;
  FormControlElement<DateTime> valueToCompare;
}
//#endregion

//#region NotEqualToNumberTest
@flutterModelFormValidator
class NotEqualToNumberTest extends ModelForm {
  NotEqualToNumberTest(
    num value, [
    num valueToCompare,
  ]) {
    this.value = new FormControlElement<num>(value);
    this.valueToCompare = new FormControlElement<num>(valueToCompare);
  }

  @NotEqualTo(
    valueToCompare: '1',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<num> value;
  FormControlElement<num> valueToCompare;
}
//#endregion

//#region NotEqualToStringTest
@flutterModelFormValidator
class NotEqualToStringTest extends ModelForm {
  NotEqualToStringTest(
    String value, [
    String valueToCompare,
  ]) {
    this.value = new FormControlElement<String>(value);
    this.valueToCompare = new FormControlElement<String>(valueToCompare);
  }

  @NotEqualTo(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<String> value;
  FormControlElement<String> valueToCompare;
}
//#endregion

//#region NumberRange
@flutterModelFormValidator
class NumberRangeTest extends ModelForm {
  NumberRangeTest(
    num value, [
    num min,
    num max,
  ]) {
    this.value = new FormControlElement<num>(value);
    this.min = new FormControlElement<num>(min);
    this.max = new FormControlElement<num>(max);
  }

  @Range(
    min: '-10',
    max: '-1',
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  FormControlElement<num> value;
  FormControlElement<num> min;
  FormControlElement<num> max;
}
//#endregion

//#region PhoneNumber
@flutterModelFormValidator
class PhoneNumberTest extends ModelForm {
  PhoneNumberTest(
    String value, [
    String countryCode,
    String phoneNumberType,
  ]) {
    this.value = new FormControlElement<String>(value);
    this.countryCode = new FormControlElement<String>(countryCode);
    this.phoneNumberType = new FormControlElement<String>(phoneNumberType);
  }

  @PhoneNumber(
    phoneNumberTypeOnProperty: 'phoneNumberType',
    countryCodeOnProperty: 'countryCode',
    error: 'error message here',
  )
  FormControlElement<String> value;
  FormControlElement<String> countryCode;
  FormControlElement<String> phoneNumberType;
}
//#endregion

//#region RegularExpression
@flutterModelFormValidator
class RegularExpressionTest extends ModelForm {
  RegularExpressionTest(String value) {
    this.value = new FormControlElement<String>(value);
  }

  @RegularExpression(
    expression: r'^Hello|Bye$',
    error: 'error message here',
  )
  FormControlElement<String> value;
}
//#endregion

//#region Required
@flutterModelFormValidator
class RequiredTest extends ModelForm {
  RequiredTest(String value) {
    this.value = new FormControlElement<String>(value);
  }

  @Required(error: 'error message here')
  FormControlElement<String> value;
}
//#endregion

//#region SingleSelectDateTime
@flutterModelFormValidator
class SingleSelectDatetimeTest extends ModelForm {
  SingleSelectDatetimeTest(DateTime value) {
    this.value = new FormControlElement<DateTime>(value);
  }

  @SingleSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  FormControlElement<DateTime> value;
}
//#endregion

//#region SingleSelectNumber
@flutterModelFormValidator
class SingleSelectNumberTest extends ModelForm {
  SingleSelectNumberTest(num value) {
    this.value = new FormControlElement<num>(value);
  }

  @SingleSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  FormControlElement<num> value;
}
//#region

//#region SingleSelectString
@flutterModelFormValidator
class SingleSelectStringTest extends ModelForm {
  SingleSelectStringTest(String value) {
    this.value = new FormControlElement<String>(value);
  }

  @SingleSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  FormControlElement<String> value;
}
//#endregion

//#region SmallerOrEqualToDatetime
@flutterModelFormValidator
class SmallerOrEqualToDatetimeTest extends ModelForm {
  SmallerOrEqualToDatetimeTest(
    DateTime value, [
    DateTime valueToCompare,
  ]) {
    this.value = new FormControlElement<DateTime>(value);
    this.valueToCompare = new FormControlElement<DateTime>(valueToCompare);
  }

  @SmallerOrEqualTo(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<DateTime> value;
  FormControlElement<DateTime> valueToCompare;
}
//#endregion

//#region SmallerOrEqualToNumber
@flutterModelFormValidator
class SmallerOrEqualToNumberTest extends ModelForm {
  SmallerOrEqualToNumberTest(
    num value, [
    num valueToCompare,
  ]) {
    this.value = new FormControlElement<num>(value);
    this.valueToCompare = new FormControlElement<num>(valueToCompare);
  }

  @SmallerOrEqualTo(
    valueToCompare: '1',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<num> value;
  FormControlElement<num> valueToCompare;
}
//#endregion

//#region SmallerOrEqualToString
@flutterModelFormValidator
class SmallerOrEqualToStringTest extends ModelForm {
  SmallerOrEqualToStringTest(
    String value, [
    String valueToCompare,
  ]) {
    this.value = new FormControlElement<String>(value);
    this.valueToCompare = new FormControlElement<String>(valueToCompare);
  }

  @SmallerOrEqualTo(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<String> value;
  FormControlElement<String> valueToCompare;
}
//#endregion

//#region SmallerThanDatetime
@flutterModelFormValidator
class SmallerThanDatetimeTest extends ModelForm {
  SmallerThanDatetimeTest(
    DateTime value, [
    DateTime valueToCompare,
  ]) {
    this.value = new FormControlElement<DateTime>(value);
    this.valueToCompare = new FormControlElement<DateTime>(valueToCompare);
  }

  @SmallerThan(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<DateTime> value;
  FormControlElement<DateTime> valueToCompare;
}
//#endregion

//#region SmallerThanNumber
@flutterModelFormValidator
class SmallerThanNumberTest extends ModelForm {
  SmallerThanNumberTest(
    num value, [
    num valueToCompare,
  ]) {
    this.value = new FormControlElement<num>(value);
    this.valueToCompare = new FormControlElement<num>(valueToCompare);
  }

  @SmallerThan(
    valueToCompare: '1',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<num> value;
  FormControlElement<num> valueToCompare;
}
//#endregion

//#region SmallerThanString
@flutterModelFormValidator
class SmallerThanStringTest extends ModelForm {
  SmallerThanStringTest(
    String value, [
    String valueToCompare,
  ]) {
    this.value = new FormControlElement<String>(value);
    this.valueToCompare = new FormControlElement<String>(valueToCompare);
  }

  @SmallerThan(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'valueToCompare',
    error: 'error message here',
  )
  FormControlElement<String> value;
  FormControlElement<String> valueToCompare;
}
//#endregion

//#region StringLength
@flutterModelFormValidator
class StringLengthTest extends ModelForm {
  StringLengthTest(String value) {
    this.value = new FormControlElement<String>(value);
  }

  @StringLength(
    min: 10,
    max: 20,
    error: 'error message here',
  )
  FormControlElement<String> value;
}
//#endregion

//#region StringRange
@flutterModelFormValidator
class StringRangeTest extends ModelForm {
  StringRangeTest(
    String value, [
    String min,
    String max,
  ]) {
    this.value = new FormControlElement<String>(value);
    this.min = new FormControlElement<String>(min);
    this.max = new FormControlElement<String>(max);
  }

  @Range(
    min: 'a',
    max: 'd',
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  FormControlElement<String> value;
  FormControlElement<String> min;
  FormControlElement<String> max;
}
//#endregion

//#region URL
@flutterModelFormValidator
class UrlTest extends ModelForm {
  UrlTest(String value) {
    this.value = new FormControlElement<String>(value);
  }

  @URL(
    error: 'error message here',
  )
  FormControlElement<String> value;
}
//#endregion
