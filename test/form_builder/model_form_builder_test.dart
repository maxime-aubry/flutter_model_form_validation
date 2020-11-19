import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';
import 'test_utils.dart';

void main() {
  initializeReflectable();

  group('ModelFormBuilder.', () {
    test('Unable to generate a form using by a null model.', () {
      expect(() {
        ModelFormState<FormBuilderTest> modelState =
            new ModelFormState<FormBuilderTest>(null);
        expect(modelState, isNotNull);
      }, throwsA(isA<AssertionError>()));
    });

    test('Generates a form using by a new model.', () {
      FormBuilderTest model = new FormBuilderTest(null, null, null, null);
      ModelFormState<FormBuilderTest> formState =
          new ModelFormState<FormBuilderTest>(model);

      // firstName
      {
        ModelFormControl fc = formState.formBuilder.group.controls['firstName']
            as ModelFormControl;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'firstName',
          fullname: '${fc.hashCode}.firstName',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // lastName
      {
        ModelFormControl fc = formState.formBuilder.group.controls['lastName']
            as ModelFormControl;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'lastName',
          fullname: '${fc.hashCode}.lastName',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // birthDay
      {
        ModelFormControl fc = formState.formBuilder.group.controls['birthDay']
            as ModelFormControl;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'birthDay',
          fullname: '${fc.hashCode}.birthDay',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // subscriptionDate
      {
        ModelFormControl fc = formState
            .formBuilder.group.controls['subscriptionDate'] as ModelFormControl;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'subscriptionDate',
          fullname: '${fc.hashCode}.subscriptionDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // books
      {
        ModelFormArray fa =
            formState.formBuilder.group.controls['books'] as ModelFormArray;
        checkFormArray(
          fa: fa,
          formState: formState,
          name: 'books',
          fullname: '${fa.hashCode}.books',
          status: EAbstractControlStatus.pure,
          error: null,
          nbItems: 0,
        );
      }

      // favoriteBook
      {
        ModelFormGroup fg = formState.formBuilder.group.controls['favoriteBook']
            as ModelFormGroup;
        checkFormGroup(
          fg: fg,
          formState: formState,
          name: 'favoriteBook',
          fullname: '${fg.hashCode}.favoriteBook',
          status: EAbstractControlStatus.pure,
          error: null,
          areControlsNull: false,
        );
      }
    });

    // test('Generates a form using by a model with pre-entered data.', () {
    //   FormBuilderTest model = new FormBuilderTest(
    //     'Edouard',
    //     'Elric',
    //     new DateTime(1980, 12, 15),
    //     new DateTime(2019, 06, 01),
    //   );
    //   model.books = [
    //     new Book(
    //       'Voyage au centre de la terre',
    //       8.9,
    //       new DateTime(2020, 04, 08),
    //     ),
    //     new Book(
    //       'De la Terre à la Lune',
    //       8.9,
    //       new DateTime(2020, 04, 17),
    //     ),
    //     new Book(
    //       'Le Tour du monde en quatre-vingts jours',
    //       8.9,
    //       new DateTime(2020, 04, 26),
    //     ),
    //   ];
    //   model.favoriteBook = model.books[1];

    //   ModelFormState<FormBuilderTest> modelState =
    //       new ModelFormState<FormBuilderTest>(model);

    //   // firstName
    //   {
    //     ModelFormControl fc = modelState
    //         .formBuilder.group.controls['firstName'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'firstName',
    //       EAbstractControlStatus.pure,
    //       'Edouard',
    //     );
    //   }

    //   // lastName
    //   {
    //     ModelFormControl fc = modelState.formBuilder.group.controls['lastName']
    //         as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'lastName',
    //       EAbstractControlStatus.pure,
    //       'Elric',
    //     );
    //   }

    //   // birthDay
    //   {
    //     ModelFormControl fc = modelState.formBuilder.group.controls['birthDay']
    //         as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'birthDay',
    //       EAbstractControlStatus.pure,
    //       new DateTime(1980, 12, 15),
    //     );
    //   }

    //   // subscriptionDate
    //   {
    //     ModelFormControl fc = modelState.formBuilder.group
    //         .controls['subscriptionDate'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'subscriptionDate',
    //       EAbstractControlStatus.pure,
    //       new DateTime(2019, 06, 01),
    //     );
    //   }

    //   // books
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     checkFormArray(
    //       fa,
    //       'books',
    //       EAbstractControlStatus.pure,
    //       3,
    //     );
    //   }

    //   // books[0]
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[0] as ModelFormGroup;
    //     checkFormGroup(
    //       fg,
    //       'books',
    //       EAbstractControlStatus.pure,
    //       false,
    //     );
    //   }

    //   // books[0].name
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[0] as ModelFormGroup;
    //     ModelFormControl fc = fg.controls['name'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'name',
    //       EAbstractControlStatus.pure,
    //       'Voyage au centre de la terre',
    //     );
    //   }

    //   // books[0].price
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[0] as ModelFormGroup;
    //     ModelFormControl fc = fg.controls['price'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'price',
    //       EAbstractControlStatus.pure,
    //       8.9,
    //     );
    //   }

    //   // books[0].loan_date
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[0] as ModelFormGroup;
    //     ModelFormControl fc = fg.controls['loan_date'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'loan_date',
    //       EAbstractControlStatus.pure,
    //       new DateTime(2020, 04, 08),
    //     );
    //   }

    //   // books[1]
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[1] as ModelFormGroup;
    //     checkFormGroup(
    //       fg,
    //       'books',
    //       EAbstractControlStatus.pure,
    //       false,
    //     );
    //   }

    //   // books[1].name
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[1] as ModelFormGroup;
    //     ModelFormControl fc = fg.controls['name'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'name',
    //       EAbstractControlStatus.pure,
    //       'De la Terre à la Lune',
    //     );
    //   }

    //   // books[1].price
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[1] as ModelFormGroup;
    //     ModelFormControl fc = fg.controls['price'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'price',
    //       EAbstractControlStatus.pure,
    //       8.9,
    //     );
    //   }

    //   // books[1].loan_date
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[1] as ModelFormGroup;
    //     ModelFormControl fc = fg.controls['loan_date'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'loan_date',
    //       EAbstractControlStatus.pure,
    //       new DateTime(2020, 04, 17),
    //     );
    //   }

    //   // books[2]
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[2] as ModelFormGroup;
    //     checkFormGroup(
    //       fg,
    //       'books',
    //       EAbstractControlStatus.pure,
    //       false,
    //     );
    //   }

    //   // books[2].name
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[2] as ModelFormGroup;
    //     ModelFormControl fc = fg.controls['name'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'name',
    //       EAbstractControlStatus.pure,
    //       'Le Tour du monde en quatre-vingts jours',
    //     );
    //   }

    //   // books[2].price
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[2] as ModelFormGroup;
    //     ModelFormControl fc = fg.controls['price'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'price',
    //       EAbstractControlStatus.pure,
    //       8.9,
    //     );
    //   }

    //   // books[2].loan_date
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[2] as ModelFormGroup;
    //     ModelFormControl fc = fg.controls['loan_date'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'loan_date',
    //       EAbstractControlStatus.pure,
    //       new DateTime(2020, 04, 26),
    //     );
    //   }
    // });

    // test('Form is updated and validated when setting a value.', () async {
    //   FormBuilderTest model = new FormBuilderTest(null, null, null, null);
    //   ModelFormState<FormBuilderTest> modelState =
    //       new ModelFormState<FormBuilderTest>(model);

    //   // firstName
    //   {
    //     ModelFormControl fc = modelState
    //         .formBuilder.group.controls['firstName'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'firstName',
    //       EAbstractControlStatus.pure,
    //       null,
    //     );
    //   }

    //   model.firstName = 'xx';
    //   await Future.delayed(const Duration(microseconds: 1), () {});

    //   {
    //     ModelFormControl fc = modelState
    //         .formBuilder.group.controls['firstName'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'firstName',
    //       EAbstractControlStatus.invalid,
    //       'xx',
    //     );
    //   }

    //   model.lastName = 'Elric';
    //   await Future.delayed(const Duration(microseconds: 1), () {});

    //   // lastName
    //   {
    //     ModelFormControl fc = modelState.formBuilder.group.controls['lastName']
    //         as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'lastName',
    //       EAbstractControlStatus.valid,
    //       'Elric',
    //     );
    //   }

    //   model.birthDay = new DateTime(1980, 12, 15);
    //   await Future.delayed(const Duration(microseconds: 1), () {});

    //   // birthDay
    //   {
    //     ModelFormControl fc = modelState.formBuilder.group.controls['birthDay']
    //         as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'birthDay',
    //       EAbstractControlStatus.valid,
    //       new DateTime(1980, 12, 15),
    //     );
    //   }

    //   model.subscriptionDate = new DateTime(2020, 06, 01);
    //   await Future.delayed(const Duration(microseconds: 1), () {});

    //   // subscriptionDate
    //   {
    //     ModelFormControl fc = modelState.formBuilder.group
    //         .controls['subscriptionDate'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'subscriptionDate',
    //       EAbstractControlStatus.invalid,
    //       new DateTime(2020, 06, 01),
    //     );
    //   }
    // });

    // test('Add sub-object. Actualize the form group.', () async {
    //   FormBuilderTest model = new FormBuilderTest(
    //     'Edouard',
    //     'Elric',
    //     new DateTime(1980, 12, 15),
    //     new DateTime(2019, 06, 01),
    //   );
    //   ModelFormState<FormBuilderTest> modelState =
    //       new ModelFormState<FormBuilderTest>(model);

    //   // favoriteBook
    //   {
    //     ModelFormGroup fg = modelState
    //         .formBuilder.group.controls['favoriteBook'] as ModelFormGroup;
    //     checkFormGroup(
    //       fg,
    //       'favoriteBook',
    //       EAbstractControlStatus.pure,
    //       true,
    //     );
    //   }

    //   model.favoriteBook = new Book(
    //     'Le seigneur des anneaux 1',
    //     10,
    //     new DateTime(2020, 10, 26),
    //   );
    //   await Future.delayed(const Duration(microseconds: 1), () {});

    //   // favoriteBook
    //   {
    //     ModelFormGroup fg = modelState
    //         .formBuilder.group.controls['favoriteBook'] as ModelFormGroup;
    //     checkFormGroup(
    //       fg,
    //       'favoriteBook',
    //       EAbstractControlStatus.valid,
    //       false,
    //     );
    //   }

    //   // favoriteBook.name
    //   {
    //     ModelFormGroup fg = modelState
    //         .formBuilder.group.controls['favoriteBook'] as ModelFormGroup;
    //     ModelFormControl fc = fg.controls['name'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'name',
    //       EAbstractControlStatus.pure,
    //       fc.getValue(),
    //     );
    //   }
    // });

    // test('Add item on collection. Actualize the form array.', () async {
    //   FormBuilderTest model = new FormBuilderTest(
    //     'Edouard',
    //     'Elric',
    //     new DateTime(1980, 12, 15),
    //     new DateTime(2019, 06, 01),
    //   );
    //   ModelFormState<FormBuilderTest> modelState =
    //       new ModelFormState<FormBuilderTest>(model);

    //   // books
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     checkFormArray(
    //       fa,
    //       'books',
    //       EAbstractControlStatus.pure,
    //       0,
    //     );
    //   }

    //   // add book
    //   model.books = new List<Book>();
    //   await Future.delayed(const Duration(microseconds: 1), () {});

    //   model.addItemOnBooks(new Book(
    //     'Le seigneur des anneaux 1',
    //     10,
    //     new DateTime(2020, 10, 26),
    //   ));
    //   await Future.delayed(const Duration(microseconds: 1), () {});

    //   // books
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     checkFormArray(
    //       fa,
    //       'books',
    //       EAbstractControlStatus.valid,
    //       1,
    //     );
    //   }
    // });

    // test('Get pathes from abstract controls.', () {
    //   FormBuilderTest model = new FormBuilderTest(
    //     'Edouard',
    //     'Elric',
    //     new DateTime(1980, 12, 15),
    //     new DateTime(2019, 06, 01),
    //   );
    //   model.books = [
    //     new Book(
    //       'Voyage au centre de la terre',
    //       8.9,
    //       new DateTime(2020, 04, 08),
    //     ),
    //     new Book(
    //       'De la Terre à la Lune',
    //       8.9,
    //       new DateTime(2020, 04, 17),
    //     ),
    //     new Book(
    //       'Le Tour du monde en quatre-vingts jours',
    //       8.9,
    //       new DateTime(2020, 04, 26),
    //     ),
    //   ];
    //   model.favoriteBook = model.books[1];

    //   ModelFormState<FormBuilderTest> modelState =
    //       new ModelFormState<FormBuilderTest>(model);

    //   // firstName
    //   {
    //     ModelFormControl fc = modelState
    //         .formBuilder.group.controls['firstName'] as ModelFormControl;
    //     expect(fc.formPath, 'root.controls[\'firstName\']');
    //     expect(fc.modelPath, 'root.firstName');
    //   }

    //   // books
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     expect(fa.formPath, 'root.controls[\'books\']');
    //     expect(fa.modelPath, 'root.books');
    //   }

    //   // books[1]
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[1] as ModelFormGroup;
    //     expect(fg.formPath, 'root.controls[\'books\'].groups[1]');
    //     expect(fg.modelPath, 'root.books[1]');
    //   }

    //   // books[1].price
    //   {
    //     ModelFormArray fa =
    //         modelState.formBuilder.group.controls['books'] as ModelFormArray;
    //     ModelFormGroup fg = fa.groups[1] as ModelFormGroup;
    //     ModelFormControl fc = fg.controls['price'] as ModelFormControl;
    //     expect(fc.formPath,
    //         'root.controls[\'books\'].groups[1].controls[\'price\']');
    //     expect(fc.modelPath, 'root.books[1].price');
    //   }

    //   // favoriteBook.loan_date
    //   {
    //     ModelFormGroup fg = modelState
    //         .formBuilder.group.controls['favoriteBook'] as ModelFormGroup;
    //     ModelFormControl fc = fg.controls['loan_date'] as ModelFormControl;
    //     expect(
    //       fc.formPath,
    //       'root.controls[\'favoriteBook\'].controls[\'loan_date\']',
    //     );
    //     expect(fc.modelPath, 'root.favoriteBook.loan_date');
    //   }
    // });
  });
}
