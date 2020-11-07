import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

void main() {}

//#region ComplexFormTest
@flutterModelFormValidator
class FormBuilderTest extends ModelForm {
  FormBuilderTest(
    this._firstName,
    this._lastName,
    this._birthDay,
    this._subscriptionDate,
  );

  // private properties
  String _firstName;
  String _lastName;
  DateTime _birthDay;
  DateTime _subscriptionDate;
  List<Book> _books;
  Book _favoriteBook;

  // getters
  @FormControlDeclarer()
  @Required(error: 'error message here')
  @StringLength(min: 3, max: 50, error: 'error message here')
  String get first_name => this._firstName;

  @FormControlDeclarer()
  @Required(error: 'error message here')
  @StringLength(min: 3, max: 50, error: 'error message here')
  String get last_name => this._lastName;

  @FormControlDeclarer()
  @Required(error: 'error message here')
  DateTime get birth_day => this._birthDay;

  @FormControlDeclarer()
  @Required(error: 'error message here')
  @GreaterOrEqualTo(
      valueToCompareOnProperty: 'birth_day', error: 'error message here')
  @SmallerOrEqualTo(valueToCompare: '2020-01-01', error: 'error message here')
  DateTime get subscription_date => this._subscriptionDate;

  @FormArrayDeclarer()
  @NbItems(min: '1', max: '3', error: 'error message here')
  List<Book> get books => this._books;

  @FormGroupDeclarer()
  @Required(error: 'error message here')
  Book get favorite_book => this._favoriteBook;

  // setters
  set first_name(String value) {
    this._firstName = value;
    this.notifyModelState('first_name');
  }

  set last_name(String value) {
    this._lastName = value;
    this.notifyModelState('last_name');
  }

  set birth_day(DateTime value) {
    this._birthDay = value;
    this.notifyModelState('birth_day');
  }

  set subscription_date(DateTime value) {
    this._subscriptionDate = value;
    this.notifyModelState('subscription_date');
  }

  set books(List<Book> value) {
    this._books = value;
    this.notifyModelState('books');
  }

  set favorite_book(Book value) {
    this._favoriteBook = value;
    this.notifyModelState('favorite_book');
  }

  void addItemOnBooks(Book item) {
    if (this._books == null) this._books = new List<Book>();
    this._books.add(item);
    this.notifyModelState('books');
  }

  void removeItemOnBook(Book item) {
    if (this._books.contains(item)) this._books.remove(item);
    this.notifyModelState('books');
  }
}

@flutterModelFormValidator
class Book extends ModelForm {
  Book(this._name, this._price, this._loanDate);

  // private properties
  String _name;
  num _price;
  DateTime _loanDate;

  // getters
  @FormControlDeclarer()
  @Required(error: 'error message here')
  @StringLength(min: 3, max: 100, error: 'error message here')
  String get name => this._name;

  @FormControlDeclarer()
  @Required(error: 'price is required')
  @GreaterThan(valueToCompare: '0', error: 'error message here')
  num get price => this._price;

  @FormControlDeclarer()
  @Required(error: 'error message here')
  DateTime get loan_date => this._loanDate;

  // setters
  set name(String value) {
    this._name = value;
    this.notifyModelState('name');
  }

  set price(num value) {
    this._price = value;
    this.notifyModelState('price');
  }

  set loan_date(DateTime value) {
    this._loanDate = value;
    this.notifyModelState('loan_date');
  }
}
//#endregion

//#region DateTimeRange
@flutterModelFormValidator
class DateTimeRangeTest extends ModelForm {
  DateTimeRangeTest(this._value, [this._min, this._max]);

  // private properties
  DateTime _value;
  DateTime _min;
  DateTime _max;

