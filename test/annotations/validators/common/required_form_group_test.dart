import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Annotations > Validators > Common > Required (on FormGroup).', () {
    group('Valid.', () {
      test('FormGroup\'s controls are populated.', () async {
        FormGroup formGroup = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        Required validator = Required(error: '');

        bool isValid = await validator.isValid(formGroup);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('FormGroup\'s controls are null.', () async {
        FormGroup formGroup = new FormGroup(
          controls: null,
          validators: [],
        );
        Required validator = Required(error: '');

        bool isValid = await validator.isValid(formGroup);
        expect(isValid, isFalse);
      });

      test('FormGroup\'s controls are empty.', () async {
        FormGroup formGroup = new FormGroup(
          controls: {},
          validators: [],
        );
        Required validator = Required(error: '');

        bool isValid = await validator.isValid(formGroup);
        expect(isValid, isFalse);
      });
    });
  });
}
