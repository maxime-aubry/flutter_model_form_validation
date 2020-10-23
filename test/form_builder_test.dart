import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('FormBuilder.', () {
    test('Unable to generate a form using by a null model.', () {
      expect(() {
        FormBuilder fb = new FormBuilder<ComplexFormTest>(null);
      }, throwsA(isA<AssertionError>()));
    });

    test('Generates a form using by a new model.', () {
      ComplexFormTest model = new ComplexFormTest(null, null, null, null);
      FormBuilder fb = new FormBuilder<ComplexFormTest>(model);

      FormArray fa;
      FormGroup fg;
      FormControl fc;

      expect(fb, isNotNull);
      expect(fb.group, isNotNull);
      expect(fb.group.controls, isNotNull);
      expect(fb.group.controls.length, 6);

      // first_name
      expect(fb.group.controls['first_name'], isNotNull);
      expect(fb.group.controls['first_name'].runtimeType, FormControl);
      fc = (fb.group.controls['first_name'] as FormControl);
      expect(fc.name, 'first_name');
      expect(fc.value, isNull);
      expect(fc.status, EAbstractControlStatus.pure);
      expect(fc.validators, isNotNull);
      expect(fc.validators.length, 2);
      expect(fc.validators[0].runtimeType, Required);
      expect(fc.validators[1].runtimeType, StringLength);
      expect(fc.error, isNull);

      // last_name
      expect(fb.group.controls['last_name'], isNotNull);
      expect(fb.group.controls['last_name'].runtimeType, FormControl);
      fc = (fb.group.controls['last_name'] as FormControl);
      expect(fc.name, 'last_name');
      expect(fc.value, isNull);
      expect(fc.status, EAbstractControlStatus.pure);
      expect(fc.validators, isNotNull);
      expect(fc.validators.length, 2);
      expect(fc.validators[0].runtimeType, Required);
      expect(fc.validators[1].runtimeType, StringLength);
      expect(fc.error, isNull);

      // birth_day
      expect(fb.group.controls['birth_day'], isNotNull);
      expect(fb.group.controls['birth_day'].runtimeType, FormControl);
      fc = (fb.group.controls['birth_day'] as FormControl);
      expect(fc.name, 'birth_day');
      expect(fc.value, isNull);
      expect(fc.status, EAbstractControlStatus.pure);
      expect(fc.validators, isNotNull);
      expect(fc.validators.length, 1);
      expect(fc.validators[0].runtimeType, Required);
      expect(fc.error, isNull);

      // subscription_date
      expect(fb.group.controls['subscription_date'], isNotNull);
      expect(fb.group.controls['subscription_date'].runtimeType, FormControl);
      fc = (fb.group.controls['subscription_date'] as FormControl);
      expect(fc.name, 'subscription_date');
      expect(fc.value, isNull);
      expect(fc.status, EAbstractControlStatus.pure);
      expect(fc.validators, isNotNull);
      expect(fc.validators.length, 3);
      expect(fc.validators[0].runtimeType, Required);
      expect(fc.validators[1].runtimeType, GreaterOrEqualToDateTime);
      expect(fc.validators[2].runtimeType, SmallerOrEqualToDateTime);
      expect(fc.error, isNull);

      // books
      expect(fb.group.controls['books'], isNotNull);
      expect(fb.group.controls['books'].runtimeType, FormArray);
      fa = (fb.group.controls['books'] as FormArray);
      expect(fa.groups, isNotNull);
      expect(fa.groups.length, 0);

      // favorite_book
      expect(fb.group.controls['favorite_book'], isNotNull);
      expect(fb.group.controls['favorite_book'].runtimeType, FormGroup);
      fg = (fb.group.controls['favorite_book'] as FormGroup);
      expect(fg.controls, isNotNull);
      expect(fg.controls.length, 3);

      // favorite_book > name
      expect(fg.controls['name'], isNotNull);
      expect(fg.controls['name'].runtimeType, FormControl);
      fc = (fg.controls['name'] as FormControl);
      expect(fc.name, 'name');
      expect(fc.value, isNull);
      expect(fc.status, EAbstractControlStatus.pure);
      expect(fc.validators, isNotNull);
      expect(fc.validators.length, 1);
      expect(fc.validators[0].runtimeType, Required);
      expect(fc.error, isNull);

      // favorite_book > price
      expect(fg.controls['price'], isNotNull);
      expect(fg.controls['price'].runtimeType, FormControl);
      fc = (fg.controls['price'] as FormControl);
      expect(fc.name, 'price');
      expect(fc.value, isNull);
      expect(fc.status, EAbstractControlStatus.pure);
      expect(fc.validators, isNotNull);
      expect(fc.validators.length, 2);
      expect(fc.validators[0].runtimeType, Required);
      expect(fc.validators[1].runtimeType, GreaterThanNumber);
      expect(fc.error, isNull);

      // favorite_book > loan date
      expect(fg.controls['loan_date'], isNotNull);
      expect(fg.controls['loan_date'].runtimeType, FormControl);
      fc = (fg.controls['loan_date'] as FormControl);
      expect(fc.name, 'loan_date');
      expect(fc.value, isNull);
      expect(fc.status, EAbstractControlStatus.pure);
      expect(fc.validators, isNotNull);
      expect(fc.validators.length, 1);
      expect(fc.validators[0].runtimeType, Required);
      expect(fc.error, isNull);
    });

    test('Generates a form using by a model with pre-entered data.', () {
      ComplexFormTest model = new ComplexFormTest(
        'Edouard',
        'Elric',
        new DateTime(1980, 12, 15),
        new DateTime(2019, 06, 01),
      );
      model.books = [
        new Book(
            'Voyage au centre de la terre', 8.9, new DateTime(2020, 04, 08)),
        new Book('De la Terre à la Lune', 8.9, new DateTime(2020, 04, 17)),
        new Book('Le Tour du monde en quatre-vingts jours', 8.9,
            new DateTime(2020, 04, 26)),
      ];
      model.favorite_book = model.books[1];

      FormBuilder fb = new FormBuilder<ComplexFormTest>(model);

      FormArray fa;
      FormGroup fg;
      FormControl fc;

      // first_name
      fc = (fb.group.controls['first_name'] as FormControl);
      expect(fc.value, 'Edouard');

      // last_name
      fc = (fb.group.controls['last_name'] as FormControl);
      expect(fc.value, 'Elric');

      // birth_day
      fc = (fb.group.controls['birth_day'] as FormControl);
      expect(fc.value, new DateTime(1980, 12, 15));

      // subscription_date
      fc = (fb.group.controls['subscription_date'] as FormControl);
      expect(fc.value, new DateTime(2019, 06, 01));

      // books
      fa = (fb.group.controls['books'] as FormArray);

      // book[0]
      fc = (fa.groups[0].controls['name'] as FormControl);
      expect(fc.value, 'Voyage au centre de la terre');
      fc = (fa.groups[0].controls['price'] as FormControl);
      expect(fc.value, 8.9);
      fc = (fa.groups[0].controls['loan_date'] as FormControl);
      expect(fc.value, new DateTime(2020, 04, 08));

      // book[1]
      fc = (fa.groups[1].controls['name'] as FormControl);
      expect(fc.value, 'De la Terre à la Lune');
      fc = (fa.groups[1].controls['price'] as FormControl);
      expect(fc.value, 8.9);
      fc = (fa.groups[1].controls['loan_date'] as FormControl);
      expect(fc.value, new DateTime(2020, 04, 17));

      // book[2]
      fc = (fa.groups[2].controls['name'] as FormControl);
      expect(fc.value, 'Le Tour du monde en quatre-vingts jours');
      fc = (fa.groups[2].controls['price'] as FormControl);
      expect(fc.value, 8.9);
      fc = (fa.groups[2].controls['loan_date'] as FormControl);
      expect(fc.value, new DateTime(2020, 04, 26));

      // favorite_book
      fg = (fb.group.controls['favorite_book'] as FormGroup);
      fc = (fg.controls['name'] as FormControl);
      expect(fc.value, 'De la Terre à la Lune');
      fc = (fg.controls['price'] as FormControl);
      expect(fc.value, 8.9);
      fc = (fg.controls['loan_date'] as FormControl);
      expect(fc.value, new DateTime(2020, 04, 17));
    });

    test('Form is updated and validated when setting a value.', () async {
      ComplexFormTest model = new ComplexFormTest(null, null, null, null);
      FormBuilder fb = new FormBuilder<ComplexFormTest>(model);

      model.favorite_book.name = 'xx';
      await Future.delayed(const Duration(microseconds: 100), () {});

      model.favorite_book.price = 10;
      await Future.delayed(const Duration(microseconds: 100), () {});

      model.favorite_book.loan_date = new DateTime(2020, 01, 01);
      await Future.delayed(const Duration(microseconds: 100), () {});
    });
  });
}
