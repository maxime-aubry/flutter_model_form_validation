import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/range_of_number.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > RangeOfNumber.',
      () {
    group('Valid.', () {
      test('value is equal to min.', () async {
        RangeOfNumber_ValueIsEqualToMin_Stub stub =
            new RangeOfNumber_ValueIsEqualToMin_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is equal to max.', () async {
        RangeOfNumber_ValueIsEqualToMax_Stub stub =
            new RangeOfNumber_ValueIsEqualToMax_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is between min and max.', () async {
        RangeOfNumber_ValueIsBetweenMinAndMax_Stub stub =
            new RangeOfNumber_ValueIsBetweenMinAndMax_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        RangeOfNumber_ValueIsNull_Stub stub =
            new RangeOfNumber_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is smaller than min.', () async {
        RangeOfNumber_ValueIsSmallerThanMin_Stub stub =
            new RangeOfNumber_ValueIsSmallerThanMin_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is greater than max.', () async {
        RangeOfNumber_ValueIsGreaterThanMax_Stub stub =
            new RangeOfNumber_ValueIsGreaterThanMax_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote min is provided.', () async {
        RangeOfNumber_remoteMinIsProvided_Stub stub =
            new RangeOfNumber_remoteMinIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('Remote max is provided.', () async {
        RangeOfNumber_remoteMaxIsProvided_Stub stub =
            new RangeOfNumber_remoteMaxIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws exception of ValidatorParameterException type when min is null.',
          () async {
        RangeOfNumber_ThrowsValidatorParameterExceptionOnNullMin_Stub stub =
            new RangeOfNumber_ThrowsValidatorParameterExceptionOnNullMin_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'min is not defined.');
      });

      test(
          'Throws exception of ValidatorParameterException type when max is null.',
          () async {
        RangeOfNumber_ThrowsValidatorParameterExceptionOnNullMax_Stub stub =
            new RangeOfNumber_ThrowsValidatorParameterExceptionOnNullMax_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'max is not defined.');
      });

      test(
          'Throws exception of ValidatorParameterException type when min is greater than max.',
          () async {
        RangeOfNumber_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub
            stub =
            new RangeOfNumber_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'min value is greater than max value.');
      });
    });
  });
}
