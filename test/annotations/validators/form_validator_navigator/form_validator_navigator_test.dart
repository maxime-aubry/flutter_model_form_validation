import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/form_validator_navigator.dart';

void main() {
  group('Annotations > Validators > FormValidatorNavigator.', () {
    test('Target1 (FormGroup) is found.', () {
      FormValidatorNavigator_Target1IsFound_Stub stub =
          new FormValidatorNavigator_Target1IsFound_Stub();
      FormGroup target = stub.control.parentGroup.getFormGroup(stub.targetName);
      expect(target, isNotNull);
    });

    test('Target2 (FormArray) is found.', () {
      FormValidatorNavigator_Target2IsFound_Stub stub =
          new FormValidatorNavigator_Target2IsFound_Stub();
      FormArray target = stub.control.parentGroup.getFormArray(stub.targetName);
      expect(target, isNotNull);
    });

    test('Target3 (FormControl<String>) is found.', () {
      FormValidatorNavigator_Target3IsFound_Stub stub =
          new FormValidatorNavigator_Target3IsFound_Stub();
      FormControl<String> target =
          stub.control.parentGroup.getFormControl<String>(stub.targetName);
      expect(target, isNotNull);
    });

    /*test('Remote parameter value is provided.', () {
      FormValidatorNavigator_ParameterIsOk_Stub stub =
          new FormValidatorNavigator_ParameterIsOk_Stub();
      DateTime parameter = stub.navigator.getRemoteValidatorParameter<DateTime>(
        defaultValue: const ConstantDateTime('2021-01-01T00:00:00'),
        localParameterName: 'target',
        remoteParameterName: 'target',
        formGroup: stub.control.parentGroup,
      );
      expect(parameter, isNotNull);
      expect(parameter, equals(new DateTime(2021, 1, 2)));
    });

    test(
        'When using DateTime, local parameter value is not a ConstantDateTime.',
        () {
      FormValidatorNavigator_DefaultValueHasBadType_Stub stub =
          new FormValidatorNavigator_DefaultValueHasBadType_Stub();
      expect_exception<ValidatorParameterException>(() {
        stub.navigator.getRemoteValidatorParameter<DateTime>(
          defaultValue: new DateTime(2021, 1, 1),
          localParameterName: 'target',
          remoteParameterName: 'target',
          formGroup: stub.control.parentGroup,
        );
      }, '''Cannot get datetime from remote parameter.
            This one is not a ConstantDateTime object, its type is DateTime.
            Please, provide a ConstantDateTime object, just like this :
            @Validator(parameter: ConstantDateTime('yyyy-MM-ddTHH:mm:ssZ'))''');
    });

    test('Remote parameter name is not provided.', () {
      FormValidatorNavigator_ParameterNameIsNotDefined_Stub stub =
          new FormValidatorNavigator_ParameterNameIsNotDefined_Stub();
      expect_exception<ValidatorParameterException>(() {
        stub.navigator.getRemoteValidatorParameter<DateTime>(
          defaultValue: const ConstantDateTime('2021-01-01T00:00:00'),
          localParameterName: 'target',
          remoteParameterName: '',
          formGroup: stub.control.parentGroup,
        );
      }, 'Remote parameter name is not defined.');
    });*/
  });
}
