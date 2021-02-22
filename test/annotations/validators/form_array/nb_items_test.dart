import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/nb_items.dart';

void main() {
  group('Annotations > Validators > FormArray > NbItems.', () {
    group('Valid.', () {
      test('FormArray items size is equal to min.', () async {
        NbItems_ArraySizeIsEqualToMin_Stub stub =
            new NbItems_ArraySizeIsEqualToMin_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('FormArray items size is equal to max.', () async {
        NbItems_ArraySizeIsEqualToMax_Stub stub =
            new NbItems_ArraySizeIsEqualToMax_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('FormArray items size is between min and max.', () async {
        NbItems_ArraySizeIsBetweenMinAndMax_Stub stub =
            new NbItems_ArraySizeIsBetweenMinAndMax_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('FormArray items is null.', () async {
        NbItems_ArrayIsNull_Stub stub = new NbItems_ArrayIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('FormArray items size is smaller than min.', () async {
        NbItems_ArraySizeIsSmallerThanMin_Stub stub =
            new NbItems_ArraySizeIsSmallerThanMin_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('FormArray items size is smaller than max.', () async {
        NbItems_ArraySizeIsGreaterThanMax_Stub stub =
            new NbItems_ArraySizeIsGreaterThanMax_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('remoteMin is provided. Its value override the one of min.',
          () async {
        NbItems_MinOnProrpertyIsProvided_Stub stub =
            new NbItems_MinOnProrpertyIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('remoteMax is provided. Its value override the one of max.',
          () async {
        NbItems_MaxOnProrpertyIsProvided_Stub stub =
            new NbItems_MaxOnProrpertyIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Throws exception on parameters.', () {
      test(
          'Validator throws an exception because min is not provided, using by min and remoteMin.',
          () async {
        NbItems_ThrowsValidatorParameterExceptionOnNullMin_Stub stub =
            new NbItems_ThrowsValidatorParameterExceptionOnNullMin_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'Min is not defined.');
      });

      test(
          'Validator throws an exception because max is not provided, using by max and remoteMax.',
          () async {
        NbItems_ThrowsValidatorParameterExceptionOnNullMax_Stub stub =
            new NbItems_ThrowsValidatorParameterExceptionOnNullMax_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'Max is not defined.');
      });

      test('Validator throws an exception because min is greater than max.',
          () async {
        NbItems_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub
            stub =
            new NbItems_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'NbItems validator does not accept that min value is greater than max value.');
      });
    });
  });
}
