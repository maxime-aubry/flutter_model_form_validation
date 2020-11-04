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
                validators: [Required(error: 'error message here')]),
            'last_name': new FormControl<String>(
                value: null,
                validators: [Required(error: 'error message here')]),
            'birth_day': new FormControl<DateTime>(
                value: null,
                validators: [Required(error: 'error message here')]),
            'subscription_date': new FormControl<DateTime>(
                value: null,
                validators: [Required(error: 'error message here')]),
            'books': new FormArray(
              groups: [
                new FormGroup(
                  controls: {
                    'name': new FormControl<String>(
                        value: null,
                        validators: [Required(error: 'error message here')]),
                    'price': new FormControl<num>(
                        value: null,
                        validators: [Required(error: 'error message here')]),
                    'loan_date': new FormControl<DateTime>(
                        value: null,
                        validators: [Required(error: 'error message here')]),
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
                    validators: [Required(error: 'error message here')]),
                'price': new FormControl<num>(
                    value: null,
                    validators: [Required(error: 'error message here')]),
                'loan_date': new FormControl<DateTime>(
                    value: null,
                    validators: [Required(error: 'error message here')]),
              },
              validators: [Required(error: 'error message here')],
            ),
          },
          validators: [],
        ),
      );
      FormState formState = new FormState(formBuilder: formBuilder);

      FormGroup fg;
      FormArray fa;
      FormControl fc;

      // first_name
      fc = formState.formBuilder.group.controls['first_name'] as FormControl;
      checkFormControl(
        fc,
        'first_name',
        EAbstractControlStatus.pure,
        null,
        [Required],
        null,
      );
      expect(fc.parentGroup.name, 'root');

      // last_name
      fc = formState.formBuilder.group.controls['last_name'] as FormControl;
      checkFormControl(
        fc,
        'last_name',
        EAbstractControlStatus.pure,
        null,
        [Required],
        null,
      );
      expect(fc.parentGroup.name, 'root');

      // birth_day
      fc = formState.formBuilder.group.controls['birth_day'] as FormControl;
      checkFormControl(
        fc,
        'birth_day',
        EAbstractControlStatus.pure,
        null,
        [Required],
        null,
      );
      expect(fc.parentGroup.name, 'root');

      // subscription_date
      fc = formState.formBuilder.group.controls['subscription_date']
          as FormControl;
      checkFormControl(
        fc,
        'subscription_date',
        EAbstractControlStatus.pure,
        null,
        [Required],
        null,
      );
      expect(fc.parentGroup.name, 'root');

      // books
      fa = formState.formBuilder.group.controls['books'] as FormArray;
      checkFormArray(
        fa,
        'books',
        EAbstractControlStatus.pure,
        null,
        [Required],
        1,
      );
      expect(fa.parentGroup.name, 'root');

      // books[0]
      fg = fa.groups[0] as FormGroup;
      checkFormGroup(
        fg,
        'books',
        EAbstractControlStatus.pure,
        null,
        [],
        false,
      );
      expect(fg.parentGroup.name, 'root');

      // books[0].name
      fc = fg.controls['name'] as FormControl;
      checkFormControl(
        fc,
        'name',
        EAbstractControlStatus.pure,
        null,
        [Required],
        null,
      );
      expect(fc.parentGroup.name, 'books');

      // books[0].price
      fc = fg.controls['price'] as FormControl;
      checkFormControl(
        fc,
        'price',
        EAbstractControlStatus.pure,
        null,
        [Required],
        null,
      );
      expect(fc.parentGroup.name, 'books');

      // books[0].loan_date
      fc = fg.controls['loan_date'] as FormControl;
      checkFormControl(
        fc,
        'loan_date',
        EAbstractControlStatus.pure,
        null,
        [Required],
        null,
      );
      expect(fc.parentGroup.name, 'books');

      // favorite_book
      fg = formState.formBuilder.group.controls['favorite_book'] as FormGroup;
      checkFormGroup(
        fg,
        'favorite_book',
        EAbstractControlStatus.pure,
        null,
        [Required],
        false,
      );
      expect(fg.parentGroup.name, 'root');
    });
  });
}

void checkFormGroup(
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
    expect(fg.controls, {});
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

void checkFormArray(
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
    expect(fa.groups, []);
  else
    expect(fa.groups.length, nbItems);

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

void checkFormControl(
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