  // getters
  @Range(
    min: '2019-01-01',
    max: '2019-12-31',
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  DateTime get value => this._value;
  DateTime get min => this._min;
  DateTime get max => this._max;

  // setters
  set value(DateTime value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set min(DateTime value) {
    this._min = value;
    this.notifyModelState('min');
  }

  set max(DateTime value) {
    this._max = value;
    this.notifyModelState('max');
  }
}
//#endregion

//#region Email
@flutterModelFormValidator
class EmailTest extends ModelForm {
  EmailTest(this._value);

  // private properties
  String _value;

  // getters
  @Email(error: 'error message here')
  String get value => this._value;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region EqualToDatetimeTest
@flutterModelFormValidator
class EqualToDatetimeTest extends ModelForm {
  EqualToDatetimeTest(this._value, [this._valueToCompare = null]);

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @EqualTo(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  DateTime get value => this._value;
  DateTime get value_to_compare => this._valueToCompare;

  // setters
  set value(DateTime value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(DateTime value) {
    this._valueToCompare = value;
    this.notifyModelState('valueToCompare');
  }
}
//#endregion

//#region EqualToNumberTest
@flutterModelFormValidator
class EqualToNumberTest extends ModelForm {
  EqualToNumberTest(this._value, [this._valueToCompare = null]);

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @EqualTo(
    valueToCompare: '1',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  num get value => this._value;
  num get value_to_compare => this._valueToCompare;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(num value) {
    this._valueToCompare = value;
    this.notifyModelState('valueToCompare');
  }
}
//#endregion

//#region EqualToStringTest
@flutterModelFormValidator
class EqualToStringTest extends ModelForm {
  EqualToStringTest(this._value, [this._valueToCompare = null]);

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @EqualTo(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  String get value => this._value;
  String get value_to_compare => this._valueToCompare;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(String value) {
    this._valueToCompare = value;
    this.notifyModelState('valueToCompare');
  }
}
//#endregion

//#region FileMimeType
@flutterModelFormValidator
class FileMimeTypeTest extends ModelForm {
  FileMimeTypeTest(this._value);

  // private properties
  List<int> _value;

  // getters
  @FileMimeType(
    mimeTypes: ['image/jpeg', 'image/bmp'],
    error: 'error message here',
  )
  List<int> get value => this._value;

  // setters
  set value(List<int> value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region FileSize
@flutterModelFormValidator
class FileSizeTest extends ModelForm {
  FileSizeTest(this._value);

  // private properties
  List<int> _value;

  // getters
  @FileSize(
    size: 1048576,
    error: 'error message here',
  )
  List<int> get value => this._value;

  // setters
  set value(List<int> value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region GreaterOrEqualToDatetime
@flutterModelFormValidator
class GreaterOrEqualToDatetimeTest extends ModelForm {
  GreaterOrEqualToDatetimeTest(this._value, [this._valueToCompare]);

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @GreaterOrEqualTo(
    valueToCompareOnProperty: 'value_to_compare',
    valueToCompare: '2019-01-01T00:00:00',
    error: 'error message here',
  )
  DateTime get value => this._value;
  DateTime get value_to_compare => this._valueToCompare;

  // setters
  set value(DateTime value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(DateTime value) {
    this._valueToCompare = value;
    this.notifyModelState('value_to_compare');
  }
}
//#endregion

//#region GreaterOrEqualToNumber
@flutterModelFormValidator
class GreaterOrEqualToNumberTest extends ModelForm {
  GreaterOrEqualToNumberTest(this._value, [this._valueToCompare]);

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @GreaterOrEqualTo(
    valueToCompareOnProperty: 'value_to_compare',
    valueToCompare: '1',
    error: 'error message here',
  )
  num get value => this._value;
  num get value_to_compare => this._valueToCompare;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(num value) {
    this._valueToCompare = value;
    this.notifyModelState('value_to_compare');
  }
}
//#endregion

//#region GreaterOrEqualToString
@flutterModelFormValidator
class GreaterOrEqualToStringTest extends ModelForm {
  GreaterOrEqualToStringTest(this._value, [this._valueToCompare]);

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @GreaterOrEqualTo(
    valueToCompareOnProperty: 'value_to_compare',
    valueToCompare: 'b',
    error: 'error message here',
  )
  String get value => this._value;
  String get value_to_compare => this._valueToCompare;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(String value) {
    this._valueToCompare = value;
    this.notifyModelState('value_to_compare');
  }
}
//#endregion

//#region GreaterThanDatetime
@flutterModelFormValidator
class GreaterThanDatetimeTest extends ModelForm {
  GreaterThanDatetimeTest(this._value, [this._valueToCompare]);

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @GreaterThan(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  DateTime get value => this._value;
  DateTime get value_to_compare => this._valueToCompare;

  // setters
  set value(DateTime value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(DateTime value) {
    this._valueToCompare = value;
    this.notifyModelState('value_to_compare');
  }
}
//#endregion

//#region GreaterThanNumber
@flutterModelFormValidator
class GreaterThanNumberTest extends ModelForm {
  GreaterThanNumberTest(this._value, [this._valueToCompare]);

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @GreaterThan(
    valueToCompare: '1',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  num get value => this._value;
  num get value_to_compare => this._valueToCompare;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(num value) {
    this._valueToCompare = value;
    this.notifyModelState('value_to_compare');
  }
}
//#endregion

//#region GreaterThanString
@flutterModelFormValidator
class GreaterThanStringTest extends ModelForm {
  GreaterThanStringTest(this._value, [this._valueToCompare]);

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @GreaterThan(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  String get value => this._value;
  String get value_to_compare => this._valueToCompare;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(String value) {
    this._valueToCompare = value;
    this.notifyModelState('value_to_compare');
  }
}
//#endregion

//#region ImageSize
@flutterModelFormValidator
class ImageSizeTest extends ModelForm {
  ImageSizeTest(this._value);

  // private properties
  List<int> _value;

  // getters
  @ImageSize(
    minWidth: 500,
    minHeight: 500,
    maxWidth: 1000,
    maxHeight: 1000,
    error: 'error message here',
  )
  List<int> get value => this._value;

  // setters
  set value(List<int> value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region InText
@flutterModelFormValidator
class InTextTest extends ModelForm {
  InTextTest(this._value, [this._text]);

  // private properties
  String _value;
  String _text;

  // getters
  @InText(
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    textOnProperty: 'text',
    error: 'error message here',
  )
  String get value => this._value;
  String get text => this._text;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set text(String value) {
    this._text = value;
    this.notifyModelState('text');
  }
}
//#endregion

//#region MultiSelectDatetime
@flutterModelFormValidator
class MultiSelectDatetimeTest extends ModelForm {
  MultiSelectDatetimeTest(this._value);

  // private properties
  List<DateTime> _value;

  // getters
  @MultiSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  List<DateTime> get value => this._value;

  // setters
  set value(List<DateTime> value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region MultiSelectNumber
@flutterModelFormValidator
class MultiSelectNumberTest extends ModelForm {
  MultiSelectNumberTest(this._value);

  // private properties
  List<num> _value;

  // getters
  @MultiSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  List<num> get value => this._value;

  // setters
  set value(List<num> value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#region

//#region MultiSelectString
@flutterModelFormValidator
class MultiSelectStringTest extends ModelForm {
  MultiSelectStringTest(this._value);

  // private properties
  List<String> _value;

  // getters
  @MultiSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  List<String> get value => this._value;

  // setters
  set value(List<String> value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region MembershipPassword
@flutterModelFormValidator
class MembershipPasswordTest extends ModelForm {
  MembershipPasswordTest(this._value);

  // private properties
  String _value;

  // getters
  @MembershipPassword(
    minLength: 8,
    maxLength: 16,
    includesAlphabeticalCharacters: true,
    includesUppercaseCharacters: true,
    includesNumericalCharacters: true,
    includesSpecialCharacters: true,
    error: 'error message here',
  )
  String get value => this._value;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region NbItems
@flutterModelFormValidator
class NbItemsTest extends ModelForm {
  NbItemsTest(this._value, [this._min, this._max]);

  // private properties
  List<String> _value;
  int _min;
  int _max;

  // getters
  @NbItems(
    min: '1',
    max: '3',
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  List<String> get value => this._value;
  int get min => this._min;
  int get max => this._max;

  // setters
  set value(List<String> value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set min(int value) {
    this._min = value;
    this.notifyModelState('min');
  }

  set max(int value) {
    this._max = value;
    this.notifyModelState('max');
  }
}
//#endregion

//#region NotEqualToDatetimeTest
@flutterModelFormValidator
class NotEqualToDatetimeTest extends ModelForm {
  NotEqualToDatetimeTest(this._value, [this._valueToCompare = null]);

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @NotEqualTo(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  DateTime get value => this._value;
  DateTime get value_to_compare => this._valueToCompare;

  // setters
  set value(DateTime value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(DateTime value) {
    this._valueToCompare = value;
    this.notifyModelState('valueToCompare');
  }
}
//#endregion

//#region NotEqualToNumberTest
@flutterModelFormValidator
class NotEqualToNumberTest extends ModelForm {
  NotEqualToNumberTest(this._value, [this._valueToCompare = null]);

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @NotEqualTo(
    valueToCompare: '1',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  num get value => this._value;
  num get value_to_compare => this._valueToCompare;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(num value) {
    this._valueToCompare = value;
    this.notifyModelState('valueToCompare');
  }
}
//#endregion

//#region NotEqualToStringTest
@flutterModelFormValidator
class NotEqualToStringTest extends ModelForm {
  NotEqualToStringTest(this._value, [this._valueToCompare = null]);

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @NotEqualTo(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  String get value => this._value;
  String get value_to_compare => this._valueToCompare;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(String value) {
    this._valueToCompare = value;
    this.notifyModelState('valueToCompare');
  }
}
//#endregion

//#region NumberRange
@flutterModelFormValidator
class NumberRangeTest extends ModelForm {
  NumberRangeTest(this._value, [this._min, this._max]);

  // private properties
  num _value;
  num _min;
  num _max;

  // getters
  @Range(
    min: '-10',
    max: '-1',
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  num get value => this._value;
  num get min => this._min;
  num get max => this._max;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set min(num value) {
    this._min = value;
    this.notifyModelState('min');
  }

  set max(num value) {
    this._max = value;
    this.notifyModelState('max');
  }
}
//#endregion

//#region PhoneNumber
@flutterModelFormValidator
class PhoneNumberTest extends ModelForm {
  PhoneNumberTest(this._value, [this._countryCode, this._phoneNumberType]);

  // private properties
  String _value;
  String _countryCode;
  String _phoneNumberType;

  // getters
  @PhoneNumber(
    phoneNumberTypeOnProperty: 'phoneNumberType',
    countryCodeOnProperty: 'countryCode',
    error: 'error message here',
  )
  String get value => this._value;
  String get countryCode => this._countryCode;
  String get phoneNumberType => this._phoneNumberType;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set countryCode(String value) {
    this._countryCode = value;
    this.notifyModelState('countryCode');
  }

  set phoneNumberType(String value) {
    this._phoneNumberType = value;
    this.notifyModelState('phoneNumberType');
  }
}
//#endregion

//#region RegularExpression
@flutterModelFormValidator
class RegularExpressionTest extends ModelForm {
  RegularExpressionTest(this._value);

  // private properties
  String _value;

  // getters
  @RegularExpression(
    expression: r'^Hello|Bye$',
    error: 'error message here',
  )
  String get value => this._value;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region Required
@flutterModelFormValidator
class RequiredTest extends ModelForm {
  RequiredTest(this._value);

  // private properties
  String _value;

  // getters
  @Required(error: 'error message here')
  String get value => this._value;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region SingleSelectDateTime
@flutterModelFormValidator
class SingleSelectDatetimeTest extends ModelForm {
  SingleSelectDatetimeTest(this._value);

  // private properties
  DateTime _value;

  // getters
  @SingleSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  DateTime get value => this._value;

  // setters
  set value(DateTime value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region SingleSelectNumber
@flutterModelFormValidator
class SingleSelectNumberTest extends ModelForm {
  SingleSelectNumberTest(this._value);

  // private properties
  num _value;

  // getters
  @SingleSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  num get value => this._value;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#region

//#region SingleSelectString
@flutterModelFormValidator
class SingleSelectStringTest extends ModelForm {
  SingleSelectStringTest(this._value);

  // private properties
  String _value;

  // getters
  @SingleSelect(
    serviceName: 'getItems',
    error: 'error message here',
  )
  String get value => this._value;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region SmallerOrEqualToDatetime
@flutterModelFormValidator
class SmallerOrEqualToDatetimeTest extends ModelForm {
  SmallerOrEqualToDatetimeTest(this._value, [this._valueToCompare]);

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @SmallerOrEqualTo(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  DateTime get value => this._value;
  DateTime get value_to_compare => this._valueToCompare;

  // setters
  set value(DateTime value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(DateTime value) {
    this._valueToCompare = value;
    this.notifyModelState('value_to_compare');
  }
}
//#endregion

//#region SmallerOrEqualToNumber
@flutterModelFormValidator
class SmallerOrEqualToNumberTest extends ModelForm {
  SmallerOrEqualToNumberTest(this._value, [this._valueToCompare]);

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @SmallerOrEqualTo(
    valueToCompare: '1',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  num get value => this._value;
  num get value_to_compare => this._valueToCompare;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(num value) {
    this._valueToCompare = value;
    this.notifyModelState('value_to_compare');
  }
}
//#endregion

//#region SmallerOrEqualToString
@flutterModelFormValidator
class SmallerOrEqualToStringTest extends ModelForm {
  SmallerOrEqualToStringTest(this._value, [this._valueToCompare]);

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @SmallerOrEqualTo(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  String get value => this._value;
  String get value_to_compare => this._valueToCompare;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(String value) {
    this._valueToCompare = value;
    this.notifyModelState('value_to_compare');
  }
}
//#endregion

//#region SmallerThanDatetime
@flutterModelFormValidator
class SmallerThanDatetimeTest extends ModelForm {
  SmallerThanDatetimeTest(this._value, [this._valueToCompare]);

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @SmallerThan(
    valueToCompare: '2019-01-01T00:00:00',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  DateTime get value => this._value;
  DateTime get value_to_compare => this._valueToCompare;

  // setters
  set value(DateTime value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(DateTime value) {
    this._valueToCompare = value;
    this.notifyModelState('value_to_compare');
  }
}
//#endregion

//#region SmallerThanNumber
@flutterModelFormValidator
class SmallerThanNumberTest extends ModelForm {
  SmallerThanNumberTest(this._value, [this._valueToCompare]);

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @SmallerThan(
    valueToCompare: '1',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  num get value => this._value;
  num get value_to_compare => this._valueToCompare;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(num value) {
    this._valueToCompare = value;
    this.notifyModelState('value_to_compare');
  }
}
//#endregion

//#region SmallerThanString
@flutterModelFormValidator
class SmallerThanStringTest extends ModelForm {
  SmallerThanStringTest(this._value, [this._valueToCompare]);

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @SmallerThan(
    valueToCompare: 'b',
    valueToCompareOnProperty: 'value_to_compare',
    error: 'error message here',
  )
  String get value => this._value;
  String get value_to_compare => this._valueToCompare;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set value_to_compare(String value) {
    this._valueToCompare = value;
    this.notifyModelState('value_to_compare');
  }
}
//#endregion

//#region StringLength
@flutterModelFormValidator
class StringLengthTest extends ModelForm {
  StringLengthTest(
    this._value,
  );

  // private properties
  String _value;

  // getters
  @StringLength(
    min: 10,
    max: 20,
    error: 'error message here',
  )
  String get value => this._value;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region StringRange
@flutterModelFormValidator
class StringRangeTest extends ModelForm {
  StringRangeTest(this._value, [this._min, this._max]);

  // private properties
  String _value;
  String _min;
  String _max;

  // getters
  @Range(
    min: 'a',
    max: 'd',
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  String get value => this._value;
  String get min => this._min;
  String get max => this._max;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set min(String value) {
    this._min = value;
    this.notifyModelState('min');
  }

  set max(String value) {
    this._max = value;
    this.notifyModelState('max');
  }
}
//#endregion

//#region URL
@flutterModelFormValidator
class UrlTest extends ModelForm {
  UrlTest(
    this._value,
  );

  // private properties
  String _value;

  // getters
  @URL(
    error: 'error message here',
  )
  String get value => this._value;

  // setters
  set value(String value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion
