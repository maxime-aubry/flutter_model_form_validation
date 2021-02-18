import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/form_validator_navigator_for_form_control.dart';

void main() {
  group('Annotations > Validators > FormValidatorNavigator > FormControl.', () {
    test('FormControl is found.', () {
      FormValidatorNavigator_ForFormControl_TargetFound_Stub stub =
          new FormValidatorNavigator_ForFormControl_TargetFound_Stub();
      FormControl<String> formControl = stub.navigator
          .getFormControl<String>(stub.control.parentGroup, 'target');
      expect(formControl, isNotNull);
    });

    test(
        'Throws an ValidatorNavigationException exception because target is not FormControl<String>.',
        () {
      FormValidatorNavigator_ForFormControl_BadTargetType_Stub stub =
          new FormValidatorNavigator_ForFormControl_BadTargetType_Stub();
      expect_exception<ValidatorNavigationException>(() {
        stub.navigator.getFormControl<int>(stub.control.parentGroup, 'target');
      }, 'AbstractControl exists but it is not of FormControl<int> type.');
    });

    test(
        'Throws an ValidatorNavigationException exception because target is not found.',
        () {
      FormValidatorNavigator_ForFormControl_TargetNotFound_Stub stub =
          new FormValidatorNavigator_ForFormControl_TargetNotFound_Stub();
      expect_exception<ValidatorNavigationException>(() {
        stub.navigator
            .getFormControl<String>(stub.control.parentGroup, 'target');
      }, 'target is not defined.');
    });

    test('Remote parameter value is provided.', () {
      FormValidatorNavigator_ForFormControl_ParameterIsOk_Stub stub =
          new FormValidatorNavigator_ForFormControl_ParameterIsOk_Stub();
      DateTime parameter = stub.navigator.getRemoteValidatorParameter<DateTime>(
        defaultValue: const ConstantDateTime('2021-01-01T00:00:00'),
        localParameterName: 'target',
        remoteParameterName: 'target',
        control: stub.control.parentGroup,
      );
      expect(parameter, isNotNull);
      expect(parameter, equals(new DateTime(2021, 1, 2)));
    });

    test(
        'When using DateTime, local parameter value is not a ConstantDateTime.',
        () {
      FormValidatorNavigator_ForFormControl_DefaultValueHasBadType_Stub stub =
          new FormValidatorNavigator_ForFormControl_DefaultValueHasBadType_Stub();
      expect_exception<ValidatorParameterException>(() {
        stub.navigator.getRemoteValidatorParameter<DateTime>(
          defaultValue: new DateTime(2021, 1, 1),
          localParameterName: 'target',
          remoteParameterName: 'target',
          control: stub.control.parentGroup,
        );
      }, '''Cannot get datetime from remote parameter.
            This one is not a ConstantDateTime object, its type is DateTime.
            Please, provide a ConstantDateTime object, just like this :
            @Validator(parameter: ConstantDateTime('yyyy-MM-ddTHH:mm:ssZ'))''');
    });

    test('Remote parameter name is not provided.', () {
      FormValidatorNavigator_ForFormControl_ParameterNameIsNotDefined_Stub
          stub =
          new FormValidatorNavigator_ForFormControl_ParameterNameIsNotDefined_Stub();
      expect_exception<ValidatorParameterException>(() {
        stub.navigator.getRemoteValidatorParameter<DateTime>(
          defaultValue: const ConstantDateTime('2021-01-01T00:00:00'),
          localParameterName: 'target',
          remoteParameterName: '',
          control: stub.control.parentGroup,
        );
      }, 'Remote parameter name is not defined.');
    });
  });
}
