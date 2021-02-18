import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/form_validator_navigator_for_form_group.dart';

void main() {
  group('Annotations > Validators > FormValidatorNavigator > FormGroup.', () {
    test('FormGroup is found.', () {
      FormValidatorNavigator_ForFormGroup_TargetFound_Stub stub =
          new FormValidatorNavigator_ForFormGroup_TargetFound_Stub();
      FormGroup formGroup =
          stub.navigator.getFormGroup(stub.control.parentGroup, 'target');
      expect(formGroup, isNotNull);
    });

    test(
        'Throws an ValidatorNavigationException exception because target is not found.',
        () {
      FormValidatorNavigator_ForFormGroup_TargetNotFound_Stub stub =
          new FormValidatorNavigator_ForFormGroup_TargetNotFound_Stub();
      expect_exception<ValidatorNavigationException>(() {
        stub.navigator.getFormGroup(stub.control.parentGroup, 'target');
      }, 'target is not defined.');
    });
  });
}
