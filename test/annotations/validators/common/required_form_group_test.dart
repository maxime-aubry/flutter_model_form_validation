import 'package:flutter_test/flutter_test.dart';

import 'stubs/required_form_group.dart';

void main() {
  group('Annotations > Validators > Required (on FormGroup).', () {
    group('Valid.', () {
      test('FormGroup\'s controls are populated.', () async {
        RequiredFormGroup_FormGroupControlsArePopulated_Stub stub =
            new RequiredFormGroup_FormGroupControlsArePopulated_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('FormGroup\'s controls are null.', () async {
        RequiredFormGroup_FormGroupControlsAreNull_Stub stub =
            new RequiredFormGroup_FormGroupControlsAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('FormGroup\'s controls are empty.', () async {
        RequiredFormGroup_FormGroupControlsAreEmpty_Stub stub =
            new RequiredFormGroup_FormGroupControlsAreEmpty_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });
  });
}
