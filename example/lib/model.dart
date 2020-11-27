import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

/*
Beautify
Bracket pair colorizer
Dart
Flutter
Flutter Widget Snippets
Awesome Flutter Snippets
Better COmments
bloc
Dart Data Class Generator
indent-rainbow
*/

@flutterModelFormValidator
class Reader extends ModelForm {
  Reader(
    String firstName,
    String lastName,
    DateTime birthDay,
    DateTime subscriptionDate,
  ) {
    this.firstName = new FormControlElement<String>(firstName);
    this.lastName = new FormControlElement<String>(lastName);
    this.birthDay = new FormControlElement<DateTime>(birthDay);
    this.subscriptionDate = new FormControlElement<DateTime>(subscriptionDate);
    this.books = new FormArrayElement<Book>([]);
  }

  @Required(error: 'firstname is required')
  @StringLength(
    min: 3,
    max: 50,
    error: 'firstname must have between 3 and 50 characters',
  )
  FormControlElement<String> firstName;

  @Required(error: 'lastname is required')
  @StringLength(
    min: 3,
    max: 50,
    error: 'lastname must have between 3 and 50 characters',
  )
  FormControlElement<String> lastName;

  @Required(error: 'birthday is required')
  FormControlElement<DateTime> birthDay;

  @Required(error: 'subscriptionDate is required')
  @GreaterThan(
    valueToCompareOnProperty: 'birthDay',
    error: 'subscription date must be greater than birthday',
  )
  FormControlElement<DateTime> subscriptionDate;

  @NbItems(min: '1', error: 'reader must have at least one book')
  FormArrayElement<Book> books;
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

  @Required(error: 'name is required')
  @StringLength(
    min: 3,
    max: 100,
    error: 'name must have between 3 and 100 characters',
  )
  FormControlElement<String> name;

  @Required(error: 'price is required')
  @GreaterThan(valueToCompare: '0', error: 'price must be greater than 0')
  FormControlElement<num> price;

  @Required(error: 'loan date is required')
  FormControlElement<DateTime> loanDate;

  @Required(error: 'literaty genre is required')
  FormControlElement<List<int>> literaryGenres;
}
