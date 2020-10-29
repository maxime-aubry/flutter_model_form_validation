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
  @Required(error: 'error message here')
  @StringLength(min: 3, max: 50, error: 'error message here')
  String get first_name => this._firstName;

  @Required(error: 'error message here')
  @StringLength(min: 3, max: 50, error: 'error message here')
  String get last_name => this._lastName;

  @Required(error: 'error message here')
  DateTime get birth_day => this._birthDay;

  @Required(error: 'error message here')
  @GreaterOrEqualToDateTime(
      valueToCompareOnProperty: 'birth_day', error: 'error message here')
  @SmallerOrEqualToDateTime(
      valueToCompare: '2020-01-01', error: 'error message here')
  DateTime get subscription_date => this._subscriptionDate;

  @NbItems(min: 1, max: 3, error: 'error message here')
  List<Book> get books => this._books;

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
  @Required(error: 'error message here')
  @StringLength(min: 3, max: 100, error: 'error message here')
  String get name => this._name;

  @Required(error: 'price is required')
  @GreaterThanNumber(valueToCompare: 0, error: 'error message here')
  num get price => this._price;

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

//#region ContainsDateTime
@flutterModelFormValidator
class ContainsDateTimeTest extends ModelForm {
  ContainsDateTimeTest(
    this._value,
  );

  // private properties
  DateTime _value;

