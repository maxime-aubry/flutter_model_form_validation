import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

/*group('xxxx.', () {
    group('Test the priority between user and developer static data.', () {});
    group('Test the validation > success.', () {});
    group('Test the validation > failure.', () {});
  });*/

void main() {}

//#region ComplexFormTest
@flutterModelFormValidator
class ComplexFormTest with PropertyChangeNotifier<String> {
  ComplexFormTest(
    this._firstName,
    this._lastName,
    this._birthDay,
    this._subscriptionDate,
  ) {
    this.books = new List<Book>();
    this.favorite_book = new Book(null, null, null);
  }

  // private properties
  String _firstName;
  String _lastName;
  DateTime _birthDay;
  DateTime _subscriptionDate;
  List<Book> _books;
  Book _favoriteBook;

  // getters
  @FormInput()
  @Required(error: 'firstname is required')
  @StringLength(min: 3, max: 50, error: 'Invalid string length')
  String get first_name => this._firstName;

  @FormInput()
  @Required(error: 'lastname is required')
  @StringLength(min: 3, max: 50, error: 'Invalid string length')
  String get last_name => this._lastName;

  @FormInput()
  @Required(error: 'birthday is required')
  DateTime get birth_day => this._birthDay;

  @FormInput()
  @Required(error: 'subscription date is required')
  @GreaterOrEqualToDateTime(
      valueToCompareOnProperty: 'birth_day',
      error: 'date of death must be greater or equal to birthday')
  @SmallerOrEqualToDateTime(
      valueToCompare: '2020-01-01',
      error: 'date of death must be smaller or equal than 2020-01-01')
  DateTime get subscription_date => this._subscriptionDate;

  @FormCollection()
  List<Book> get books => this._books;

  @FormObject()
  Book get favorite_book => this._favoriteBook;

  // setters
  set first_name(String value) {
    this._firstName = value;
    notifyListeners('${this.hashCode}.first_name');
  }

  set last_name(String value) {
    this._lastName = value;
    notifyListeners('${this.hashCode}.last_name');
  }

  set birth_day(DateTime value) {
    this._birthDay = value;
    notifyListeners('${this.hashCode}.birth_day');
  }

  set subscription_date(DateTime value) {
    this._subscriptionDate = value;
    notifyListeners('${this.hashCode}.subscription_date');
  }

  set books(List<Book> value) {
    this._books = value;
  }

  set favorite_book(Book value) {
    this._favoriteBook = value;
  }
}

@flutterModelFormValidator
class Book with PropertyChangeNotifier<String> {
  Book(this._name, this._price, this._loanDate);

  // private properties
  String _name;
  num _price;
  DateTime _loanDate;

  // getters
  @Required(error: 'name is required')
  String get name => this._name;

  @Required(error: 'price is required')
  @GreaterThanNumber(valueToCompare: 0)
  num get price => this._price;

  @Required(error: 'loan date is required')
  DateTime get loan_date => this._loanDate;

  // setters
  set name(String value) {
    this._name = value;
    notifyListeners('${this.hashCode}.name');
  }

  set price(num value) {
    this._price = value;
    notifyListeners('${this.hashCode}.price');
  }

  set loan_date(DateTime value) {
    this._loanDate = value;
    notifyListeners('${this.hashCode}.loan_date');
  }
}
//#endregion

// //#region ContainsDateTime
// @flutterModelFormValidator
// class ContainsDateTimeTest with PropertyChangeNotifier<String> {
//   ContainsDateTimeTest(
//     this._value,
//   );

//   // private properties
//   DateTime _value;

//   // getters
//   @ContainsDateTime(
//     items: ['2020-01-01', '2020-06-01', '2020-12-31'],
//     error: 'Invalid datetime',
//   )
//   DateTime get value => this._value;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region ContainsNumber
// @flutterModelFormValidator
// class ContainsNumberTest with PropertyChangeNotifier<String> {
//   ContainsNumberTest(
//     this._value,
//   );

//   // private properties
//   num _value;

