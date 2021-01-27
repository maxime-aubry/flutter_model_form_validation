import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('FormDeclarers.', () {
    group('FormGroupElement.', () {
      test(
          'FormGroupElement object with FormBuilderTest type is safely instanciated. Values are null.', () {
        FormBuilderTest model = new FormBuilderTest(null, null, null, null);
        FormGroupElement<FormBuilderTest> formGroup = new FormGroupElement<FormBuilderTest>(model);

        expect(formGroup, isNotNull);
        expect(formGroup.value, isNotNull);
        expect(formGroup.value.firstName, isNotNull);
        expect(formGroup.value.lastName, isNotNull);
        expect(formGroup.value.birthDay, isNotNull);
        expect(formGroup.value.subscriptionDate, isNotNull);
        expect(formGroup.value.books, isNotNull);
        expect(formGroup.value.favoriteBook, isNotNull);

        expect(formGroup.value, isA<FormBuilderTest>());
        expect(formGroup.value.firstName, isA<FormControlElement>());
        expect(formGroup.value.lastName, isA<FormControlElement>());
        expect(formGroup.value.birthDay, isA<FormControlElement>());
        expect(formGroup.value.subscriptionDate, isA<FormControlElement>());
        expect(formGroup.value.books, isA<FormArrayElement>());
        expect(formGroup.value.favoriteBook, isA<FormGroupElement>());

        expect(formGroup.value, model);
        expect(formGroup.value.firstName.value, isNull);
        expect(formGroup.value.lastName.value, isNull);
        expect(formGroup.value.birthDay.value, isNull);
        expect(formGroup.value.subscriptionDate.value, isNull);
        expect(formGroup.value.books.value, []);
        expect(formGroup.value.favoriteBook.value, isNull);
      });
      
      test(
          'FormGroupElement object with FormBuilderTest type is safely instanciated. Values are provided.', () {
        FormBuilderTest model = new FormBuilderTest(
          'Edouard',
          'Elric',
          new DateTime(1980, 12, 15),
          new DateTime(2019, 06, 01),
        );
        FormGroupElement<FormBuilderTest> formGroup = new FormGroupElement<FormBuilderTest>(model);

        expect(formGroup, isNotNull);
        expect(formGroup.value, isNotNull);
        expect(formGroup.value.firstName, isNotNull);
        expect(formGroup.value.lastName, isNotNull);
        expect(formGroup.value.birthDay, isNotNull);
        expect(formGroup.value.subscriptionDate, isNotNull);
        expect(formGroup.value.books, isNotNull);
        expect(formGroup.value.favoriteBook, isNotNull);

        expect(formGroup.value, isA<FormBuilderTest>());
        expect(formGroup.value.firstName, isA<FormControlElement>());
        expect(formGroup.value.lastName, isA<FormControlElement>());
        expect(formGroup.value.birthDay, isA<FormControlElement>());
        expect(formGroup.value.subscriptionDate, isA<FormControlElement>());
        expect(formGroup.value.books, isA<FormArrayElement>());
        expect(formGroup.value.favoriteBook, isA<FormGroupElement>());

        expect(formGroup.value, model);
        expect(formGroup.value.firstName.value, 'Edouard');
        expect(formGroup.value.lastName.value, 'Elric');
        expect(formGroup.value.birthDay.value, new DateTime(1980, 12, 15));
        expect(formGroup.value.subscriptionDate.value, new DateTime(2019, 06, 01));
        expect(formGroup.value.books.value, []);
        expect(formGroup.value.favoriteBook.value, isNull);
      });
      
      test(
          'FormGroupElement object is safely instanciated. Listener updates the value.',
          () {
        FormBuilderTest copy;
        FormGroupElement<FormBuilderTest> formGroup = new FormGroupElement<FormBuilderTest>(null);

        formGroup.addListener(() {
          copy = formGroup.value;
        });

        expect(formGroup.value, isNull);
        formGroup.value = new FormBuilderTest(
          'Edouard',
          'Elric',
          new DateTime(1980, 12, 15),
          new DateTime(2019, 06, 01),
        );
        expect(formGroup.value, isNotNull);
        expect(formGroup.value, copy);
      });
    });
  });
}