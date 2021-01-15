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
      ModelFormState formState = new ModelFormState(model: model);

      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model,
          'firstName',
        );

        expect(fc, isNotNull);
        expect(
          fc.fullname,
          formState.formBuilder.group.controls['firstName'].fullname,
        );
        expect(fc.modelPartfullname, '${model.hashCode}.firstName');
      }
    });

    test('Generates a form using by a new model.', () {
      FormBuilderTest model = new FormBuilderTest(null, null, null, null);
      ModelFormState formState = new ModelFormState(model: model);

      // firstName
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model,
          'firstName',
        );
        checkFormControl(
          fc: fc,
          name: 'firstName',
          fullname: '${fc.parentGroup.hashCode}.firstName',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // lastName
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model,
          'lastName',
        );
        checkFormControl(
          fc: fc,
          name: 'lastName',
          fullname: '${fc.parentGroup.hashCode}.lastName',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // birthDay
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model,
          'birthDay',
        );
        checkFormControl(
          fc: fc,
          name: 'birthDay',
          fullname: '${fc.parentGroup.hashCode}.birthDay',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // subscriptionDate
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model,
          'subscriptionDate',
        );
        checkFormControl(
          fc: fc,
          name: 'subscriptionDate',
          fullname: '${fc.parentGroup.hashCode}.subscriptionDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // books
      {
        ModelFormArray fa =
            formState.formBuilder.getFormElement<ModelFormArray>(
          model,
          'books',
        );
        checkFormArray(
          fa: fa,
          name: 'books',
          fullname: '${fa.parentGroup.hashCode}.books',
          status: EAbstractControlStatus.pure,
          error: null,
          nbItems: 0,
        );
      }

      // favoriteBook
      {
        ModelFormGroup fg =
            formState.formBuilder.getFormElement<ModelFormGroup>(
          model,
          'favoriteBook',
        );
        checkFormGroup(
          fg: fg,
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
      model.books.value = [
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
      model.favoriteBook.value = new Book(
        'De la Terre à la Lune',
        8.9,
        new DateTime(2020, 04, 17),
      );

      ModelFormState formState = new ModelFormState(model: model);

      // firstName
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model,
          'firstName',
        );
        checkFormControl(
          fc: fc,
          name: 'firstName',
          fullname: '${fc.parentGroup.hashCode}.firstName',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'Edouard',
        );
      }

      // lastName
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model,
          'lastName',
        );
        checkFormControl(
          fc: fc,
          name: 'lastName',
          fullname: '${fc.parentGroup.hashCode}.lastName',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'Elric',
        );
      }

      // birthDay
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model,
          'birthDay',
        );
        checkFormControl(
          fc: fc,
          name: 'birthDay',
          fullname: '${fc.parentGroup.hashCode}.birthDay',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(1980, 12, 15),
        );
      }

      // subscriptionDate
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model,
          'subscriptionDate',
        );
        checkFormControl(
          fc: fc,
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
            formState.formBuilder.getFormElement<ModelFormArray>(
          model,
          'books',
        );
        checkFormArray(
          fa: fa,
          name: 'books',
          fullname: '${fa.parentGroup.hashCode}.books',
          status: EAbstractControlStatus.pure,
          error: null,
          nbItems: 3,
        );
      }

      // books[0].name
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[0],
          'name',
        );
        checkFormControl(
          fc: fc,
          name: 'name',
          fullname: '${fc.parentGroup.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'Voyage au centre de la terre',
        );
      }

      // books[0].price
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[0],
          'price',
        );
        checkFormControl(
          fc: fc,
          name: 'price',
          fullname: '${fc.parentGroup.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 8.9,
        );
      }

      // books[0].loanDate
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[0],
          'loanDate',
        );
        checkFormControl(
          fc: fc,
          name: 'loanDate',
          fullname: '${fc.parentGroup.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(2020, 04, 08),
        );
      }

      // books[1].name
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[1],
          'name',
        );
        checkFormControl(
          fc: fc,
          name: 'name',
          fullname: '${fc.parentGroup.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'De la Terre à la Lune',
        );
      }

      // books[1].price
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[1],
          'price',
        );
        checkFormControl(
          fc: fc,
          name: 'price',
          fullname: '${fc.parentGroup.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 8.9,
        );
      }

      // books[1].loanDate
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[1],
          'loanDate',
        );
        checkFormControl(
          fc: fc,
          name: 'loanDate',
          fullname: '${fc.parentGroup.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(2020, 04, 17),
        );
      }

      // books[2].name
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[2],
          'name',
        );
        checkFormControl(
          fc: fc,
          name: 'name',
          fullname: '${fc.parentGroup.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'Le Tour du monde en quatre-vingts jours',
        );
      }

      // books[2].price
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[2],
          'price',
        );
        checkFormControl(
          fc: fc,
          name: 'price',
          fullname: '${fc.parentGroup.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 8.9,
        );
      }

      // books[2].loanDate
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[2],
          'loanDate',
        );
        checkFormControl(
          fc: fc,
          name: 'loanDate',
          fullname: '${fc.parentGroup.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(2020, 04, 26),
        );
      }

      // favoriteBook
      {
        ModelFormGroup fg =
            formState.formBuilder.getFormElement<ModelFormGroup>(
          model,
          'favoriteBook',
        );
        checkFormGroup(
          fg: fg,
          name: 'favoriteBook',
          fullname: '${fg.parentGroup.hashCode}.favoriteBook',
          status: EAbstractControlStatus.pure,
          error: null,
          areControlsNull: false,
        );
      }

      // favoriteBook.name
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.favoriteBook.value,
          'name',
        );
        checkFormControl(
          fc: fc,
          name: 'name',
          fullname: '${fc.parentGroup.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'De la Terre à la Lune',
        );
      }

      // favoriteBook.price
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.favoriteBook.value,
          'price',
        );
        checkFormControl(
          fc: fc,
          name: 'price',
          fullname: '${fc.parentGroup.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 8.9,
        );
      }

      // favoriteBook.loanDate
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.favoriteBook.value,
          'loanDate',
        );
        checkFormControl(
          fc: fc,
          name: 'loanDate',
          fullname: '${fc.parentGroup.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(2020, 04, 17),
        );
      }
    });

    // test('Form is updated and pureated when setting a value.', () async {
    //   FormBuilderTest model = new FormBuilderTest(null, null, null, null);
    //   ModelFormState formState =
    //       new ModelFormState(model: model);

    //   // firstName
    //   {
    //     ModelFormControl fc = formState
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
    //     ModelFormControl fc = formState
    //         .formBuilder.group.controls['firstName'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'firstName',
    //       EAbstractControlStatus.pure,
    //       'xx',
    //     );
    //   }

    //   model.lastName = 'Elric';
    //   await Future.delayed(const Duration(microseconds: 1), () {});

    //   // lastName
    //   {
    //     ModelFormControl fc = formState.formBuilder.group.controls['lastName']
    //         as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'lastName',
    //       EAbstractControlStatus.pure,
    //       'Elric',
    //     );
    //   }

    //   model.birthDay = new DateTime(1980, 12, 15);
    //   await Future.delayed(const Duration(microseconds: 1), () {});

    //   // birthDay
    //   {
    //     ModelFormControl fc = formState.formBuilder.group.controls['birthDay']
    //         as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'birthDay',
    //       EAbstractControlStatus.pure,
    //       new DateTime(1980, 12, 15),
    //     );
    //   }

    //   model.subscriptionDate = new DateTime(2020, 06, 01);
    //   await Future.delayed(const Duration(microseconds: 1), () {});

    //   // subscriptionDate
    //   {
    //     ModelFormControl fc = formState.formBuilder.group
    //         .controls['subscriptionDate'] as ModelFormControl;
    //     checkFormControl(
    //       fc,
    //       'subscriptionDate',
    //       EAbstractControlStatus.pure,
    //       new DateTime(2020, 06, 01),
    //     );
    //   }
    // });

    test('Add sub-object. Actualize the form group.', () async {
      FormBuilderTest model = new FormBuilderTest(
        'Edouard',
        'Elric',
        new DateTime(1980, 12, 15),
        new DateTime(2019, 06, 01),
      );
      ModelFormState formState = new ModelFormState(model: model);

      // favoriteBook
      {
        ModelFormGroup fg =
            formState.formBuilder.getFormElement<ModelFormGroup>(
          model,
          'favoriteBook',
        );
        checkFormGroup(
          fg: fg,
          name: 'favoriteBook',
          fullname: '${fg.parentGroup.hashCode}.favoriteBook',
          status: EAbstractControlStatus.pure,
          error: null,
          areControlsNull: true,
        );
      }

      model.favoriteBook.value = new Book(
        'Le seigneur des anneaux 1',
        8.9,
        new DateTime(2020, 10, 26),
      );
      await Future.delayed(const Duration(microseconds: 1), () {});

      // favoriteBook
      {
        ModelFormGroup fg =
            formState.formBuilder.getFormElement<ModelFormGroup>(
          model,
          'favoriteBook',
        );
        checkFormGroup(
          fg: fg,
          name: 'favoriteBook',
          fullname: '${fg.parentGroup.hashCode}.favoriteBook',
          status: EAbstractControlStatus.pure,
          error: null,
          areControlsNull: false,
        );
      }

      // favoriteBook.name
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.favoriteBook.value,
          'name',
        );
        checkFormControl(
          fc: fc,
          name: 'name',
          fullname: '${fc.parentGroup.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'Le seigneur des anneaux 1',
        );
      }

      // favoriteBook.price
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.favoriteBook.value,
          'price',
        );
        checkFormControl(
          fc: fc,
          name: 'price',
          fullname: '${fc.parentGroup.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 8.9,
        );
      }

      // favoriteBook.loanDate
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.favoriteBook.value,
          'loanDate',
        );
        checkFormControl(
          fc: fc,
          name: 'loanDate',
          fullname: '${fc.parentGroup.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(2020, 10, 26),
        );
      }
    });

    test('Remove sub-object. Actualize the form group.', () async {
      FormBuilderTest model = new FormBuilderTest(
        'Edouard',
        'Elric',
        new DateTime(1980, 12, 15),
        new DateTime(2019, 06, 01),
      );
      model.favoriteBook.value = new Book(
        'Le seigneur des anneaux 1',
        8.9,
        new DateTime(2020, 10, 26),
      );
      ModelFormState formState = new ModelFormState(model: model);

      // favoriteBook
      {
        ModelFormGroup fg =
            formState.formBuilder.getFormElement<ModelFormGroup>(
          model,
          'favoriteBook',
        );
        checkFormGroup(
          fg: fg,
          name: 'favoriteBook',
          fullname: '${fg.parentGroup.hashCode}.favoriteBook',
          status: EAbstractControlStatus.pure,
          error: null,
          areControlsNull: false,
        );
      }

      // favoriteBook.name
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.favoriteBook.value,
          'name',
        );
        checkFormControl(
          fc: fc,
          name: 'name',
          fullname: '${fc.parentGroup.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'Le seigneur des anneaux 1',
        );
      }

      // favoriteBook.price
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.favoriteBook.value,
          'price',
        );
        checkFormControl(
          fc: fc,
          name: 'price',
          fullname: '${fc.parentGroup.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 8.9,
        );
      }

      // favoriteBook.loanDate
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.favoriteBook.value,
          'loanDate',
        );
        checkFormControl(
          fc: fc,
          name: 'loanDate',
          fullname: '${fc.parentGroup.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(2020, 10, 26),
        );
      }

      model.favoriteBook.value = null;
      await Future.delayed(const Duration(microseconds: 1), () {});

      // favoriteBook
      {
        ModelFormGroup fg =
            formState.formBuilder.getFormElement<ModelFormGroup>(
          model,
          'favoriteBook',
        );
        checkFormGroup(
          fg: fg,
          name: 'favoriteBook',
          fullname: '${fg.parentGroup.hashCode}.favoriteBook',
          status: EAbstractControlStatus.pure,
          error: null,
          areControlsNull: true,
        );
      }
    });

    test('Add item on collection. Actualize the form array.', () async {
      FormBuilderTest model = new FormBuilderTest(
        'Edouard',
        'Elric',
        new DateTime(1980, 12, 15),
        new DateTime(2019, 06, 01),
      );
      ModelFormState formState = new ModelFormState(model: model);

      {
        ModelFormArray fa =
            formState.formBuilder.getFormElement<ModelFormArray>(
          model,
          'books',
        );
        checkFormArray(
          fa: fa,
          name: 'books',
          fullname: '${fa.parentGroup.hashCode}.books',
          status: EAbstractControlStatus.pure,
          error: null,
          nbItems: 0,
        );
      }

      // instanciate books collection
      model.books.value = [];
      await Future.delayed(const Duration(microseconds: 1), () {});

      {
        ModelFormArray fa =
            formState.formBuilder.getFormElement<ModelFormArray>(
          model,
          'books',
        );
        checkFormArray(
          fa: fa,
          name: 'books',
          fullname: '${fa.parentGroup.hashCode}.books',
          status: EAbstractControlStatus.pure,
          error: null,
          nbItems: 0,
        );
      }

      // add book
      model.books.value.add(new Book(
        'Le seigneur des anneaux 1',
        8.9,
        new DateTime(2020, 10, 26),
      ));
      await Future.delayed(const Duration(microseconds: 1), () {});

      // books
      {
        ModelFormArray fa =
            formState.formBuilder.getFormElement<ModelFormArray>(
          model,
          'books',
        );
        checkFormArray(
          fa: fa,
          name: 'books',
          fullname: '${fa.parentGroup.hashCode}.books',
          status: EAbstractControlStatus.pure,
          error: null,
          nbItems: 1,
        );
      }

      // books[0].name
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[0],
          'name',
        );
        checkFormControl(
          fc: fc,
          name: 'name',
          fullname: '${fc.parentGroup.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'Le seigneur des anneaux 1',
        );
        expect(
          fc.formPath,
          'root.controls[\'books\'].groups[0].controls[\'name\']',
        );
        expect(fc.modelPath, 'root.books[0].name');
      }

      // books[0].price
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[0],
          'price',
        );
        checkFormControl(
          fc: fc,
          name: 'price',
          fullname: '${fc.parentGroup.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 8.9,
        );
        expect(
          fc.formPath,
          'root.controls[\'books\'].groups[0].controls[\'price\']',
        );
        expect(fc.modelPath, 'root.books[0].price');
      }

      // books[0].loanDate
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[0],
          'loanDate',
        );
        checkFormControl(
          fc: fc,
          name: 'loanDate',
          fullname: '${fc.parentGroup.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(2020, 10, 26),
        );
        expect(
          fc.formPath,
          'root.controls[\'books\'].groups[0].controls[\'loanDate\']',
        );
        expect(fc.modelPath, 'root.books[0].loanDate');
      }
    });

    test('Remove item on collection. Actualize the form array.', () async {
      FormBuilderTest model = new FormBuilderTest(
        'Edouard',
        'Elric',
        new DateTime(1980, 12, 15),
        new DateTime(2019, 06, 01),
      );
      model.books.value = [
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
      ModelFormState formState = new ModelFormState(model: model);

      {
        ModelFormArray fa =
            formState.formBuilder.getFormElement<ModelFormArray>(
          model,
          'books',
        );
        checkFormArray(
          fa: fa,
          name: 'books',
          fullname: '${fa.parentGroup.hashCode}.books',
          status: EAbstractControlStatus.pure,
          error: null,
          nbItems: 3,
        );
      }

      // remove book
      model.books.value.remove(model.books.value[1]);
      await Future.delayed(const Duration(microseconds: 1), () {});

      // books
      {
        ModelFormArray fa =
            formState.formBuilder.getFormElement<ModelFormArray>(
          model,
          'books',
        );
        checkFormArray(
          fa: fa,
          name: 'books',
          fullname: '${fa.parentGroup.hashCode}.books',
          status: EAbstractControlStatus.pure,
          error: null,
          nbItems: 2,
        );
      }

      // books[0].name
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[0],
          'name',
        );
        checkFormControl(
          fc: fc,
          name: 'name',
          fullname: '${fc.parentGroup.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'Voyage au centre de la terre',
        );
        expect(
          fc.formPath,
          'root.controls[\'books\'].groups[0].controls[\'name\']',
        );
        expect(fc.modelPath, 'root.books[0].name');
      }

      // books[0].price
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[0],
          'price',
        );
        checkFormControl(
          fc: fc,
          name: 'price',
          fullname: '${fc.parentGroup.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 8.9,
        );
        expect(
          fc.formPath,
          'root.controls[\'books\'].groups[0].controls[\'price\']',
        );
        expect(fc.modelPath, 'root.books[0].price');
      }

      // books[0].loanDate
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[0],
          'loanDate',
        );
        checkFormControl(
          fc: fc,
          name: 'loanDate',
          fullname: '${fc.parentGroup.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(2020, 04, 08),
        );
        expect(
          fc.formPath,
          'root.controls[\'books\'].groups[0].controls[\'loanDate\']',
        );
        expect(fc.modelPath, 'root.books[0].loanDate');
      }

      // books[1].name
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[1],
          'name',
        );
        checkFormControl(
          fc: fc,
          name: 'name',
          fullname: '${fc.parentGroup.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 'Le Tour du monde en quatre-vingts jours',
        );
        expect(
          fc.formPath,
          'root.controls[\'books\'].groups[1].controls[\'name\']',
        );
        expect(fc.modelPath, 'root.books[1].name');
      }

      // books[1].price
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[1],
          'price',
        );
        checkFormControl(
          fc: fc,
          name: 'price',
          fullname: '${fc.parentGroup.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: 8.9,
        );
        expect(
          fc.formPath,
          'root.controls[\'books\'].groups[1].controls[\'price\']',
        );
        expect(fc.modelPath, 'root.books[1].price');
      }

      // books[1].loanDate
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[1],
          'loanDate',
        );
        checkFormControl(
          fc: fc,
          name: 'loanDate',
          fullname: '${fc.parentGroup.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: new DateTime(2020, 04, 26),
        );
        expect(
          fc.formPath,
          'root.controls[\'books\'].groups[1].controls[\'loanDate\']',
        );
        expect(fc.modelPath, 'root.books[1].loanDate');
      }
    });

    test('Get pathes from abstract controls.', () {
      FormBuilderTest model = new FormBuilderTest(
        'Edouard',
        'Elric',
        new DateTime(1980, 12, 15),
        new DateTime(2019, 06, 01),
      );
      model.books.value = [
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
      model.favoriteBook.value = new Book(
        'De la Terre à la Lune',
        8.9,
        new DateTime(2020, 04, 17),
      );

      ModelFormState formState = new ModelFormState(model: model);

      // firstName
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model,
          'firstName',
        );
        expect(fc.formPath, 'root.controls[\'firstName\']');
        expect(fc.modelPath, 'root.firstName');
      }

      // books
      {
        ModelFormArray fa =
            formState.formBuilder.getFormElement<ModelFormArray>(
          model,
          'books',
        );
        expect(fa.formPath, 'root.controls[\'books\']');
        expect(fa.modelPath, 'root.books');
      }

      // books[1].price
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.books.value[1],
          'price',
        );
        expect(fc.formPath,
            'root.controls[\'books\'].groups[1].controls[\'price\']');
        expect(fc.modelPath, 'root.books[1].price');
      }

      // favoriteBook.loanDate
      {
        ModelFormControl fc =
            formState.formBuilder.getFormElement<ModelFormControl>(
          model.favoriteBook.value,
          'loanDate',
        );
        expect(
          fc.formPath,
          'root.controls[\'favoriteBook\'].controls[\'loanDate\']',
        );
        expect(fc.modelPath, 'root.favoriteBook.loanDate');
      }
    });
  });
}
