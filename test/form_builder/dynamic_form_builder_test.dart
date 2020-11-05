import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DynamicFormBuilder.', () {
    test('Unable to generate a form using by a null model.', () {
      expect(() {
        FormState modelState = new FormState(formBuilder: null);
        expect(modelState, isNotNull);
      }, throwsA(isA<AssertionError>()));
    });

    test('Initialize form builder.', () async {
      FormBuilder formBuilder = new FormBuilder(
        group: new FormGroup(
          controls: {
            'first_name': new FormControl<String>(
              value: null,
              validators: [Required(error: 'error message here')],
            ),
            'last_name': new FormControl<String>(
              value: null,
              validators: [Required(error: 'error message here')],
            ),
            'birth_day': new FormControl<DateTime>(
              value: null,
              validators: [Required(error: 'error message here')],
            ),
            'subscription_date': new FormControl<DateTime>(
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
                    'loan_date': new FormControl<DateTime>(
                      value: null,
                      validators: [Required(error: 'error message here')],
                    ),
                  },
                  validators: [],
                ),
              ],
              validators: [Required(error: 'error message here')],
            ),
            'favorite_book': new FormGroup(
              controls: {
                'name': new FormControl<String>(
                  value: null,
                  validators: [Required(error: 'error message here')],
                ),
                'price': new FormControl<num>(
                  value: null,
                  validators: [Required(error: 'error message here')],
                ),
                'loan_date': new FormControl<DateTime>(
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
      FormState formState = new FormState(formBuilder: formBuilder);

      // first_name
      {
        FormControl<String> fc = formState
            .formBuilder.group.controls['first_name'] as FormControl<String>;
        EAbstractControlStatus status = formState.getStatus(fc.listenerName);
        ValidationError error = formState.getError(fc.listenerName);
        checkFormControl<String>(
          fc,
          'first_name',
          EAbstractControlStatus.pure,
          null,
        );
        expect((fc.parentGroup as FormGroup).name, 'root');
        expect(status, EAbstractControlStatus.pure);
        expect(error, isNull);
      }

      // last_name
      {
        FormControl<String> fc = formState
            .formBuilder.group.controls['last_name'] as FormControl<String>;
        EAbstractControlStatus status = formState.getStatus(fc.listenerName);
        ValidationError error = formState.getError(fc.listenerName);
        checkFormControl<String>(
          fc,
          'last_name',
          EAbstractControlStatus.pure,
          null,
        );
        expect((fc.parentGroup as FormGroup).name, 'root');
        expect(status, EAbstractControlStatus.pure);
        expect(error, isNull);
      }

      // birth_day
      {
        FormControl<DateTime> fc = formState
            .formBuilder.group.controls['birth_day'] as FormControl<DateTime>;
        EAbstractControlStatus status = formState.getStatus(fc.listenerName);
        ValidationError error = formState.getError(fc.listenerName);
        checkFormControl<DateTime>(
          fc,
          'birth_day',
          EAbstractControlStatus.pure,
          null,
        );
        expect((fc.parentGroup as FormGroup).name, 'root');
        expect(status, EAbstractControlStatus.pure);
        expect(error, isNull);
      }

      // subscription_date
      {
        FormControl<DateTime> fc = formState.formBuilder.group
            .controls['subscription_date'] as FormControl<DateTime>;
        EAbstractControlStatus status = formState.getStatus(fc.listenerName);
        ValidationError error = formState.getError(fc.listenerName);
        checkFormControl(
          fc,
          'subscription_date',
          EAbstractControlStatus.pure,
          null,
        );
        expect((fc.parentGroup as FormGroup).name, 'root');
        expect(status, EAbstractControlStatus.pure);
        expect(error, isNull);
      }

      // books
      {
        FormArray fa =
            formState.formBuilder.group.controls['books'] as FormArray;
        EAbstractControlStatus status = formState.getStatus(fa.listenerName);
        ValidationError error = formState.getError(fa.listenerName);
        checkFormArray(fa, 'books', EAbstractControlStatus.pure, 1);
        expect((fa.parentGroup as FormGroup).name, 'root');
        expect(status, EAbstractControlStatus.pure);
        expect(error, isNull);
      }

      // books[0]
      {
        FormArray fa =
            formState.formBuilder.group.controls['books'] as FormArray;
        FormGroup fg = fa.groups[0] as FormGroup;
        EAbstractControlStatus status = formState.getStatus(fg.listenerName);
        ValidationError error = formState.getError(fg.listenerName);
        checkFormGroup(fg, 'books', EAbstractControlStatus.pure, false);
        expect((fg.parentGroup as FormGroup).name, 'root');
        expect(status, EAbstractControlStatus.pure);
        expect(error, isNull);
      }

      // books[0].name
      {
        FormArray fa =
            formState.formBuilder.group.controls['books'] as FormArray;
        FormGroup fg = fa.groups[0] as FormGroup;
        FormControl<String> fc = fg.controls['name'] as FormControl<String>;
        EAbstractControlStatus status = formState.getStatus(fc.listenerName);
        ValidationError error = formState.getError(fc.listenerName);
        checkFormControl(fc, 'name', EAbstractControlStatus.pure, null);
        expect((fc.parentGroup as FormGroup).name, 'books');
        expect(status, EAbstractControlStatus.pure);
        expect(error, isNull);
      }

      // books[0].price
      {
        FormArray fa =
            formState.formBuilder.group.controls['books'] as FormArray;
        FormGroup fg = fa.groups[0] as FormGroup;
        FormControl<num> fc = fg.controls['price'] as FormControl<num>;
        EAbstractControlStatus status = formState.getStatus(fc.listenerName);
        ValidationError error = formState.getError(fc.listenerName);
        checkFormControl<num>(fc, 'price', EAbstractControlStatus.pure, null);
        expect((fc.parentGroup as FormGroup).name, 'books');
        expect(status, EAbstractControlStatus.pure);
        expect(error, isNull);
      }

      // books[0].loan_date
      {
        FormArray fa =
            formState.formBuilder.group.controls['books'] as FormArray;
        FormGroup fg = fa.groups[0] as FormGroup;
        FormControl<DateTime> fc =
            fg.controls['loan_date'] as FormControl<DateTime>;
        EAbstractControlStatus status = formState.getStatus(fc.listenerName);
        ValidationError error = formState.getError(fc.listenerName);
        checkFormControl(fc, 'loan_date', EAbstractControlStatus.pure, null);
        expect((fc.parentGroup as FormGroup).name, 'books');
        expect(status, EAbstractControlStatus.pure);
        expect(error, isNull);
      }

      // favorite_book
      {
        FormGroup fg =
            formState.formBuilder.group.controls['favorite_book'] as FormGroup;
        EAbstractControlStatus status = formState.getStatus(fg.listenerName);
        ValidationError error = formState.getError(fg.listenerName);
        checkFormGroup(fg, 'favorite_book', EAbstractControlStatus.pure, false);
        expect((fg.parentGroup as FormGroup).name, 'root');
        expect(status, EAbstractControlStatus.pure);
        expect(error, isNull);
      }
    });
  });
}

void checkFormGroup(
  FormGroup fg,
  String name,
  EAbstractControlStatus status,
  bool areControlsNull,
) {
  // name
  if (name == null)
    expect(fg.name, isNull);
  else
    expect(fg.name, name);

  // controls
  if (areControlsNull)
    expect(fg.controls, {});
  else
    expect(fg.controls, isNotNull);

  // status
  expect(fg.status, status);
}

void checkFormArray(
  FormArray fa,
  String name,
  EAbstractControlStatus status,
  int nbItems,
) {
  // name
  if (name == null)
    expect(fa.name, isNull);
  else
    expect(fa.name, name);

  // nbItems
  if (nbItems == null)
    expect(fa.groups, []);
  else
    expect(fa.groups.length, nbItems);

  // status
  expect(fa.status, status);
}

void checkFormControl<T>(
  FormControl<T> fc,
  String name,
  EAbstractControlStatus status,
  Object value,
) {
  // name
  if (name == null)
    expect(fc.name, isNull);
  else
    expect(fc.name, name);

  // value
  if (value == null)
    expect(fc.getValue(), isNull);
  else
    expect(fc.getValue(), value);

  // status
  expect(fc.status, status);
}
