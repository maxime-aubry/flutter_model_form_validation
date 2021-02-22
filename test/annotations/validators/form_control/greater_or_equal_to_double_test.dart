import 'package:flutter_test/flutter_test.dart';

import 'stubs/greater_or_equal_to_double.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > GreaterOrEqualToDouble.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        GreaterOrEqualToDouble_ValueIsGreaterThanValueToCompare_Stub stub =
            new GreaterOrEqualToDouble_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value equals valueToCompare.', () async {
        GreaterOrEqualToDouble_ValueIsEqualToValueToCompare_Stub stub =
            new GreaterOrEqualToDouble_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        GreaterOrEqualToDouble_ValueAndValueToCompareAreNull_Stub stub =
            new GreaterOrEqualToDouble_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        GreaterOrEqualToDouble_ValueIsNull_Stub stub =
            new GreaterOrEqualToDouble_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        GreaterOrEqualToDouble_ValueToCompareIsNull_Stub stub =
            new GreaterOrEqualToDouble_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        GreaterOrEqualToDouble_ValueIsSmallerThanValueToCompare_Stub stub =
            new GreaterOrEqualToDouble_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        GreaterOrEqualToDouble_remoteValueToCompareIsProvided_Stub stub =
            new GreaterOrEqualToDouble_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
