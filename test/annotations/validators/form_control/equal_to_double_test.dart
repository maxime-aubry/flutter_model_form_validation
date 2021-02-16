import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_double.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('EqualToDouble.', () {
    test('Value equals to valueToCompare.', () async {
      EqualToDouble_ValueEqualsValueToCompare_Stub stub =
          new EqualToDouble_ValueEqualsValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('Value is null.', () async {
      EqualToDouble_ValueIsNull_Stub stub =
          new EqualToDouble_ValueIsNull_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('Value does not equal to valueToCompare.', () async {
      EqualToDouble_ValueDoesNotEqualValueToCompare_Stub stub =
          new EqualToDouble_ValueDoesNotEqualValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isFalse);
    });

    test('ValueToCompare on FormControl is provided.', () async {
      EqualToDouble_ValueToCompareOnPropertyIsProvided_Stub stub =
          new EqualToDouble_ValueToCompareOnPropertyIsProvided_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });

    test('None ValueToCompare is provided.', () async {
      EqualToDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
          stub =
          new EqualToDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub();
      bool isValid = await stub.validator.isValid(stub.control);
      expect(isValid, isTrue);
    });
  });
}
