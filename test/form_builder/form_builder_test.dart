import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('FormBuilder.', () {
    test('Unable to generate a form using by a null model.', () {
      expect(() {
        ModelState<ComplexFormTest> modelState =
            new ModelState<ComplexFormTest>(null);
        expect(modelState, isNotNull);
      }, throwsA(isA<AssertionError>()));
    });

    test('Generates a form using by a new model.', () {
      ComplexFormTest model = new ComplexFormTest(null, null, null, null);
      ModelState<ComplexFormTest> modelState =
          new ModelState<ComplexFormTest>(model);

      FormGroup fg = modelState.formBuilder.group;
      FormArray fa;
      FormControl fc;

      // first_name
      fc = fg.controls['first_name'];
      _checkFormControl(
        fc,
        'first_name',
        EAbstractControlStatus.pure,
        null,
        [Required, StringLength],
        null,
      );

      // last_name
      fc = fg.controls['last_name'];
      _checkFormControl(
        fc,
        'last_name',
        EAbstractControlStatus.pure,
        null,
        [Required, StringLength],
        null,
      );

      // birth_day
      fc = fg.controls['birth_day'];
      _checkFormControl(
        fc,
        'birth_day',
        EAbstractControlStatus.pure,
        null,
        [Required],
        null,
      );

      // subscription_date
      fc = fg.controls['subscription_date'];
      _checkFormControl(
        fc,
        'subscription_date',
        EAbstractControlStatus.pure,
        null,
        [Required, GreaterOrEqualToDateTime, SmallerOrEqualToDateTime],
        null,
      );

      // books
      fa = fg.controls['books'];
      _checkFormArray(
        fa,
        'books',
        EAbstractControlStatus.pure,
        null,
        [NbItems],
        0,
      );

      // favorite_book
      fg = fg.controls['favorite_book'];
      _checkFormGroup(
        fg,
        'favorite_book',
        EAbstractControlStatus.pure,
        null,
        [Required],
        true,
      );
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
          'Voyage au centre de la terre',
          8.9,
          new DateTime(2020, 04, 08),
        ),
        new Book(
          'De la Terre à la Lune',
          8.9,
          new DateTime(2020, 04, 17),
        ),
        new Book(
          'Le Tour du monde en quatre-vingts jours',
          8.9,
          new DateTime(2020, 04, 26),
        ),
      ];
      model.favorite_book = model.books[1];

      ModelState<ComplexFormTest> modelState =
          new ModelState<ComplexFormTest>(model);

      FormGroup fg = modelState.formBuilder.group;
      FormArray fa;
      FormControl fc;

      // first_name
      fc = fg.controls['first_name'];
      _checkFormControl(
        fc,
        'first_name',
        EAbstractControlStatus.pure,
        null,
        [Required, StringLength],
        'Edouard',
      );

      // last_name
      fc = fg.controls['last_name'];
      _checkFormControl(
        fc,
        'last_name',
        EAbstractControlStatus.pure,
        null,
        [Required, StringLength],
        'Elric',
      );

      // birth_day
      fc = fg.controls['birth_day'];
      _checkFormControl(
        fc,
        'birth_day',
        EAbstractControlStatus.pure,
        null,
        [Required],
        new DateTime(1980, 12, 15),
      );

      // subscription_date
      fc = fg.controls['subscription_date'];
      _checkFormControl(
        fc,
        'subscription_date',
        EAbstractControlStatus.pure,
        null,
        [Required, GreaterOrEqualToDateTime, SmallerOrEqualToDateTime],
        new DateTime(2019, 06, 01),
      );

      // books
      fa = fg.controls['books'];
      _checkFormArray(
        fa,
        'books',
        EAbstractControlStatus.pure,
        null,
        [NbItems],
        3,
      );

      // books[0]
      fg = fa.groups[0];
      _checkFormGroup(
        fg,
        'books',
        EAbstractControlStatus.pure,
        null,
        [],
        false,
      );

      // books[0].name
      fc = fg.controls['name'];
      _checkFormControl(
        fc,
        'name',
        EAbstractControlStatus.pure,
        null,
        [Required, StringLength],
        'Voyage au centre de la terre',
      );

      // books[0].price
      fc = fg.controls['price'];
      _checkFormControl(
        fc,
        'price',
        EAbstractControlStatus.pure,
        null,
        [Required, GreaterThanNumber],
        8.9,
      );

      // books[0].loan_date
      fc = fg.controls['loan_date'];
      _checkFormControl(
        fc,
        'loan_date',
        EAbstractControlStatus.pure,
        null,
        [Required],
        new DateTime(2020, 04, 08),
      );

      // books[1]
      fg = fa.groups[1];
      _checkFormGroup(
        fg,
        'books',
        EAbstractControlStatus.pure,
        null,
        [],
        false,
      );

      // books[1].name
      fc = fg.controls['name'];
      _checkFormControl(
        fc,
        'name',
        EAbstractControlStatus.pure,
        null,
        [Required, StringLength],
        'De la Terre à la Lune',
      );

      // books[1].price
      fc = fg.controls['price'];
      _checkFormControl(
        fc,
        'price',
        EAbstractControlStatus.pure,
        null,
        [Required, GreaterThanNumber],
        8.9,
      );

      // books[1].loan_date
      fc = fg.controls['loan_date'];
      _checkFormControl(
        fc,
        'loan_date',
        EAbstractControlStatus.pure,
        null,
        [Required],
        new DateTime(2020, 04, 17),
      );

      // books[2]
      fg = fa.groups[2];
      _checkFormGroup(
        fg,
        'books',
        EAbstractControlStatus.pure,
        null,
        [],
        false,
      );

      // books[2].name
      fc = fg.controls['name'];
      _checkFormControl(
        fc,
        'name',
        EAbstractControlStatus.pure,
        null,
        [Required, StringLength],
        'Le Tour du monde en quatre-vingts jours',
      );

      // books[2].price
      fc = fg.controls['price'];
      _checkFormControl(
        fc,
        'price',
        EAbstractControlStatus.pure,
        null,
        [Required, GreaterThanNumber],
        8.9,
      );

      // books[2].loan_date
      fc = fg.controls['loan_date'];
      _checkFormControl(
        fc,
        'loan_date',
        EAbstractControlStatus.pure,
        null,
        [Required],
        new DateTime(2020, 04, 26),
      );
    });

    test('Form is updated and validated when setting a value.', () async {
      ComplexFormTest model = new ComplexFormTest(null, null, null, null);
      ModelState<ComplexFormTest> modelState =
          new ModelState<ComplexFormTest>(model);

      // FormGroup fg;
      // FormArray fa;
      FormControl fc;

      // first_name
      fc = modelState.formBuilder.group.controls['first_name'];
      _checkFormControl(
        fc,
        'first_name',
        EAbstractControlStatus.pure,
        null,
        [Required, StringLength],
        null,
      );

      model.first_name = 'xx';
      await Future.delayed(const Duration(microseconds: 1), () {});

      _checkFormControl(
        fc,
        'first_name',
        EAbstractControlStatus.invalid,
        new ValidationError(
          propertyName: 'first_name',
          validatorType: StringLength,
          message: 'error message here',
        ),
        [Required, StringLength],
        'xx',
      );

      // last_name
      fc = modelState.formBuilder.group.controls['last_name'];
      model.last_name = 'Elric';
      await Future.delayed(const Duration(microseconds: 1), () {});

      _checkFormControl(
        fc,
        'last_name',
        EAbstractControlStatus.valid,
        null,
        [Required, StringLength],
        'Elric',
      );

      // birth_day
      fc = modelState.formBuilder.group.controls['birth_day'];
      model.birth_day = new DateTime(1980, 12, 15);
      await Future.delayed(const Duration(microseconds: 1), () {});

      _checkFormControl(
        fc,
        'birth_day',
        EAbstractControlStatus.valid,
        null,
        [Required],
        new DateTime(1980, 12, 15),
      );

      // subscription_date
      fc = modelState.formBuilder.group.controls['subscription_date'];
      model.subscription_date = new DateTime(2020, 06, 01);
      await Future.delayed(const Duration(microseconds: 1), () {});

      _checkFormControl(
        fc,
        'subscription_date',
        EAbstractControlStatus.invalid,
        new ValidationError(
          propertyName: 'subscription_date',
          validatorType: SmallerOrEqualToDateTime,
          message: 'error message here',
        ),
        [Required, GreaterOrEqualToDateTime, SmallerOrEqualToDateTime],
        new DateTime(2020, 06, 01),
      );
    });

    test('Add sub-object. Actualize the form group.', () async {
      ComplexFormTest model = new ComplexFormTest(
        'Edouard',
        'Elric',
        new DateTime(1980, 12, 15),
        new DateTime(2019, 06, 01),
      );
      ModelState<ComplexFormTest> modelState =
          new ModelState<ComplexFormTest>(model);

      FormGroup fg =
          modelState.formBuilder.group.controls['favorite_book'] as FormGroup;
      FormControl fc;

      // favorite_book
      _checkFormGroup(
        fg,
        'favorite_book',
        EAbstractControlStatus.pure,
        null,
        [Required],
        true,
      );

      model.favorite_book = new Book(
        'Le seigneur des anneaux 1',
        10,
        new DateTime(2020, 10, 26),
      );
      await Future.delayed(const Duration(microseconds: 1), () {});

      // favorite_book
      _checkFormGroup(
        fg,
        'favorite_book',
        EAbstractControlStatus.valid,
        null,
        [Required],
        false,
      );

      // favorite_book.name
      fc = fg.controls['name'] as FormControl;
      _checkFormControl(
        fc,
        'name',
        EAbstractControlStatus.pure,
        null,
        [Required, StringLength],
        fc.value,
      );
    });

    test('Add item on collection. Actualize the form array.', () async {
      ComplexFormTest model = new ComplexFormTest(
        'Edouard',
        'Elric',
        new DateTime(1980, 12, 15),
        new DateTime(2019, 06, 01),
      );
      ModelState<ComplexFormTest> modelState =
          new ModelState<ComplexFormTest>(model);

      // FormGroup fg;
      FormArray fa =
          modelState.formBuilder.group.controls['books'] as FormArray;
      // FormControl fc;

      // books
      _checkFormArray(
        fa,
        'books',
        EAbstractControlStatus.pure,
        null,
        [NbItems],
        0,
      );

      // add book
      model.books = new List<Book>();
      await Future.delayed(const Duration(microseconds: 1), () {});

      model.addItemOnBooks(new Book(
        'Le seigneur des anneaux 1',
        10,
        new DateTime(2020, 10, 26),
      ));
      await Future.delayed(const Duration(microseconds: 1), () {});

      // books
      _checkFormArray(
        fa,
        'books',
        EAbstractControlStatus.valid,
        null,
        [NbItems],
        1,
      );
    });
  });
}

