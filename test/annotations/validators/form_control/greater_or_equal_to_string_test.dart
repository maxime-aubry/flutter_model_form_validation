import 'package:flutter_test/flutter_test.dart';

import 'stubs/greater_or_equal_to_string.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > GreaterOrEqualToString.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        GreaterOrEqualToString_ValueIsGreaterThanValueToCompare_Stub stub =
            new GreaterOrEqualToString_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value equals valueToCompare.', () async {
        GreaterOrEqualToString_ValueIsEqualToValueToCompare_Stub stub =
            new GreaterOrEqualToString_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        GreaterOrEqualToString_ValueAndValueToCompareAreNull_Stub stub =
            new GreaterOrEqualToString_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is null.', () async {
        GreaterOrEqualToString_ValueIsNull_Stub stub =
            new GreaterOrEqualToString_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is null.', () async {
        GreaterOrEqualToString_ValueToCompareIsNull_Stub stub =
            new GreaterOrEqualToString_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is smaller than valueToCompare.', () async {
        GreaterOrEqualToString_ValueIsSmallerThanValueToCompare_Stub stub =
            new GreaterOrEqualToString_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        GreaterOrEqualToString_remoteValueToCompareIsProvided_Stub stub =
            new GreaterOrEqualToString_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
