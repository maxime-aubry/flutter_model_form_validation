import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/form_validator_navigator_for_form_array.dart';

void main() {
  group('Annotations > Validators > FormValidatorNavigator > FormArray.', () {
    test('FormGroup is found.', () {
      FormValidatorNavigator_ForFormArray_TargetFound_Stub stub =
          new FormValidatorNavigator_ForFormArray_TargetFound_Stub();
      FormArray formArray =
          stub.navigator.getFormArray(stub.control.parentGroup, 'target');
      expect(formArray, isNotNull);
    });

    test(
        'Throws an ValidatorNavigationException exception because target is not found.',
        () {
      FormValidatorNavigator_ForFormArray_TargetNotFound_Stub stub =
          new FormValidatorNavigator_ForFormArray_TargetNotFound_Stub();
      expect_exception<ValidatorNavigationException>(() {
        stub.navigator.getFormArray(stub.control.parentGroup, 'target');
      }, 'target is not defined.');
    });
  });
}
