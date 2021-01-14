@flutterModelFormValidator
library example.models;

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

void main() {}

@flutterModelFormValidator
enum EGender { Male, Female }

@flutterModelFormValidator
enum ELiteraryGenre { Poetry, Drama, Prose, Fiction, NonFiction }

@flutterModelFormValidator
class StepForm extends ModelForm {
  StepForm() {
    this.reader = new FormGroupElement<Reader>(
      new Reader(null, null, null, null, null),
    );
    this.books = new FormArrayElement<Book>([]);
  }

  FormGroupElement<Reader> reader;

  @NbItems(min: '1', error: 'reader must have at least one book')
  FormArrayElement<Book> books;
}

@flutterModelFormValidator
class Reader extends ModelForm {
  Reader(
    String firstName,
    String lastName,
    EGender gender,
    DateTime birthDay,
    DateTime subscriptionDate,
  ) {
    this.firstName = new FormControlElement<String>(firstName);
    this.lastName = new FormControlElement<String>(lastName);
    this.gender = new FormControlElement<EGender>(gender);
    this.birthDay = new FormControlElement<DateTime>(birthDay);
    this.subscriptionDate = new FormControlElement<DateTime>(subscriptionDate);
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

  @Required(error: 'gender is required')
  FormControlElement<EGender> gender;

  @Required(error: 'birthday is required')
  FormControlElement<DateTime> birthDay;

  @Required(error: 'subscriptionDate is required')
  @GreaterThan(
    valueToCompareOnProperty: 'birthDay',
    error: 'subscription date must be greater than birthday',
  )
  FormControlElement<DateTime> subscriptionDate;
}

@flutterModelFormValidator
class Book extends ModelForm {
  Book(
    String title,
    List<ELiteraryGenre> literaryGenres,
    DateTime releaseDate,
    num price,
  ) {
    this.title = new FormControlElement<String>(title);
    this.literaryGenres = new FormControlElement<List<ELiteraryGenre>>(
      literaryGenres,
    );
    this.releaseDate = new FormControlElement<DateTime>(releaseDate);
    this.price = new FormControlElement<num>(price);
  }

  @Required(error: 'title is required')
  @StringLength(
    min: 3,
    max: 100,
    error: 'title must have between 3 and 100 characters',
  )
  FormControlElement<String> title;

  @Required(error: 'literaty genre is required')
  FormControlElement<List<ELiteraryGenre>> literaryGenres;

  @Required(error: 'release date is required')
  FormControlElement<DateTime> releaseDate;

  @Required(error: 'price is required')
  @GreaterThan(valueToCompare: '0', error: 'price must be greater than 0')
  FormControlElement<num> price;
}
