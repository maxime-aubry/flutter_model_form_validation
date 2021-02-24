import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/form_validator_navigator.dart';

void main() {
  group('Annotations > Validators > FormValidatorNavigator.', () {
    test('Remote String parameter is found.', () {
      FormValidatorNavigator_StringParameterIsFound_Stub stub =
          new FormValidatorNavigator_StringParameterIsFound_Stub();
      String parameter = stub.navigator.getRemoteValidatorParameter<String>(
        defaultValue: 'azerty',
        localParameterName: 'target',
        remoteParameterName: 'target',
        formGroup: stub.control.parent,
      );
      expect(parameter, isNotNull);
      expect(parameter, 'ytreza');
    });

    test('Remote DateTime parameter is found.', () {
      FormValidatorNavigator_DateTimeParameterIsFound_Stub stub =
          new FormValidatorNavigator_DateTimeParameterIsFound_Stub();
      DateTime parameter = stub.navigator.getRemoteValidatorParameter<DateTime>(
        defaultValue: const ConstantDateTime('2021-01-01T00:00:00'),
        localParameterName: 'target',
        remoteParameterName: 'target',
        formGroup: stub.control.parent,
      );
      expect(parameter, isNotNull);
      expect(parameter, new DateTime(2021, 1, 2));
    });

    test(
        'Throws exception of FormValidatorNavigator_Throws type when default value is not a ConstantDateTime.',
        () {
      FormValidatorNavigator_ThrowsValidatorParameterExceptionOnDefaultValueIsNotConstantDateTime_Stub
          stub =
          new FormValidatorNavigator_ThrowsValidatorParameterExceptionOnDefaultValueIsNotConstantDateTime_Stub();
      expect_exception<ValidatorParameterException>(() {
        stub.navigator.getRemoteValidatorParameter<DateTime>(
          defaultValue: new DateTime(2021, 1, 1),
          localParameterName: 'target',
          remoteParameterName: 'target',
          formGroup: stub.control.parent,
        );
      }, '''Cannot get datetime from remote parameter.
            This one is not a ConstantDateTime object, its type is DateTime.
            Please, provide a ConstantDateTime object, just like this :
            @Validator(parameter: ConstantDateTime('yyyy-MM-ddTHH:mm:ssZ'))''');
    });

    test(
        'Throws exception of FormValidatorNavigator_Throws type when remote parameter name is empty.',
        () {
      FormValidatorNavigator_ThrowsValidatorParameterExceptionOnRemoteParameterNameIsEmpty_Stub
          stub =
          new FormValidatorNavigator_ThrowsValidatorParameterExceptionOnRemoteParameterNameIsEmpty_Stub();
      expect_exception<ValidatorParameterException>(() {
        stub.navigator.getRemoteValidatorParameter<DateTime>(
          defaultValue: const ConstantDateTime('2021-01-01T00:00:00'),
          localParameterName: 'target',
          remoteParameterName: '',
          formGroup: stub.control.parent,
        );
      }, 'Cannot get remote parameter with an empty parameter name.');
    });
  });
}
