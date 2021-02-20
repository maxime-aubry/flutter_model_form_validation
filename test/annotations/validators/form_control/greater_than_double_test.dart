import 'package:flutter_test/flutter_test.dart';

import 'stubs/greater_than_double.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > GreaterThanDouble.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        GreaterThanDouble_ValueIsGreaterThanValueToCompare_Stub stub =
            new GreaterThanDouble_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        GreaterThanDouble_ValueAndValueToCompareAreNull_Stub stub =
            new GreaterThanDouble_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is null.', () async {
        GreaterThanDouble_ValueIsNull_Stub stub =
            new GreaterThanDouble_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is null.', () async {
        GreaterThanDouble_ValueToCompareIsNull_Stub stub =
            new GreaterThanDouble_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is smaller than valueToCompare.', () async {
        GreaterThanDouble_ValueIsSmallerThanValueToCompare_Stub stub =
            new GreaterThanDouble_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is equal to valueToCompare.', () async {
        GreaterThanDouble_ValueIsEqualToValueToCompare_Stub stub =
            new GreaterThanDouble_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        GreaterThanDouble_remoteValueToCompareIsProvided_Stub stub =
            new GreaterThanDouble_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
