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
Better Comments
bloc
Dart Data Class Generator
indent-rainbow
*/

void main() {}

@flutterModelFormValidator
enum EGender { male, female }

@flutterModelFormValidator
enum ELiteraryGenre { poetry, drama, prose, fiction, non_fiction }

@flutterModelFormValidator
class StepForm extends ModelForm {
  StepForm() {
    this.author = new FormGroupElement<AuthorStep>(new AuthorStep());
    this.books = new FormGroupElement<BooksStep>(new BooksStep());
  }

  FormGroupElement<AuthorStep> author;
  FormGroupElement<BooksStep> books;
}

@flutterModelFormValidator
class AuthorStep extends ModelForm {
  AuthorStep() {
    this.firstName = new FormControlElement<String>(null);
    this.lastName = new FormControlElement<String>(null);
    this.gender = new FormControlElement<EGender>(null);
    this.birthDay = new FormControlElement<DateTime>(null);
    this.subscriptionDate = new FormControlElement<DateTime>(null);
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
class BooksStep extends ModelForm {
  BooksStep() {
    this.books = new FormArrayElement<Book>([]);
  }

  FormArrayElement<Book> books;
}

@flutterModelFormValidator
class Book extends ModelForm {
  Book() {
    this.title = new FormControlElement<String>(null);
    this.literaryGenres = new FormControlElement<List<ELiteraryGenre>>([]);
    this.releaseDate = new FormControlElement<DateTime>(null);
    this.price = new FormControlElement<num>(null);
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
