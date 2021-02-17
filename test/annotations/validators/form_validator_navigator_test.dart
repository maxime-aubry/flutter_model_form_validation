import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../expect_exception.dart';
import 'stubs/form_validator_annotation.dart';

void main() {
  group('Annotations > Validators > FormValidatorNavigator.', () {
    group('FormGroup', () {});

    group('FormArray', () {});

    group('FormControl', () {
      test('FormControl is found.', () {
        FormValidatorAnnotationWithFormControlParameter_FormControlParameterFound_Stub
            stub =
            new FormValidatorAnnotationWithFormControlParameter_FormControlParameterFound_Stub();
        FormControl<String> formControl = stub.navigator
            .getFormControl<String>(stub.control.parentGroup, 'parameter');
        expect(formControl, isNotNull);
      });

      test(
          'Throws an ValidatorNavigationException exception because target is not FormControl<String>.',
          () {
        FormValidatorAnnotationWithFormControlParameter_BadTargetType_Stub
            stub =
            new FormValidatorAnnotationWithFormControlParameter_BadTargetType_Stub();
        expect_exception<ValidatorNavigationException>(() {
          stub.navigator
              .getFormControl<int>(stub.control.parentGroup, 'parameter');
        }, 'AbstractControl exists but it is not of FormControl<int> type.');
      });

      test(
          'Throws an ValidatorNavigationException exception because target is not found.',
          () {
        FormValidatorAnnotationWithFormControlParameter_TargetNotFound_Stub
            stub =
            new FormValidatorAnnotationWithFormControlParameter_TargetNotFound_Stub();
        expect_exception<ValidatorNavigationException>(() {
          stub.navigator
              .getFormControl<String>(stub.control.parentGroup, 'parameter');
        }, 'parameter is not defined.');
      });
    });
  });
}
