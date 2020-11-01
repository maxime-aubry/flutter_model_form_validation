import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DynamicFormBuilder.', () {
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
    });
  });
}
