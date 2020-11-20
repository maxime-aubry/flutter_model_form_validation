import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';
import 'test_utils.dart';

void main() {
  initializeReflectable();

  group('ModelFormBuilder.', () {
    test('Get form element from element full name.', () {
      FormBuilderTest model = new FormBuilderTest(null, null, null, null);
      ModelFormState<FormBuilderTest> formState =
          new ModelFormState<FormBuilderTest>(model);
      ModelFormBuilder<FormBuilderTest> fb =
          formState.formBuilder as ModelFormBuilder<FormBuilderTest>;

      {
        String formElementFullname =
            formState.formBuilder.group.controls['firstName'].fullname;
        String propertyModelFullname = model.getPropertyFullname('firstName');

        expect(formElementFullname, isNotNull);
        expect(propertyModelFullname, isNotNull);

        ModelFormControl fc = fb.getFormElement<ModelFormControl>(
          propertyModelFullname,
        );

        expect(fc, isNotNull);
        expect(fc.fullname, formElementFullname);
        expect(fc.modelPartfullname, propertyModelFullname);
      }
    });

    test('Generates a form using by a new model.', () {
      FormBuilderTest model = new FormBuilderTest(null, null, null, null);
      ModelFormState<FormBuilderTest> formState =
          new ModelFormState<FormBuilderTest>(model);
      ModelFormBuilder<FormBuilderTest> fb =
          formState.formBuilder as ModelFormBuilder<FormBuilderTest>;

      // firstName
      {
        ModelFormControl fc = fb.getFormElement<ModelFormControl>(
          model.getPropertyFullname('firstName'),
        );
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'firstName',
          fullname: '${fc.parentGroup.hashCode}.firstName',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // lastName
      {
        ModelFormControl fc = fb.getFormElement<ModelFormControl>(
          model.getPropertyFullname('lastName'),
        );
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'lastName',
          fullname: '${fc.parentGroup.hashCode}.lastName',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // birthDay
      {
        ModelFormControl fc = fb.getFormElement<ModelFormControl>(
          model.getPropertyFullname('birthDay'),
        );
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'birthDay',
          fullname: '${fc.parentGroup.hashCode}.birthDay',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // subscriptionDate
      {
        ModelFormControl fc = fb.getFormElement<ModelFormControl>(
          model.getPropertyFullname('subscriptionDate'),
        );
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'subscriptionDate',
          fullname: '${fc.parentGroup.hashCode}.subscriptionDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // books
      {
        ModelFormArray fa = fb.getFormElement<ModelFormArray>(
          model.getPropertyFullname('books'),
        );
        checkFormArray(
          fa: fa,
          formState: formState,
          name: 'books',
          fullname: '${fa.parentGroup.hashCode}.books',
          status: EAbstractControlStatus.pure,
          error: null,
          nbItems: 0,
        );
      }

      // favoriteBook
      {
        ModelFormGroup fg = fb.getFormElement<ModelFormGroup>(
          model.getPropertyFullname('favoriteBook'),
        );
        checkFormGroup(
          fg: fg,
          formState: formState,
          name: 'favoriteBook',
          fullname: '${fg.parentGroup.hashCode}.favoriteBook',
          status: EAbstractControlStatus.pure,
          error: null,
          areControlsNull: false,
        );
      }
    });

    test('Generates a form using by a model with pre-entered data.', () {
      FormBuilderTest model = new FormBuilderTest(
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
      model.favoriteBook = model.books[1];

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
          fullname: '${fc.parentGroup.hashCode}.firstName',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'Edouard',
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
          fullname: '${fc.parentGroup.hashCode}.lastName',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'Elric',
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
          fullname: '${fc.parentGroup.hashCode}.birthDay',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(1980, 12, 15),
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
          fullname: '${fc.parentGroup.hashCode}.subscriptionDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(2019, 06, 01),
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
          fullname: '${fa.parentGroup.hashCode}.books',
          status: EAbstractControlStatus.pure,
          error: null,
          nbItems: 3,
        );
      }

      // books[0]
      {
        ModelFormArray fa =
            formState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[0] as ModelFormGroup;
        checkFormGroup(
          fg: fg,
          formState: formState,
          name: 'books[0]',
          fullname: '${fg.parentGroup.hashCode}.books[0]',
          status: null,
          error: null,
          areControlsNull: false,
        );
      }

      // books[0].name
      {
        ModelFormArray fa =
            formState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[0] as ModelFormGroup;
        ModelFormControl fc = fg.controls['name'] as ModelFormControl;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'name',
          fullname: '${fc.parentGroup.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'Voyage au centre de la terre',
        );
      }

      // books[0].price
      {
        ModelFormArray fa =
            formState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[0] as ModelFormGroup;
        ModelFormControl fc = fg.controls['price'] as ModelFormControl;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'price',
          fullname: '${fc.parentGroup.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 8.9,
        );
      }

      // books[0].loanDate
      {
        ModelFormArray fa =
            formState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[0] as ModelFormGroup;
        ModelFormControl fc = fg.controls['loanDate'] as ModelFormControl;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'loanDate',
          fullname: '${fc.parentGroup.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(2020, 04, 08),
        );
      }

      // books[1]
      {
        ModelFormArray fa =
            formState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[1] as ModelFormGroup;
        checkFormGroup(
          fg: fg,
          formState: formState,
          name: 'books[1]',
          fullname: '${fg.parentGroup.hashCode}.books[1]',
          status: null,
          error: null,
          areControlsNull: false,
        );
      }

      // books[1].name
      {
        ModelFormArray fa =
            formState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[1] as ModelFormGroup;
        ModelFormControl fc = fg.controls['name'] as ModelFormControl;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'name',
          fullname: '${fc.parentGroup.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'De la Terre à la Lune',
        );
      }

      // books[1].price
      {
        ModelFormArray fa =
            formState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[1] as ModelFormGroup;
        ModelFormControl fc = fg.controls['price'] as ModelFormControl;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'price',
          fullname: '${fc.parentGroup.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 8.9,
        );
      }

      // books[1].loanDate
      {
        ModelFormArray fa =
            formState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[1] as ModelFormGroup;
        ModelFormControl fc = fg.controls['loanDate'] as ModelFormControl;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'loanDate',
          fullname: '${fc.parentGroup.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(2020, 04, 17),
        );
      }

      // books[2]
      {
        ModelFormArray fa =
            formState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[2] as ModelFormGroup;
        checkFormGroup(
          fg: fg,
          formState: formState,
          name: 'books[2]',
          fullname: '${fg.parentGroup.hashCode}.books[2]',
          status: null,
          error: null,
          areControlsNull: false,
        );
      }

      // books[2].name
      {
        ModelFormArray fa =
            formState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[2] as ModelFormGroup;
        ModelFormControl fc = fg.controls['name'] as ModelFormControl;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'name',
          fullname: '${fc.parentGroup.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'Le Tour du monde en quatre-vingts jours',
        );
      }

      // books[2].price
      {
        ModelFormArray fa =
            formState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[2] as ModelFormGroup;
        ModelFormControl fc = fg.controls['price'] as ModelFormControl;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'price',
          fullname: '${fc.parentGroup.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 8.9,
        );
      }

      // books[2].loanDate
      {
        ModelFormArray fa =
            formState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[2] as ModelFormGroup;
        ModelFormControl fc = fg.controls['loanDate'] as ModelFormControl;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'loanDate',
          fullname: '${fc.parentGroup.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(2020, 04, 26),
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
          fullname: '${fg.parentGroup.hashCode}.favoriteBook',
          status: EAbstractControlStatus.pure,
          error: null,
          areControlsNull: false,
        );
      }
    });

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

    test('Get pathes from abstract controls.', () {
      FormBuilderTest model = new FormBuilderTest(
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
      model.favoriteBook = model.books[1];

      ModelFormState<FormBuilderTest> modelState =
          new ModelFormState<FormBuilderTest>(model);

      // firstName
      {
        ModelFormControl fc = modelState.formBuilder.group.controls['firstName']
            as ModelFormControl;
        expect(fc.formPath, 'root.controls[\'firstName\']');
        expect(fc.modelPath, 'root.firstName');
      }

      // books
      {
        ModelFormArray fa =
            modelState.formBuilder.group.controls['books'] as ModelFormArray;
        expect(fa.formPath, 'root.controls[\'books\']');
        expect(fa.modelPath, 'root.books');
      }

      // books[1]
      {
        ModelFormArray fa =
            modelState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[1] as ModelFormGroup;
        expect(fg.formPath, 'root.controls[\'books\'].groups[1]');
        expect(fg.modelPath, 'root.books[1]');
      }

      // books[1].price
      {
        ModelFormArray fa =
            modelState.formBuilder.group.controls['books'] as ModelFormArray;
        ModelFormGroup fg = fa.groups[1] as ModelFormGroup;
        ModelFormControl fc = fg.controls['price'] as ModelFormControl;
        expect(fc.formPath,
            'root.controls[\'books\'].groups[1].controls[\'price\']');
        expect(fc.modelPath, 'root.books[1].price');
      }

      // favoriteBook.loanDate
      {
        ModelFormGroup fg = modelState
            .formBuilder.group.controls['favoriteBook'] as ModelFormGroup;
        ModelFormControl fc = fg.controls['loanDate'] as ModelFormControl;
        expect(
          fc.formPath,
          'root.controls[\'favoriteBook\'].controls[\'loanDate\']',
        );
        expect(fc.modelPath, 'root.favoriteBook.loanDate');
      }
    });
  });
}
