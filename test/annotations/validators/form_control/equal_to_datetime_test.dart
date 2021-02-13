import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_datetime.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('EqualToDateTime.', () {
    test('Value equals to valueToCompare.', () async {
      EqualToDateTime_ValueEqualsValueToCompare_Stub stub =
          new EqualToDateTime_ValueEqualsValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('Value is null.', () async {
      EqualToDateTime_NullValue_Stub stub =
          new EqualToDateTime_NullValue_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('Value does not equal to valueToCompare.', () async {
      EqualToDateTime_ValueDoesNotEqualValueToCompare_Stub stub =
          new EqualToDateTime_ValueDoesNotEqualValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isFalse);
    });

    test('ValueToCompare on FormControl is provided.', () async {
      EqualToDateTime_ValueToCompareOnPropertyIsProvided_Stub stub =
          new EqualToDateTime_ValueToCompareOnPropertyIsProvided_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('None ValueToCompare is provided.', () async {
      EqualToDateTime_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub stub =
          new EqualToDateTime_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });
  });
}
