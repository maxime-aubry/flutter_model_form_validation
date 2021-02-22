import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/form_validator_navigator.dart';

void main() {
  group('Annotations > Validators > FormValidatorNavigator > FormControl.', () {
    test('Remote parameter value is provided.', () {
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
    });
  });
}
