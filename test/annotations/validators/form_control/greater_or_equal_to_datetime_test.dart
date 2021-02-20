import 'package:flutter_test/flutter_test.dart';

import 'stubs/greater_or_equal_to_datetime.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > GreaterOrEqualToDateTime.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        GreaterOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub stub =
            new GreaterOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value equals valueToCompare.', () async {
        GreaterOrEqualToDateTime_ValueIsEqualToValueToCompare_Stub stub =
            new GreaterOrEqualToDateTime_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        GreaterOrEqualToDateTime_ValueAndValueToCompareAreNull_Stub stub =
            new GreaterOrEqualToDateTime_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is null.', () async {
        GreaterOrEqualToDateTime_ValueIsNull_Stub stub =
            new GreaterOrEqualToDateTime_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is null.', () async {
        GreaterOrEqualToDateTime_ValueToCompareIsNull_Stub stub =
            new GreaterOrEqualToDateTime_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is smaller than valueToCompare.', () async {
        GreaterOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub stub =
            new GreaterOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        GreaterOrEqualToDateTime_remoteValueToCompareIsProvided_Stub stub =
            new GreaterOrEqualToDateTime_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
