import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('DynamicFormBuilder.', () {
    // test('Unable to generate a form using by a null model.', () {
    //   expect(() {
    //     ReactiveFormState modelState = new ReactiveFormState(formBuilder: null);
    //     expect(modelState, isNotNull);
    //   }, throwsA(isA<AssertionError>()));
    // });

    test('Initialize form builder.', () async {
      ReactiveFormBuilder formBuilder = new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'firstName': new FormControl<String>(
              value: null,
              validators: [Required(error: 'error message here')],
            ),
            'lastName': new FormControl<String>(
              value: null,
              validators: [Required(error: 'error message here')],
            ),
            'birthDay': new FormControl<DateTime>(
              value: null,
              validators: [Required(error: 'error message here')],
            ),
            'subscriptionDate': new FormControl<DateTime>(
              value: null,
              validators: [Required(error: 'error message here')],
            ),
            'books': new FormArray(
              groups: [
                new FormGroup(
                  controls: {
                    'name': new FormControl<String>(
                      value: null,
                      validators: [Required(error: 'error message here')],
                    ),
                    'price': new FormControl<num>(
                      value: null,
                      validators: [Required(error: 'error message here')],
                    ),
                    'loanDate': new FormControl<DateTime>(
                      value: null,
                      validators: [Required(error: 'error message here')],
                    ),
                  },
                  validators: [],
                ),
              ],
              validators: [Required(error: 'error message here')],
            ),
            'favoriteBook': new FormGroup(
              controls: {
                'name': new FormControl<String>(
                  value: null,
                  validators: [Required(error: 'error message here')],
                ),
                'price': new FormControl<num>(
                  value: null,
                  validators: [Required(error: 'error message here')],
                ),
                'loanDate': new FormControl<DateTime>(
                  value: null,
                  validators: [Required(error: 'error message here')],
                ),
              },
              validators: [Required(error: 'error message here')],
            ),
          },
          validators: [],
        ),
      );
      ReactiveFormState formState = new ReactiveFormState(formBuilder: formBuilder);

      expect(formState.status, EFormStatus.pure);

      // firstName
      {
        FormControl<String> fc =
            formBuilder.group.controls['firstName'] as FormControl<String>;
        checkFormControl<String>(
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
        FormControl<String> fc =
            formBuilder.group.controls['lastName'] as FormControl<String>;
        checkFormControl<String>(
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
        FormControl<DateTime> fc =
            formBuilder.group.controls['birthDay'] as FormControl<DateTime>;
        checkFormControl<DateTime>(
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
        FormControl<DateTime> fc = formBuilder
            .group.controls['subscriptionDate'] as FormControl<DateTime>;
        checkFormControl<DateTime>(
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
        FormArray fa = formBuilder.group.controls['books'] as FormArray;
        checkFormArray(
          fa: fa,
          name: 'books',
          fullname: '${fa.parentGroup.hashCode}.books',
          status: EAbstractControlStatus.pure,
          error: null,
          nbItems: 1,
        );
      }

      // books[0]
      {
        FormArray fa = formBuilder.group.controls['books'] as FormArray;
        FormGroup fg = fa.groups[0];
        checkFormGroup(
          fg: fg,
          name: 'books[0]',
          fullname: '${fg.parentGroup.hashCode}.books[0]',
          status: EAbstractControlStatus.pure,
          error: null,
          areControlsNull: false,
        );
      }

      // books[0].name
      {
        FormArray fa = formBuilder.group.controls['books'] as FormArray;
        FormGroup fg = fa.groups[0];
        FormControl<String> fc = fg.controls['name'] as FormControl<String>;
        checkFormControl(
          fc: fc,
          name: 'name',
          fullname: '${fc.parentGroup.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // books[0].price
      {
        FormArray fa = formBuilder.group.controls['books'] as FormArray;
        FormGroup fg = fa.groups[0];
        FormControl<num> fc = fg.controls['price'] as FormControl<num>;
        checkFormControl(
          fc: fc,
          name: 'price',
          fullname: '${fc.parentGroup.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // books[0].loanDate
      {
        FormArray fa = formBuilder.group.controls['books'] as FormArray;
        FormGroup fg = fa.groups[0];
        FormControl<DateTime> fc =
            fg.controls['loanDate'] as FormControl<DateTime>;
        checkFormControl(
          fc: fc,
          name: 'loanDate',
          fullname: '${fc.parentGroup.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // favoriteBook
      {
        FormGroup fg = formBuilder.group.controls['favoriteBook'] as FormGroup;
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
  });
}