  // getters
  @ContainsDateTime(
    items: ['2020-01-01', '2020-06-01', '2020-12-31'],
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

//#region ContainsNumber
@flutterModelFormValidator
class ContainsNumberTest extends ModelForm {
  ContainsNumberTest(
    this._value,
  );

  // private properties
  num _value;

  // getters
  @ContainsNumber(
    items: [1, 2, 3],
    error: 'error message here',
  )
  num get value => this._value;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region ContainsString
@flutterModelFormValidator
class ContainsStringTest extends ModelForm {
  ContainsStringTest(
    this._value,
  );

  // private properties
  String _value;

  // getters
  @ContainsString(
    items: ['lorem', 'ipsum', 'dolor', 'sit', 'amet'],
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

//#region DateTimeRange
@flutterModelFormValidator
class DateTimeRangeTest extends ModelForm {
  DateTimeRangeTest(
    this._value,
    this._min,
    this._max,
  );

  // private properties
  DateTime _value;
  DateTime _min;
  DateTime _max;

  // getters
  @DateTimeRange(
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

@flutterModelFormValidator
class DateTimeRangeWithUserAndDeveloperValuesTest extends ModelForm {
  DateTimeRangeWithUserAndDeveloperValuesTest(
    this._value,
    this._min,
    this._max,
  );

  // private properties
  DateTime _value;
  DateTime _min;
  DateTime _max;

  // getters
  @DateTimeRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    min: '2019-01-01',
    max: '2019-12-31',
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

  set min(DateTime min) {
    this._min = min;
    this.notifyModelState('min');
  }

  set max(DateTime max) {
    this._max = max;
    this.notifyModelState('max');
  }
}

@flutterModelFormValidator
class DateTimeRangeWithUserValuesTest extends ModelForm {
  DateTimeRangeWithUserValuesTest(
    this._value,
    this._min,
    this._max,
  );

  // private properties
  @DateTimeRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  DateTime _value;
  DateTime _min;
  DateTime _max;

  // getters
  DateTime get value => this._value;
  DateTime get min => this._min;
  DateTime get max => this._max;

  // setters
  set value(DateTime value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set min(DateTime min) {
    this._min = min;
    this.notifyModelState('min');
  }

  set max(DateTime max) {
    this._max = max;
    this.notifyModelState('max');
  }
}

@flutterModelFormValidator
class DateTimeRangeWithDeveloperValuesTest extends ModelForm {
  DateTimeRangeWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  DateTime _value;

  // getters
  @DateTimeRange(
    min: '2019-01-01',
    max: '2019-12-31',
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

//#region Email
@flutterModelFormValidator
class EmailTest extends ModelForm {
  EmailTest(
    this._value,
  );

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

//#region EqualToDatetime
@flutterModelFormValidator
class EqualToDatetimeTest extends ModelForm {
  EqualToDatetimeTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @EqualToDateTime(
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

@flutterModelFormValidator
class EqualToDatetimeWithUserAndDeveloperValuesTest extends ModelForm {
  EqualToDatetimeWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @EqualToDateTime(
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

@flutterModelFormValidator
class EqualToDatetimeWithUserValuesTest extends ModelForm {
  EqualToDatetimeWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @EqualToDateTime(
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

@flutterModelFormValidator
class EqualToDatetimeWithDeveloperValuesTest extends ModelForm {
  EqualToDatetimeWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  DateTime _value;

  // getters
  @EqualToDateTime(
    valueToCompare: '2019-01-01T00:00:00',
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

//#region EqualToNumber
@flutterModelFormValidator
class EqualToNumberTest extends ModelForm {
  EqualToNumberTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @EqualToNumber(
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

@flutterModelFormValidator
class EqualToNumberWithUserAndDeveloperValuesTest extends ModelForm {
  EqualToNumberWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @EqualToNumber(
    valueToCompareOnProperty: 'value_to_compare',
    valueToCompare: 1,
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

@flutterModelFormValidator
class EqualToNumberWithUserValuesTest extends ModelForm {
  EqualToNumberWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @EqualToNumber(
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

@flutterModelFormValidator
class EqualToNumberWithDeveloperValuesTest extends ModelForm {
  EqualToNumberWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  num _value;

  // getters
  @EqualToNumber(
    valueToCompare: 1,
    error: 'error message here',
  )
  num get value => this._value;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region EqualToString
@flutterModelFormValidator
class EqualToStringTest extends ModelForm {
  EqualToStringTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @EqualToString(
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

@flutterModelFormValidator
class EqualToStringWithUserAndDeveloperValuesTest extends ModelForm {
  EqualToStringWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @EqualToString(
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

@flutterModelFormValidator
class EqualToStringWithUserValuesTest extends ModelForm {
  EqualToStringWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @EqualToString(
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

@flutterModelFormValidator
class EqualToStringWithDeveloperValuesTest extends ModelForm {
  EqualToStringWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  String _value;

  // getters
  @EqualToString(
    valueToCompare: 'b',
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

//#region FileMimeType
@flutterModelFormValidator
class FileMimeTypeTest extends ModelForm {
  FileMimeTypeTest(
    this._value,
  );

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
  FileSizeTest(
    this._value,
  );

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
  GreaterOrEqualToDatetimeTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @GreaterOrEqualToDateTime(
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

@flutterModelFormValidator
class GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest extends ModelForm {
  GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @GreaterOrEqualToDateTime(
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

@flutterModelFormValidator
class GreaterOrEqualToDatetimeWithUserValuesTest extends ModelForm {
  GreaterOrEqualToDatetimeWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @GreaterOrEqualToDateTime(
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

@flutterModelFormValidator
class GreaterOrEqualToDatetimeWithDeveloperValuesTest extends ModelForm {
  GreaterOrEqualToDatetimeWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  DateTime _value;

  // getters
  @GreaterOrEqualToDateTime(
    valueToCompare: '2019-01-01T00:00:00',
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

//#region GreaterOrEqualToNumber
@flutterModelFormValidator
class GreaterOrEqualToNumberTest extends ModelForm {
  GreaterOrEqualToNumberTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @GreaterOrEqualToNumber(
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

@flutterModelFormValidator
class GreaterOrEqualToNumberWithUserAndDeveloperValuesTest extends ModelForm {
  GreaterOrEqualToNumberWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @GreaterOrEqualToNumber(
    valueToCompareOnProperty: 'value_to_compare',
    valueToCompare: 1,
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

@flutterModelFormValidator
class GreaterOrEqualToNumberWithUserValuesTest extends ModelForm {
  GreaterOrEqualToNumberWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @GreaterOrEqualToNumber(
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

@flutterModelFormValidator
class GreaterOrEqualToNumberWithDeveloperValuesTest extends ModelForm {
  GreaterOrEqualToNumberWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  num _value;

  // getters
  @GreaterOrEqualToNumber(
    valueToCompare: 1,
    error: 'error message here',
  )
  num get value => this._value;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region GreaterOrEqualToString
@flutterModelFormValidator
class GreaterOrEqualToStringTest extends ModelForm {
  GreaterOrEqualToStringTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @GreaterOrEqualToString(
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

@flutterModelFormValidator
class GreaterOrEqualToStringWithUserAndDeveloperValuesTest extends ModelForm {
  GreaterOrEqualToStringWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @GreaterOrEqualToString(
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

@flutterModelFormValidator
class GreaterOrEqualToStringWithUserValuesTest extends ModelForm {
  GreaterOrEqualToStringWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @GreaterOrEqualToString(
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

@flutterModelFormValidator
class GreaterOrEqualToStringWithDeveloperValuesTest extends ModelForm {
  GreaterOrEqualToStringWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  String _value;

  // getters
  @GreaterOrEqualToString(
    valueToCompare: 'b',
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

//#region GreaterThanDatetime
@flutterModelFormValidator
class GreaterThanDatetimeTest extends ModelForm {
  GreaterThanDatetimeTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @GreaterThanDateTime(
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

@flutterModelFormValidator
class GreaterThanDatetimeWithUserAndDeveloperValuesTest extends ModelForm {
  GreaterThanDatetimeWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @GreaterThanDateTime(
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

@flutterModelFormValidator
class GreaterThanDatetimeWithUserValuesTest extends ModelForm {
  GreaterThanDatetimeWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @GreaterThanDateTime(
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

@flutterModelFormValidator
class GreaterThanDatetimeWithDeveloperValuesTest extends ModelForm {
  GreaterThanDatetimeWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  DateTime _value;

  // getters
  @GreaterThanDateTime(
    valueToCompare: '2019-01-01T00:00:00',
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

//#region GreaterThanNumber
@flutterModelFormValidator
class GreaterThanNumberTest extends ModelForm {
  GreaterThanNumberTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @GreaterThanNumber(
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

@flutterModelFormValidator
class GreaterThanNumberWithUserAndDeveloperValuesTest extends ModelForm {
  GreaterThanNumberWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @GreaterThanNumber(
    valueToCompareOnProperty: 'value_to_compare',
    valueToCompare: 1,
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

@flutterModelFormValidator
class GreaterThanNumberWithUserValuesTest extends ModelForm {
  GreaterThanNumberWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @GreaterThanNumber(
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

@flutterModelFormValidator
class GreaterThanNumberWithDeveloperValuesTest extends ModelForm {
  GreaterThanNumberWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  num _value;

  // getters
  @GreaterThanNumber(
    valueToCompare: 1,
    error: 'error message here',
  )
  num get value => this._value;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region GreaterThanString
@flutterModelFormValidator
class GreaterThanStringTest extends ModelForm {
  GreaterThanStringTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @GreaterThanString(
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

@flutterModelFormValidator
class GreaterThanStringWithUserAndDeveloperValuesTest extends ModelForm {
  GreaterThanStringWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @GreaterThanString(
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

@flutterModelFormValidator
class GreaterThanStringWithUserValuesTest extends ModelForm {
  GreaterThanStringWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @GreaterThanString(
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

@flutterModelFormValidator
class GreaterThanStringWithDeveloperValuesTest extends ModelForm {
  GreaterThanStringWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  String _value;

  // getters
  @GreaterThanString(
    valueToCompare: 'b',
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

//#region ImageSize
@flutterModelFormValidator
class ImageSizeTest extends ModelForm {
  ImageSizeTest(
    this._value,
  );

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
  InTextTest(
    this._value,
    this._text,
  );

  // private properties
  String _value;
  String _text;

  // getters
  @InText(
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

@flutterModelFormValidator
class InTextWithUserAndDeveloperValuesTest extends ModelForm {
  InTextWithUserAndDeveloperValuesTest(
    this._value,
    this._text,
  );

  // private properties
  String _value;
  String _text;

  // getters
  @InText(
    textOnProperty: 'text',
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
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

@flutterModelFormValidator
class InTextWithUserValuesTest extends ModelForm {
  InTextWithUserValuesTest(
    this._value,
    this._text,
  );

  // private properties
  String _value;
  String _text;

  // getters
  @InText(
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

@flutterModelFormValidator
class InTextWithDeveloperValuesTest extends ModelForm {
  InTextWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  String _value;

  // getters
  @InText(
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
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

//#region MembershipPassword
@flutterModelFormValidator
class MembershipPasswordTest extends ModelForm {
  MembershipPasswordTest(
    this._value,
  );

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
  NbItemsTest(
    this._value,
    this._min,
    this._max,
  );

  // private properties
  List<String> _value;
  int _min;
  int _max;

  // getters
  @NbItems(
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

@flutterModelFormValidator
class NbItemsWithUserAndDeveloperValuesTest extends ModelForm {
  NbItemsWithUserAndDeveloperValuesTest(
    this._value,
    this._min,
    this._max,
  );

  // private properties
  List<String> _value;
  int _min;
  int _max;

  // getters
  @NbItems(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    min: 1,
    max: 3,
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

  set min(int min) {
    this._min = min;
    this.notifyModelState('min');
  }

  set max(int max) {
    this._max = max;
    this.notifyModelState('max');
  }
}

@flutterModelFormValidator
class NbItemsWithUserValuesTest extends ModelForm {
  NbItemsWithUserValuesTest(
    this._value,
    this._min,
    this._max,
  );

  // private properties
  @NbItems(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    error: 'error message here',
  )
  List<String> _value;
  int _min;
  int _max;

  // getters
  List<String> get value => this._value;
  int get min => this._min;
  int get max => this._max;

  // setters
  set value(List<String> value) {
    this._value = value;
    this.notifyModelState('value');
  }

  set min(int min) {
    this._min = min;
    this.notifyModelState('min');
  }

  set max(int max) {
    this._max = max;
    this.notifyModelState('max');
  }
}

@flutterModelFormValidator
class NbItemsWithDeveloperValuesTest extends ModelForm {
  NbItemsWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  List<String> _value;

  // getters
  @NbItems(
    min: 1,
    max: 3,
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

//#region NotEqualToDatetime
@flutterModelFormValidator
class NotEqualToDatetimeTest extends ModelForm {
  NotEqualToDatetimeTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @NotEqualToDateTime(
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

@flutterModelFormValidator
class NotEqualToDatetimeWithUserAndDeveloperValuesTest extends ModelForm {
  NotEqualToDatetimeWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @NotEqualToDateTime(
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

@flutterModelFormValidator
class NotEqualToDatetimeWithUserValuesTest extends ModelForm {
  NotEqualToDatetimeWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @NotEqualToDateTime(
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

@flutterModelFormValidator
class NotEqualToDatetimeWithDeveloperValuesTest extends ModelForm {
  NotEqualToDatetimeWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  DateTime _value;

  // getters
  @NotEqualToDateTime(
    valueToCompare: '2019-01-01T00:00:00',
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

//#region NotEqualToNumber
@flutterModelFormValidator
class NotEqualToNumberTest extends ModelForm {
  NotEqualToNumberTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @NotEqualToNumber(
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

@flutterModelFormValidator
class NotEqualToNumberWithUserAndDeveloperValuesTest extends ModelForm {
  NotEqualToNumberWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @NotEqualToNumber(
    valueToCompareOnProperty: 'value_to_compare',
    valueToCompare: 1,
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

@flutterModelFormValidator
class NotEqualToNumberWithUserValuesTest extends ModelForm {
  NotEqualToNumberWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @NotEqualToNumber(
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

@flutterModelFormValidator
class NotEqualToNumberWithDeveloperValuesTest extends ModelForm {
  NotEqualToNumberWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  num _value;

  // getters
  @NotEqualToNumber(
    valueToCompare: 1,
    error: 'error message here',
  )
  num get value => this._value;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region NotEqualToString
@flutterModelFormValidator
class NotEqualToStringTest extends ModelForm {
  NotEqualToStringTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @NotEqualToString(
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

@flutterModelFormValidator
class NotEqualToStringWithUserAndDeveloperValuesTest extends ModelForm {
  NotEqualToStringWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @NotEqualToString(
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

@flutterModelFormValidator
class NotEqualToStringWithUserValuesTest extends ModelForm {
  NotEqualToStringWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @NotEqualToString(
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

@flutterModelFormValidator
class NotEqualToStringWithDeveloperValuesTest extends ModelForm {
  NotEqualToStringWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  String _value;

  // getters
  @NotEqualToString(
    valueToCompare: 'b',
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

//#region NumberRange
@flutterModelFormValidator
class NumberRangeTest extends ModelForm {
  NumberRangeTest(
    this._value,
    this._min,
    this._max,
  );

  // private properties
  num _value;
  num _min;
  num _max;

  // getters
  @NumberRange(
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

@flutterModelFormValidator
class NumberRangeWithUserAndDeveloperValuesTest extends ModelForm {
  NumberRangeWithUserAndDeveloperValuesTest(
    this._value,
    this._min,
    this._max,
  );

  // private properties
  num _value;
  num _min;
  num _max;

  // getters
  @NumberRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    min: -10,
    max: -1,
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

@flutterModelFormValidator
class NumberRangeWithUserValuesTest extends ModelForm {
  NumberRangeWithUserValuesTest(
    this._value,
    this._min,
    this._max,
  );

  // private properties
  num _value;
  num _min;
  num _max;

  // getters
  @NumberRange(
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

@flutterModelFormValidator
class NumberRangeWithDeveloperValuesTest extends ModelForm {
  NumberRangeWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  num _value;

  // getters
  @NumberRange(
    min: -10,
    max: -1,
    error: 'error message here',
  )
  num get value => this._value;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region PhoneNumber
@flutterModelFormValidator
class PhoneNumberTest extends ModelForm {
  PhoneNumberTest(
    this._value,
    this._countryCode,
    this._phoneNumberType,
  );

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

@flutterModelFormValidator
class PhoneNumberWithUserAndDeveloperValuesTest extends ModelForm {
  PhoneNumberWithUserAndDeveloperValuesTest(
    this._value,
    this._countryCode,
    this._phoneNumberType,
  );

  // private properties
  String _value;
  String _countryCode;
  String _phoneNumberType;

  // getters
  @PhoneNumber(
    countryCodeOnProperty: 'countryCode',
    phoneNumberTypeOnProperty: 'phoneNumberType',
    countryCode: 'US',
    phoneNumberType: PhoneNumberType.mobile,
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

@flutterModelFormValidator
class PhoneNumberWithUserValuesTest extends ModelForm {
  PhoneNumberWithUserValuesTest(
    this._value,
    this._countryCode,
    this._phoneNumberType,
  );

  // private properties
  String _value;
  String _countryCode;
  String _phoneNumberType;

  // getters
  @PhoneNumber(
    countryCodeOnProperty: 'countryCode',
    phoneNumberTypeOnProperty: 'phoneNumberType',
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

@flutterModelFormValidator
class PhoneNumberWithDeveloperValuesTest extends ModelForm {
  PhoneNumberWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  String _value;

  // getters
  @PhoneNumber(
    countryCode: 'US',
    phoneNumberType: PhoneNumberType.mobile,
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

//#region RegularExpression
@flutterModelFormValidator
class RegularExpressionTest extends ModelForm {
  RegularExpressionTest(
    this._value,
  );

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
  RequiredTest(
    this._value,
  );

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

//#region SmallerOrEqualToDatetime
@flutterModelFormValidator
class SmallerOrEqualToDatetimeTest extends ModelForm {
  SmallerOrEqualToDatetimeTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @SmallerOrEqualToDateTime(
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

@flutterModelFormValidator
class SmallerOrEqualToDatetimeWithUserAndDeveloperValuesTest extends ModelForm {
  SmallerOrEqualToDatetimeWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @SmallerOrEqualToDateTime(
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

@flutterModelFormValidator
class SmallerOrEqualToDatetimeWithUserValuesTest extends ModelForm {
  SmallerOrEqualToDatetimeWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @SmallerOrEqualToDateTime(
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

@flutterModelFormValidator
class SmallerOrEqualToDatetimeWithDeveloperValuesTest extends ModelForm {
  SmallerOrEqualToDatetimeWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  DateTime _value;

  // getters
  @SmallerOrEqualToDateTime(
    valueToCompare: '2019-01-01T00:00:00',
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

//#region SmallerOrEqualToNumber
@flutterModelFormValidator
class SmallerOrEqualToNumberTest extends ModelForm {
  SmallerOrEqualToNumberTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @SmallerOrEqualToNumber(
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

@flutterModelFormValidator
class SmallerOrEqualToNumberWithUserAndDeveloperValuesTest extends ModelForm {
  SmallerOrEqualToNumberWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @SmallerOrEqualToNumber(
    valueToCompareOnProperty: 'value_to_compare',
    valueToCompare: 1,
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

@flutterModelFormValidator
class SmallerOrEqualToNumberWithUserValuesTest extends ModelForm {
  SmallerOrEqualToNumberWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @SmallerOrEqualToNumber(
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

@flutterModelFormValidator
class SmallerOrEqualToNumberWithDeveloperValuesTest extends ModelForm {
  SmallerOrEqualToNumberWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  num _value;

  // getters
  @SmallerOrEqualToNumber(
    valueToCompare: 1,
    error: 'error message here',
  )
  num get value => this._value;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region SmallerOrEqualToString
@flutterModelFormValidator
class SmallerOrEqualToStringTest extends ModelForm {
  SmallerOrEqualToStringTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @SmallerOrEqualToString(
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

@flutterModelFormValidator
class SmallerOrEqualToStringWithUserAndDeveloperValuesTest extends ModelForm {
  SmallerOrEqualToStringWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @SmallerOrEqualToString(
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

@flutterModelFormValidator
class SmallerOrEqualToStringWithUserValuesTest extends ModelForm {
  SmallerOrEqualToStringWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @SmallerOrEqualToString(
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

@flutterModelFormValidator
class SmallerOrEqualToStringWithDeveloperValuesTest extends ModelForm {
  SmallerOrEqualToStringWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  String _value;

  // getters
  @SmallerOrEqualToString(
    valueToCompare: 'b',
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

//#region SmallerThanDatetime
@flutterModelFormValidator
class SmallerThanDatetimeTest extends ModelForm {
  SmallerThanDatetimeTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @SmallerThanDateTime(
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

@flutterModelFormValidator
class SmallerThanDatetimeWithUserAndDeveloperValuesTest extends ModelForm {
  SmallerThanDatetimeWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @SmallerThanDateTime(
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

@flutterModelFormValidator
class SmallerThanDatetimeWithUserValuesTest extends ModelForm {
  SmallerThanDatetimeWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  DateTime _value;
  DateTime _valueToCompare;

  // getters
  @SmallerThanDateTime(
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

@flutterModelFormValidator
class SmallerThanDatetimeWithDeveloperValuesTest extends ModelForm {
  SmallerThanDatetimeWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  DateTime _value;

  // getters
  @SmallerThanDateTime(
    valueToCompare: '2019-01-01T00:00:00',
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

//#region SmallerThanNumber
@flutterModelFormValidator
class SmallerThanNumberTest extends ModelForm {
  SmallerThanNumberTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @SmallerThanNumber(
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

@flutterModelFormValidator
class SmallerThanNumberWithUserAndDeveloperValuesTest extends ModelForm {
  SmallerThanNumberWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @SmallerThanNumber(
    valueToCompareOnProperty: 'value_to_compare',
    valueToCompare: 1,
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

@flutterModelFormValidator
class SmallerThanNumberWithUserValuesTest extends ModelForm {
  SmallerThanNumberWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  num _value;
  num _valueToCompare;

  // getters
  @SmallerThanNumber(
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

@flutterModelFormValidator
class SmallerThanNumberWithDeveloperValuesTest extends ModelForm {
  SmallerThanNumberWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  num _value;

  // getters
  @SmallerThanNumber(
    valueToCompare: 1,
    error: 'error message here',
  )
  num get value => this._value;

  // setters
  set value(num value) {
    this._value = value;
    this.notifyModelState('value');
  }
}
//#endregion

//#region SmallerThanString
@flutterModelFormValidator
class SmallerThanStringTest extends ModelForm {
  SmallerThanStringTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @SmallerThanString(
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

@flutterModelFormValidator
class SmallerThanStringWithUserAndDeveloperValuesTest extends ModelForm {
  SmallerThanStringWithUserAndDeveloperValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @SmallerThanString(
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

@flutterModelFormValidator
class SmallerThanStringWithUserValuesTest extends ModelForm {
  SmallerThanStringWithUserValuesTest(
    this._value,
    this._valueToCompare,
  );

  // private properties
  String _value;
  String _valueToCompare;

  // getters
  @SmallerThanString(
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

@flutterModelFormValidator
class SmallerThanStringWithDeveloperValuesTest extends ModelForm {
  SmallerThanStringWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  String _value;

  // getters
  @SmallerThanString(
    valueToCompare: 'b',
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
  StringRangeTest(
    this._value,
    this._min,
    this._max,
  );

  // private properties
  String _value;
  String _min;
  String _max;

  // getters
  @StringRange(
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

@flutterModelFormValidator
class StringRangeWithUserAndDeveloperValuesTest extends ModelForm {
  StringRangeWithUserAndDeveloperValuesTest(
    this._value,
    this._min,
    this._max,
  );

  // private properties
  String _value;
  String _min;
  String _max;

  // getters
  @StringRange(
    minOnProperty: 'min',
    maxOnProperty: 'max',
    min: 'a',
    max: 'd',
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

@flutterModelFormValidator
class StringRangeWithUserValuesTest extends ModelForm {
  StringRangeWithUserValuesTest(
    this._value,
    this._min,
    this._max,
  );

  // private properties
  String _value;
  String _min;
  String _max;

  // getters
  @StringRange(
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

@flutterModelFormValidator
class StringRangeWithDeveloperValuesTest extends ModelForm {
  StringRangeWithDeveloperValuesTest(
    this._value,
  );

  // private properties
  String _value;

  // getters
  @StringRange(
    min: 'a',
    max: 'd',
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
