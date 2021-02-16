import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_string.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('EqualToString.', () {
    test('Value equals to valueToCompare.', () async {
      EqualToString_ValueEqualsValueToCompare_Stub stub =
          new EqualToString_ValueEqualsValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('Value is null.', () async {
      EqualToString_ValueIsNull_Stub stub =
          new EqualToString_ValueIsNull_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('Value is empty.', () async {
      EqualToString_EmptyValue_Stub stub = new EqualToString_EmptyValue_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('Value does not equal to valueToCompare.', () async {
      EqualToString_ValueDoesNotEqualValueToCompare_Stub stub =
          new EqualToString_ValueDoesNotEqualValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isFalse);
    });

    test('ValueToCompare on FormControl is provided.', () async {
      EqualToString_ValueToCompareOnPropertyIsProvided_Stub stub =
          new EqualToString_ValueToCompareOnPropertyIsProvided_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('None ValueToCompare is provided.', () async {
      EqualToString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
          stub =
          new EqualToString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });
  });
}
