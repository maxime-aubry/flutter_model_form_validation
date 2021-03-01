import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../form/reactive_form/parts/initializer/fake_initializer.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > Email.', () {
    group('Valid.', () {
      test('value is a valid email.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'a.a@a.a', validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Email validator = Email(error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'a.a@a.a');
      });

      test('value is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Email validator = Email(error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
      });

      test('value is empty.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: '', validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Email validator = Email(error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, '');
      });
    });

    group('Invalid.', () {
      test('value is not a valid email.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'a.a@a', validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Email validator = Email(error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'a.a@a');
      });
    });
  });
}