//   // getters
//   @ContainsNumber(
//     items: [1, 2, 3],
//     error: 'Invalid number',
//   )
//   num get value => this._value;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region ContainsString
// @flutterModelFormValidator
// class ContainsStringTest with PropertyChangeNotifier<String> {
//   ContainsStringTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @ContainsString(
//     items: ['lorem', 'ipsum', 'dolor', 'sit', 'amet'],
//     error: 'Invalid keyword',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region DateTimeRange
// @flutterModelFormValidator
// class DateTimeRangeTest with PropertyChangeNotifier<String> {
//   DateTimeRangeTest(
//     this._value,
//     this._min,
//     this._max,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _min;
//   DateTime _max;

//   // getters
//   @DateTimeRange(
//     minOnProperty: 'min',
//     maxOnProperty: 'max',
//     error: 'This datetime is not in the range',
//   )
//   DateTime get value => this._value;
//   DateTime get min => this._min;
//   DateTime get max => this._max;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set min(DateTime value) {
//     this._min = value;
//     notifyListeners('min');
//   }

//   set max(DateTime value) {
//     this._max = value;
//     notifyListeners('max');
//   }
// }

// @flutterModelFormValidator
// class DateTimeRangeWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   DateTimeRangeWithUserAndDeveloperValuesTest(
//     this._value,
//     this._min,
//     this._max,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _min;
//   DateTime _max;

//   // getters
//   @DateTimeRange(
//     minOnProperty: 'min',
//     maxOnProperty: 'max',
//     min: '2019-01-01',
//     max: '2019-12-31',
//     error: 'This datetime is not in the range',
//   )
//   DateTime get value => this._value;
//   DateTime get min => this._min;
//   DateTime get max => this._max;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set min(DateTime min) {
//     this._min = min;
//     notifyListeners('min');
//   }

//   set max(DateTime max) {
//     this._max = max;
//     notifyListeners('max');
//   }
// }

// @flutterModelFormValidator
// class DateTimeRangeWithUserValuesTest with PropertyChangeNotifier<String> {
//   DateTimeRangeWithUserValuesTest(
//     this._value,
//     this._min,
//     this._max,
//   );

//   // private properties
//   @DateTimeRange(
//     minOnProperty: 'min',
//     maxOnProperty: 'max',
//     error: 'This datetime is not in the range',
//   )
//   DateTime _value;
//   DateTime _min;
//   DateTime _max;

//   // getters
//   DateTime get value => this._value;
//   DateTime get min => this._min;
//   DateTime get max => this._max;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set min(DateTime min) {
//     this._min = min;
//     notifyListeners('min');
//   }

//   set max(DateTime max) {
//     this._max = max;
//     notifyListeners('max');
//   }
// }

// @flutterModelFormValidator
// class DateTimeRangeWithDeveloperValuesTest with PropertyChangeNotifier<String> {
//   DateTimeRangeWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   DateTime _value;

//   // getters
//   @DateTimeRange(
//     min: '2019-01-01',
//     max: '2019-12-31',
//     error: 'This datetime is not in the range',
//   )
//   DateTime get value => this._value;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region Email
// @flutterModelFormValidator
// class EmailTest with PropertyChangeNotifier<String> {
//   EmailTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @Email(
//     error: 'Invalid email',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region EqualToDatetime
// @flutterModelFormValidator
// class EqualToDatetimeTest with PropertyChangeNotifier<String> {
//   EqualToDatetimeTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @EqualToDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('valueToCompare');
//   }
// }

// @flutterModelFormValidator
// class EqualToDatetimeWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   EqualToDatetimeWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @EqualToDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: '2019-01-01T00:00:00',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class EqualToDatetimeWithUserValuesTest with PropertyChangeNotifier<String> {
//   EqualToDatetimeWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @EqualToDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class EqualToDatetimeWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   EqualToDatetimeWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   DateTime _value;

