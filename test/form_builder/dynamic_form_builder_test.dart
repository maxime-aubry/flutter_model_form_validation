import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  group('DynamicFormBuilder.', () {
    // test('Unable to generate a form using by a null model.', () {
    //   expect(() {
    //     FormStateBase modelState = new FormStateBase(formBuilder: null);
    //     expect(modelState, isNotNull);
    //   }, throwsA(isA<AssertionError>()));
    // });

    test('Initialize form builder.', () async {
      FormBuilder formBuilder = new FormBuilder(
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
      FormStateBase formState = new FormStateBase(formBuilder: formBuilder);

      // firstName
      {
        FormControl<String> fc = formState
            .formBuilder.group.controls['firstName'] as FormControl<String>;
        checkFormControl<String>(
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
        FormControl<String> fc = formState
            .formBuilder.group.controls['lastName'] as FormControl<String>;
        checkFormControl<String>(
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
        FormControl<DateTime> fc = formState
            .formBuilder.group.controls['birthDay'] as FormControl<DateTime>;
        checkFormControl<DateTime>(
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
        FormControl<DateTime> fc = formState.formBuilder.group
            .controls['subscriptionDate'] as FormControl<DateTime>;
        checkFormControl<DateTime>(
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
        FormArray fa =
            formState.formBuilder.group.controls['books'] as FormArray;
        checkFormArray(
          fa: fa,
          formState: formState,
          name: 'books',
          fullname: '${fa.hashCode}.books',
          status: EAbstractControlStatus.pure,
          error: null,
          nbItems: 1,
        );
      }

      // books[0]
      {
        FormArray fa =
            formState.formBuilder.group.controls['books'] as FormArray;
        FormGroup fg = fa.groups[0];
        checkFormGroup(
          fg: fg,
          formState: formState,
          name: 'books[0]',
          fullname: '${fg.hashCode}.books[0]',
          status: EAbstractControlStatus.pure,
          error: null,
          areControlsNull: false,
        );
      }

      // books[0].name
      {
        FormArray fa =
            formState.formBuilder.group.controls['books'] as FormArray;
        FormGroup fg = fa.groups[0];
        FormControl<String> fc = fg.controls['name'] as FormControl<String>;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'name',
          fullname: '${fc.hashCode}.name',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // books[0].price
      {
        FormArray fa =
            formState.formBuilder.group.controls['books'] as FormArray;
        FormGroup fg = fa.groups[0];
        FormControl<num> fc = fg.controls['price'] as FormControl<num>;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'price',
          fullname: '${fc.hashCode}.price',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // books[0].loanDate
      {
        FormArray fa =
            formState.formBuilder.group.controls['books'] as FormArray;
        FormGroup fg = fa.groups[0];
        FormControl<DateTime> fc =
            fg.controls['loanDate'] as FormControl<DateTime>;
        checkFormControl(
          fc: fc,
          formState: formState,
          name: 'loanDate',
          fullname: '${fc.hashCode}.loanDate',
          status: EAbstractControlStatus.pure,
          error: null,
          value: null,
        );
      }

      // favoriteBook
      {
        FormGroup fg =
            formState.formBuilder.group.controls['favoriteBook'] as FormGroup;
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
  });
}
