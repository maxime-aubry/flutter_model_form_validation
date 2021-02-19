import 'package:flutter_test/flutter_test.dart';

import 'stubs/required_form_control.dart';

void main() {
  group('Annotations > Validators > Common > Required (on FormControl).', () {
    group('Valid.', () {
      test('FormControl\'s value is valid.', () async {
        RequiredFormControl_FormControlValueIsValid_Stub stub =
            new RequiredFormControl_FormControlValueIsValid_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('FormControl\'s controls are null.', () async {
        RequiredFormControl_FormControlValueIsNull_Stub stub =
            new RequiredFormControl_FormControlValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('FormControl\'s controls are empty.', () async {
        RequiredFormControl_FormControlValueIsEmpty_Stub stub =
            new RequiredFormControl_FormControlValueIsEmpty_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });
  });
}
