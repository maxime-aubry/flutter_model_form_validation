import 'package:flutter_test/flutter_test.dart';

import 'stubs/required_form_array.dart';

void main() {
  group('Annotations > Validators > Required (on FormArray).', () {
    test('FormArray\'s groups are populated.', () async {
      RequiredFormArray_FormArrayGroupsArePopulated_Stub stub =
          new RequiredFormArray_FormArrayGroupsArePopulated_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('FormArray\'s groups are null.', () async {
      RequiredFormArray_FormArrayGroupsAreNull_Stub stub =
          new RequiredFormArray_FormArrayGroupsAreNull_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isFalse);
    });

    test('FormArray\'s groups are empty.', () async {
      RequiredFormArray_FormArrayGroupsAreEmpty_Stub stub =
          new RequiredFormArray_FormArrayGroupsAreEmpty_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isFalse);
    });
  });
}
