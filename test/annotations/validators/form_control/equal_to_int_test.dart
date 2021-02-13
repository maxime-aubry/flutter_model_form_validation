import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_int.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('EqualToInt.', () {
    test('Value equals to valueToCompare.', () async {
      EqualToInt_ValueEqualsValueToCompare_Stub stub =
          new EqualToInt_ValueEqualsValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('Value is null.', () async {
      EqualToInt_NullValue_Stub stub = new EqualToInt_NullValue_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('Value does not equal to valueToCompare.', () async {
      EqualToInt_ValueDoesNotEqualValueToCompare_Stub stub =
          new EqualToInt_ValueDoesNotEqualValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isFalse);
    });

    test('ValueToCompare on FormControl is provided.', () async {
      EqualToInt_ValueToCompareOnPropertyIsProvided_Stub stub =
          new EqualToInt_ValueToCompareOnPropertyIsProvided_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('None ValueToCompare is provided.', () async {
      EqualToInt_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub stub =
          new EqualToInt_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });
  });
}
