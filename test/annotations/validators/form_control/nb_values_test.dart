import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/nb_values.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > NbValues.', () {
    group('Valid.', () {
      test('Number of values is equal to min.', () async {
        NbValues_NumberOfValuesIsEqualToMin_Stub stub =
            new NbValues_NumberOfValuesIsEqualToMin_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('Number of values is equal to max.', () async {
        NbValues_NumberOfValuesIsEqualToMax_Stub stub =
            new NbValues_NumberOfValuesIsEqualToMax_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('Number of values is between min and max.', () async {
        NbValues_NumberOfValuesIsBetweenMinAndMax_Stub stub =
            new NbValues_NumberOfValuesIsBetweenMinAndMax_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        NbValues_ValueIsNull_Stub stub = new NbValues_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Invalid.', () {
      test('Number of values is smaller than min.', () async {
        NbValues_NumberOfValuesIsSmallerThanMin_Stub stub =
            new NbValues_NumberOfValuesIsSmallerThanMin_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('Number of values is smaller than max.', () async {
        NbValues_NumberOfValuesIsGreaterThanMax_Stub stub =
            new NbValues_NumberOfValuesIsGreaterThanMax_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('remoteMin is provided.', () async {
        NbValues_remoteMinIsProvided_Stub stub =
            new NbValues_remoteMinIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('remoteMax is provided.', () async {
        NbValues_remoteMaxIsProvided_Stub stub =
            new NbValues_remoteMaxIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws exception of ValidatorParameterException type when min is null.',
          () async {
        NbValues_ThrowsValidatorParameterExceptionOnNullMin_Stub stub =
            new NbValues_ThrowsValidatorParameterExceptionOnNullMin_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'min is not defined.');
      });

      test(
          'Throws exception of ValidatorParameterException type when max is null.',
          () async {
        NbValues_ThrowsValidatorParameterExceptionOnNullMax_Stub stub =
            new NbValues_ThrowsValidatorParameterExceptionOnNullMax_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'max is not defined.');
      });

      test(
          'Throws exception of ValidatorParameterException type when min is greater than max.',
          () async {
        NbValues_ThrowsValidatorParameterExceptionOnMinGreaterThanMax_Stub
            stub =
            new NbValues_ThrowsValidatorParameterExceptionOnMinGreaterThanMax_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'min value is greater than max value.');
      });
    });
  });
}