//   // getters
//   @EqualToDateTime(
//     valueToCompare: '2019-01-01T00:00:00',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region EqualToNumber
// @flutterModelFormValidator
// class EqualToNumberTest with PropertyChangeNotifier<String> {
//   EqualToNumberTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @EqualToNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class EqualToNumberWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   EqualToNumberWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @EqualToNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: 1,
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class EqualToNumberWithUserValuesTest with PropertyChangeNotifier<String> {
//   EqualToNumberWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @EqualToNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class EqualToNumberWithDeveloperValuesTest with PropertyChangeNotifier<String> {
//   EqualToNumberWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   num _value;

//   // getters
//   @EqualToNumber(
//     valueToCompare: 1,
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region EqualToString
// @flutterModelFormValidator
// class EqualToStringTest with PropertyChangeNotifier<String> {
//   EqualToStringTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @EqualToString(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class EqualToStringWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   EqualToStringWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @EqualToString(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class EqualToStringWithUserValuesTest with PropertyChangeNotifier<String> {
//   EqualToStringWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @EqualToString(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class EqualToStringWithDeveloperValuesTest with PropertyChangeNotifier<String> {
//   EqualToStringWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @EqualToString(
//     valueToCompare: 'b',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region FileMimeType
// @flutterModelFormValidator
// class FileMimeTypeTest with PropertyChangeNotifier<String> {
//   FileMimeTypeTest(
//     this._value,
//   );

//   // private properties
//   List<int> _value;

//   // getters
//   @FileMimeType(
//     mimeTypes: ['image/jpeg', 'image/bmp'],
//     error: 'Invalid mime type',
//   )
//   List<int> get value => this._value;

//   // setters
//   set value(List<int> value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region FileSize
// @flutterModelFormValidator
// class FileSizeTest with PropertyChangeNotifier<String> {
//   FileSizeTest(
//     this._value,
//   );

//   // private properties
//   List<int> _value;

//   // getters
//   @FileSize(
//     size: 1048576,
//     error: 'Invalid file size',
//   )
//   List<int> get value => this._value;

//   // setters
//   set value(List<int> value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region GreaterOrEqualToDatetime
// @flutterModelFormValidator
// class GreaterOrEqualToDatetimeTest with PropertyChangeNotifier<String> {
//   GreaterOrEqualToDatetimeTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @GreaterOrEqualToDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @GreaterOrEqualToDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: '2019-01-01T00:00:00',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterOrEqualToDatetimeWithUserValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterOrEqualToDatetimeWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @GreaterOrEqualToDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterOrEqualToDatetimeWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterOrEqualToDatetimeWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   DateTime _value;

//   // getters
//   @GreaterOrEqualToDateTime(
//     valueToCompare: '2019-01-01T00:00:00',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region GreaterOrEqualToNumber
// @flutterModelFormValidator
// class GreaterOrEqualToNumberTest with PropertyChangeNotifier<String> {
//   GreaterOrEqualToNumberTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @GreaterOrEqualToNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterOrEqualToNumberWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterOrEqualToNumberWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @GreaterOrEqualToNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: 1,
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterOrEqualToNumberWithUserValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterOrEqualToNumberWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @GreaterOrEqualToNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterOrEqualToNumberWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterOrEqualToNumberWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   num _value;

//   // getters
//   @GreaterOrEqualToNumber(
//     valueToCompare: 1,
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region GreaterOrEqualToString
// @flutterModelFormValidator
// class GreaterOrEqualToStringTest with PropertyChangeNotifier<String> {
//   GreaterOrEqualToStringTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @GreaterOrEqualToString(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterOrEqualToStringWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterOrEqualToStringWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @GreaterOrEqualToString(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: 'b',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterOrEqualToStringWithUserValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterOrEqualToStringWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @GreaterOrEqualToString(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterOrEqualToStringWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterOrEqualToStringWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @GreaterOrEqualToString(
//     valueToCompare: 'b',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region GreaterThanDatetime
// @flutterModelFormValidator
// class GreaterThanDatetimeTest with PropertyChangeNotifier<String> {
//   GreaterThanDatetimeTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @GreaterThanDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterThanDatetimeWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterThanDatetimeWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @GreaterThanDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: '2019-01-01T00:00:00',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterThanDatetimeWithUserValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterThanDatetimeWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @GreaterThanDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterThanDatetimeWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterThanDatetimeWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   DateTime _value;

//   // getters
//   @GreaterThanDateTime(
//     valueToCompare: '2019-01-01T00:00:00',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region GreaterThanNumber
// @flutterModelFormValidator
// class GreaterThanNumberTest with PropertyChangeNotifier<String> {
//   GreaterThanNumberTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @GreaterThanNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterThanNumberWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterThanNumberWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @GreaterThanNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: 1,
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterThanNumberWithUserValuesTest with PropertyChangeNotifier<String> {
//   GreaterThanNumberWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @GreaterThanNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterThanNumberWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterThanNumberWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   num _value;

//   // getters
//   @GreaterThanNumber(
//     valueToCompare: 1,
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region GreaterThanString
// @flutterModelFormValidator
// class GreaterThanStringTest with PropertyChangeNotifier<String> {
//   GreaterThanStringTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @GreaterThanString(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterThanStringWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterThanStringWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @GreaterThanString(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: 'b',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterThanStringWithUserValuesTest with PropertyChangeNotifier<String> {
//   GreaterThanStringWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @GreaterThanString(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class GreaterThanStringWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   GreaterThanStringWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @GreaterThanString(
//     valueToCompare: 'b',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region ImageSize
// @flutterModelFormValidator
// class ImageSizeTest with PropertyChangeNotifier<String> {
//   ImageSizeTest(
//     this._value,
//   );

//   // private properties
//   List<int> _value;

//   // getters
//   @ImageSize(
//     minWidth: 500,
//     minHeight: 500,
//     maxWidth: 1000,
//     maxHeight: 1000,
//     error: 'Taille d\'image incorrecte',
//   )
//   List<int> get value => this._value;

//   // setters
//   set value(List<int> value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region InText
// @flutterModelFormValidator
// class InTextTest with PropertyChangeNotifier<String> {
//   InTextTest(
//     this._value,
//     this._text,
//   );

//   // private properties
//   String _value;
//   String _text;

//   // getters
//   @InText(
//     textOnProperty: 'text',
//     error: 'Keyword is not in the string',
//   )
//   String get value => this._value;
//   String get text => this._text;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set text(String value) {
//     this._text = value;
//     notifyListeners('text');
//   }
// }

// @flutterModelFormValidator
// class InTextWithUserAndDeveloperValuesTest with PropertyChangeNotifier<String> {
//   InTextWithUserAndDeveloperValuesTest(
//     this._value,
//     this._text,
//   );

//   // private properties
//   String _value;
//   String _text;

//   // getters
//   @InText(
//     textOnProperty: 'text',
//     text:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//     error: 'Keyword is not in the string',
//   )
//   String get value => this._value;
//   String get text => this._text;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set text(String value) {
//     this._text = value;
//     notifyListeners('text');
//   }
// }

// @flutterModelFormValidator
// class InTextWithUserValuesTest with PropertyChangeNotifier<String> {
//   InTextWithUserValuesTest(
//     this._value,
//     this._text,
//   );

//   // private properties
//   String _value;
//   String _text;

//   // getters
//   @InText(
//     textOnProperty: 'text',
//     error: 'Keyword is not in the string',
//   )
//   String get value => this._value;
//   String get text => this._text;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set text(String value) {
//     this._text = value;
//     notifyListeners('text');
//   }
// }

// @flutterModelFormValidator
// class InTextWithDeveloperValuesTest with PropertyChangeNotifier<String> {
//   InTextWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @InText(
//     text:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//     error: 'Keyword is not in the string',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region MembershipPassword
// @flutterModelFormValidator
// class MembershipPasswordTest with PropertyChangeNotifier<String> {
//   MembershipPasswordTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @MembershipPassword(
//     minLength: 8,
//     maxLength: 16,
//     includesAlphabeticalCharacters: true,
//     includesUppercaseCharacters: true,
//     includesNumericalCharacters: true,
//     includesSpecialCharacters: true,
//     error: 'Invalid password',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region NotEqualToDatetime
// @flutterModelFormValidator
// class NotEqualToDatetimeTest with PropertyChangeNotifier<String> {
//   NotEqualToDatetimeTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @NotEqualToDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class NotEqualToDatetimeWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   NotEqualToDatetimeWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @NotEqualToDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: '2019-01-01T00:00:00',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class NotEqualToDatetimeWithUserValuesTest with PropertyChangeNotifier<String> {
//   NotEqualToDatetimeWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @NotEqualToDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class NotEqualToDatetimeWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   NotEqualToDatetimeWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   DateTime _value;

//   // getters
//   @NotEqualToDateTime(
//     valueToCompare: '2019-01-01T00:00:00',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region NotEqualToNumber
// @flutterModelFormValidator
// class NotEqualToNumberTest with PropertyChangeNotifier<String> {
//   NotEqualToNumberTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @NotEqualToNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class NotEqualToNumberWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   NotEqualToNumberWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @NotEqualToNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: 1,
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class NotEqualToNumberWithUserValuesTest with PropertyChangeNotifier<String> {
//   NotEqualToNumberWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @NotEqualToNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class NotEqualToNumberWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   NotEqualToNumberWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   num _value;

//   // getters
//   @NotEqualToNumber(
//     valueToCompare: 1,
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region NotEqualToString
// @flutterModelFormValidator
// class NotEqualToStringTest with PropertyChangeNotifier<String> {
//   NotEqualToStringTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @NotEqualToString(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class NotEqualToStringWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   NotEqualToStringWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @NotEqualToString(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: 'b',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class NotEqualToStringWithUserValuesTest with PropertyChangeNotifier<String> {
//   NotEqualToStringWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @NotEqualToString(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class NotEqualToStringWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   NotEqualToStringWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @NotEqualToString(
//     valueToCompare: 'b',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region NumberRange
// @flutterModelFormValidator
// class NumberRangeTest with PropertyChangeNotifier<String> {
//   NumberRangeTest(
//     this._value,
//     this._min,
//     this._max,
//   );

//   // private properties
//   num _value;
//   num _min;
//   num _max;

//   // getters
//   @NumberRange(
//     minOnProperty: 'min',
//     maxOnProperty: 'max',
//     error: 'This Number is not in the range',
//   )
//   num get value => this._value;
//   num get min => this._min;
//   num get max => this._max;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set min(num value) {
//     this._min = value;
//     notifyListeners('min');
//   }

//   set max(num value) {
//     this._max = value;
//     notifyListeners('max');
//   }
// }

// @flutterModelFormValidator
// class NumberRangeWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   NumberRangeWithUserAndDeveloperValuesTest(
//     this._value,
//     this._min,
//     this._max,
//   );

//   // private properties
//   num _value;
//   num _min;
//   num _max;

//   // getters
//   @NumberRange(
//     minOnProperty: 'min',
//     maxOnProperty: 'max',
//     min: -10,
//     max: -1,
//     error: 'This Number is not in the range',
//   )
//   num get value => this._value;
//   num get min => this._min;
//   num get max => this._max;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set min(num value) {
//     this._min = value;
//     notifyListeners('min');
//   }

//   set max(num value) {
//     this._max = value;
//     notifyListeners('max');
//   }
// }

// @flutterModelFormValidator
// class NumberRangeWithUserValuesTest with PropertyChangeNotifier<String> {
//   NumberRangeWithUserValuesTest(
//     this._value,
//     this._min,
//     this._max,
//   );

//   // private properties
//   num _value;
//   num _min;
//   num _max;

//   // getters
//   @NumberRange(
//     minOnProperty: 'min',
//     maxOnProperty: 'max',
//     error: 'This Number is not in the range',
//   )
//   num get value => this._value;
//   num get min => this._min;
//   num get max => this._max;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set min(num value) {
//     this._min = value;
//     notifyListeners('min');
//   }

//   set max(num value) {
//     this._max = value;
//     notifyListeners('max');
//   }
// }

// @flutterModelFormValidator
// class NumberRangeWithDeveloperValuesTest with PropertyChangeNotifier<String> {
//   NumberRangeWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   num _value;

//   // getters
//   @NumberRange(
//     min: -10,
//     max: -1,
//     error: 'This Number is not in the range',
//   )
//   num get value => this._value;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region PhoneNumber
// @flutterModelFormValidator
// class PhoneNumberTest with PropertyChangeNotifier<String> {
//   PhoneNumberTest(
//     this._value,
//     this._countryCode,
//     this._phoneNumberType,
//   );

//   // private properties
//   String _value;
//   String _countryCode;
//   String _phoneNumberType;

//   // getters
//   @PhoneNumber(
//     phoneNumberTypeOnProperty: 'phoneNumberType',
//     countryCodeOnProperty: 'countryCode',
//     error: 'Invalid phone number',
//   )
//   String get value => this._value;
//   String get countryCode => this._countryCode;
//   String get phoneNumberType => this._phoneNumberType;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set countryCode(String value) {
//     this._countryCode = value;
//     notifyListeners('countryCode');
//   }

//   set phoneNumberType(String value) {
//     this._phoneNumberType = value;
//     notifyListeners('phoneNumberType');
//   }
// }

// @flutterModelFormValidator
// class PhoneNumberWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   PhoneNumberWithUserAndDeveloperValuesTest(
//     this._value,
//     this._countryCode,
//     this._phoneNumberType,
//   );

//   // private properties
//   String _value;
//   String _countryCode;
//   String _phoneNumberType;

//   // getters
//   @PhoneNumber(
//     countryCodeOnProperty: 'countryCode',
//     phoneNumberTypeOnProperty: 'phoneNumberType',
//     countryCode: 'US',
//     phoneNumberType: PhoneNumberType.mobile,
//     error: 'Invalid phone number',
//   )
//   String get value => this._value;
//   String get countryCode => this._countryCode;
//   String get phoneNumberType => this._phoneNumberType;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set countryCode(String value) {
//     this._countryCode = value;
//     notifyListeners('countryCode');
//   }

//   set phoneNumberType(String value) {
//     this._phoneNumberType = value;
//     notifyListeners('phoneNumberType');
//   }
// }

// @flutterModelFormValidator
// class PhoneNumberWithUserValuesTest with PropertyChangeNotifier<String> {
//   PhoneNumberWithUserValuesTest(
//     this._value,
//     this._countryCode,
//     this._phoneNumberType,
//   );

//   // private properties
//   String _value;
//   String _countryCode;
//   String _phoneNumberType;

//   // getters
//   @PhoneNumber(
//     countryCodeOnProperty: 'countryCode',
//     phoneNumberTypeOnProperty: 'phoneNumberType',
//     error: 'Invalid phone number',
//   )
//   String get value => this._value;
//   String get countryCode => this._countryCode;
//   String get phoneNumberType => this._phoneNumberType;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set countryCode(String value) {
//     this._countryCode = value;
//     notifyListeners('countryCode');
//   }

//   set phoneNumberType(String value) {
//     this._phoneNumberType = value;
//     notifyListeners('phoneNumberType');
//   }
// }

// @flutterModelFormValidator
// class PhoneNumberWithDeveloperValuesTest with PropertyChangeNotifier<String> {
//   PhoneNumberWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @PhoneNumber(
//     countryCode: 'US',
//     phoneNumberType: PhoneNumberType.mobile,
//     error: 'Invalid phone number',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region RegularExpression
// @flutterModelFormValidator
// class RegularExpressionTest with PropertyChangeNotifier<String> {
//   RegularExpressionTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @RegularExpression(
//     expression: r'^Hello|Bye$',
//     error: 'Invalid regular expression',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region Required
// @flutterModelFormValidator
// class RequiredTest with PropertyChangeNotifier<String> {
//   RequiredTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @Required(
//     error: 'Value is required',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region SmallerOrEqualToDatetime
// @flutterModelFormValidator
// class SmallerOrEqualToDatetimeTest with PropertyChangeNotifier<String> {
//   SmallerOrEqualToDatetimeTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @SmallerOrEqualToDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerOrEqualToDatetimeWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerOrEqualToDatetimeWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @SmallerOrEqualToDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: '2019-01-01T00:00:00',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerOrEqualToDatetimeWithUserValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerOrEqualToDatetimeWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @SmallerOrEqualToDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerOrEqualToDatetimeWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerOrEqualToDatetimeWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   DateTime _value;

//   // getters
//   @SmallerOrEqualToDateTime(
//     valueToCompare: '2019-01-01T00:00:00',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region SmallerOrEqualToNumber
// @flutterModelFormValidator
// class SmallerOrEqualToNumberTest with PropertyChangeNotifier<String> {
//   SmallerOrEqualToNumberTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @SmallerOrEqualToNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerOrEqualToNumberWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerOrEqualToNumberWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @SmallerOrEqualToNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: 1,
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerOrEqualToNumberWithUserValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerOrEqualToNumberWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @SmallerOrEqualToNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerOrEqualToNumberWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerOrEqualToNumberWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   num _value;

//   // getters
//   @SmallerOrEqualToNumber(
//     valueToCompare: 1,
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region SmallerOrEqualToString
// @flutterModelFormValidator
// class SmallerOrEqualToStringTest with PropertyChangeNotifier<String> {
//   SmallerOrEqualToStringTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @SmallerOrEqualToString(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerOrEqualToStringWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerOrEqualToStringWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @SmallerOrEqualToString(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: 'b',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerOrEqualToStringWithUserValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerOrEqualToStringWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @SmallerOrEqualToString(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerOrEqualToStringWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerOrEqualToStringWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @SmallerOrEqualToString(
//     valueToCompare: 'b',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region SmallerThanDatetime
// @flutterModelFormValidator
// class SmallerThanDatetimeTest with PropertyChangeNotifier<String> {
//   SmallerThanDatetimeTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @SmallerThanDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerThanDatetimeWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerThanDatetimeWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @SmallerThanDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: '2019-01-01T00:00:00',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerThanDatetimeWithUserValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerThanDatetimeWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   DateTime _value;
//   DateTime _valueToCompare;

//   // getters
//   @SmallerThanDateTime(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;
//   DateTime get value_to_compare => this._valueToCompare;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(DateTime value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerThanDatetimeWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerThanDatetimeWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   DateTime _value;

//   // getters
//   @SmallerThanDateTime(
//     valueToCompare: '2019-01-01T00:00:00',
//     error: 'Value is not equal to the value to compare',
//   )
//   DateTime get value => this._value;

//   // setters
//   set value(DateTime value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region SmallerThanNumber
// @flutterModelFormValidator
// class SmallerThanNumberTest with PropertyChangeNotifier<String> {
//   SmallerThanNumberTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @SmallerThanNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerThanNumberWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerThanNumberWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @SmallerThanNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: 1,
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerThanNumberWithUserValuesTest with PropertyChangeNotifier<String> {
//   SmallerThanNumberWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   num _value;
//   num _valueToCompare;

//   // getters
//   @SmallerThanNumber(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;
//   num get value_to_compare => this._valueToCompare;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(num value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerThanNumberWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerThanNumberWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   num _value;

//   // getters
//   @SmallerThanNumber(
//     valueToCompare: 1,
//     error: 'Value is not equal to the value to compare',
//   )
//   num get value => this._value;

//   // setters
//   set value(num value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region SmallerThanString
// @flutterModelFormValidator
// class SmallerThanStringTest with PropertyChangeNotifier<String> {
//   SmallerThanStringTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @SmallerThanString(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerThanStringWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerThanStringWithUserAndDeveloperValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @SmallerThanString(
//     valueToCompareOnProperty: 'value_to_compare',
//     valueToCompare: 'b',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerThanStringWithUserValuesTest with PropertyChangeNotifier<String> {
//   SmallerThanStringWithUserValuesTest(
//     this._value,
//     this._valueToCompare,
//   );

//   // private properties
//   String _value;
//   String _valueToCompare;

//   // getters
//   @SmallerThanString(
//     valueToCompareOnProperty: 'value_to_compare',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;
//   String get value_to_compare => this._valueToCompare;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set value_to_compare(String value) {
//     this._valueToCompare = value;
//     notifyListeners('value_to_compare');
//   }
// }

// @flutterModelFormValidator
// class SmallerThanStringWithDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   SmallerThanStringWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @SmallerThanString(
//     valueToCompare: 'b',
//     error: 'Value is not equal to the value to compare',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region StringLength
// @flutterModelFormValidator
// class StringLengthTest with PropertyChangeNotifier<String> {
//   StringLengthTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @StringLength(
//     min: 10,
//     max: 20,
//     error: '"value" property must have between 10 and 20 characters',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region StringRange
// @flutterModelFormValidator
// class StringRangeTest with PropertyChangeNotifier<String> {
//   StringRangeTest(
//     this._value,
//     this._min,
//     this._max,
//   );

//   // private properties
//   String _value;
//   String _min;
//   String _max;

//   // getters
//   @StringRange(
//     minOnProperty: 'min',
//     maxOnProperty: 'max',
//     error: 'This string is not in the range',
//   )
//   String get value => this._value;
//   String get min => this._min;
//   String get max => this._max;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set min(String value) {
//     this._min = value;
//     notifyListeners('min');
//   }

//   set max(String value) {
//     this._max = value;
//     notifyListeners('max');
//   }
// }

// @flutterModelFormValidator
// class StringRangeWithUserAndDeveloperValuesTest
//     with PropertyChangeNotifier<String> {
//   StringRangeWithUserAndDeveloperValuesTest(
//     this._value,
//     this._min,
//     this._max,
//   );

//   // private properties
//   String _value;
//   String _min;
//   String _max;

//   // getters
//   @StringRange(
//     minOnProperty: 'min',
//     maxOnProperty: 'max',
//     min: 'a',
//     max: 'd',
//     error: 'This String is not in the range',
//   )
//   String get value => this._value;
//   String get min => this._min;
//   String get max => this._max;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set min(String value) {
//     this._min = value;
//     notifyListeners('min');
//   }

//   set max(String value) {
//     this._max = value;
//     notifyListeners('max');
//   }
// }

// @flutterModelFormValidator
// class StringRangeWithUserValuesTest with PropertyChangeNotifier<String> {
//   StringRangeWithUserValuesTest(
//     this._value,
//     this._min,
//     this._max,
//   );

//   // private properties
//   String _value;
//   String _min;
//   String _max;

//   // getters
//   @StringRange(
//     minOnProperty: 'min',
//     maxOnProperty: 'max',
//     error: 'This String is not in the range',
//   )
//   String get value => this._value;
//   String get min => this._min;
//   String get max => this._max;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }

//   set min(String value) {
//     this._min = value;
//     notifyListeners('min');
//   }

//   set max(String value) {
//     this._max = value;
//     notifyListeners('max');
//   }
// }

// @flutterModelFormValidator
// class StringRangeWithDeveloperValuesTest with PropertyChangeNotifier<String> {
//   StringRangeWithDeveloperValuesTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @StringRange(
//     min: 'a',
//     max: 'd',
//     error: 'This String is not in the range',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion

// //#region URL
// @flutterModelFormValidator
// class UrlTest with PropertyChangeNotifier<String> {
//   UrlTest(
//     this._value,
//   );

//   // private properties
//   String _value;

//   // getters
//   @URL(
//     error: 'Invalid URL',
//   )
//   String get value => this._value;

//   // setters
//   set value(String value) {
//     this._value = value;
//     notifyListeners('value');
//   }
// }
// //#endregion
