import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_number.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('EqualToNumber.', () {
    test('Value equals to valueToCompare.', () async {
      EqualToNumber_ValueEqualsValueToCompare_Stub stub =
          new EqualToNumber_ValueEqualsValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('Value is null.', () async {
      EqualToNumber_ValueIsNull_Stub stub =
          new EqualToNumber_ValueIsNull_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('Value does not equal to valueToCompare.', () async {
      EqualToNumber_ValueDoesNotEqualValueToCompare_Stub stub =
          new EqualToNumber_ValueDoesNotEqualValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isFalse);
    });

    test('ValueToCompare on FormControl is provided.', () async {
      EqualToNumber_ValueToCompareOnPropertyIsProvided_Stub stub =
          new EqualToNumber_ValueToCompareOnPropertyIsProvided_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('None ValueToCompare is provided.', () async {
      EqualToNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
          stub =
          new EqualToNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });
  });
}