void _checkFormGroup(
  FormGroup fg,
  String name,
  EAbstractControlStatus status,
  ValidationError error,
  List<Type> validators,
  bool areControlsNull,
) {
  // name
  if (name == null)
    expect(fg.name, isNull);
  else
    expect(fg.name, name);

  // controls
  if (areControlsNull)
    expect(fg.controls, isNull);
  else
    expect(fg.controls, isNotNull);

  // status
  expect(fg.status, status);

  // error
  if (error == null) {
    expect(fg.error, isNull);
  } else {
    expect(fg.error, isNotNull);
    expect(fg.error.propertyName, name);
    expect(fg.error.validatorType, error.validatorType);
    expect(fg.error.message, error.message);
  }

  // validators
  if (validators != null && validators.length > 0) {
    expect(fg.validators.length, validators.length);
    for (Type type in validators) {
      int index = validators.indexOf(type);
      expect(fg.validators[index].runtimeType, type);
    }
  }
}

void _checkFormArray(
  FormArray fa,
  String name,
  EAbstractControlStatus status,
  ValidationError error,
  List<Type> validators,
  int nbItems,
) {
  // name
  if (name == null)
    expect(fa.name, isNull);
  else
    expect(fa.name, name);

  // nbItems
  if (nbItems == null)
    expect(fa.items, isNull);
  else
    expect(fa.items.length, nbItems);

  // status
  expect(fa.status, status);

  // error
  if (error == null) {
    expect(fa.error, isNull);
  } else {
    expect(fa.error, isNotNull);
    expect(fa.error.propertyName, name);
    expect(fa.error.validatorType, error.validatorType);
    expect(fa.error.message, error.message);
  }

  // validators
  if (validators != null && validators.length > 0) {
    expect(fa.validators.length, validators.length);
    for (Type type in validators) {
      int index = validators.indexOf(type);
      expect(fa.validators[index].runtimeType, type);
    }
  }
}

void _checkFormControl(
  FormControl fc,
  String name,
  EAbstractControlStatus status,
  ValidationError error,
  List<Type> validators,
  Object value,
) {
  // name
  if (name == null)
    expect(fc.name, isNull);
  else
    expect(fc.name, name);

  // value
  if (value == null)
    expect(fc.value, isNull);
  else
    expect(fc.value, value);

  // status
  expect(fc.status, status);

  // error
  if (error == null) {
    expect(fc.error, isNull);
  } else {
    expect(fc.error, isNotNull);
    expect(fc.error.propertyName, name);
    expect(fc.error.validatorType, error.validatorType);
    expect(fc.error.message, error.message);
  }

  // validators
  if (validators != null && validators.length > 0) {
    expect(fc.validators.length, validators.length);
    for (Type type in validators) {
      int index = validators.indexOf(type);
      expect(fc.validators[index].runtimeType, type);
    }
  }
}
