import 'package:flutter_test/flutter_test.dart';

import 'stubs/greater_or_equal_to_number.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > GreaterOrEqualToNumber.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        GreaterOrEqualToNumber_ValueIsGreaterThanValueToCompare_Stub stub =
            new GreaterOrEqualToNumber_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value equals valueToCompare.', () async {
        GreaterOrEqualToNumber_ValueIsEqualToValueToCompare_Stub stub =
            new GreaterOrEqualToNumber_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        GreaterOrEqualToNumber_ValueAndValueToCompareAreNull_Stub stub =
            new GreaterOrEqualToNumber_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        GreaterOrEqualToNumber_ValueIsNull_Stub stub =
            new GreaterOrEqualToNumber_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        GreaterOrEqualToNumber_ValueToCompareIsNull_Stub stub =
            new GreaterOrEqualToNumber_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        GreaterOrEqualToNumber_ValueIsSmallerThanValueToCompare_Stub stub =
            new GreaterOrEqualToNumber_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        GreaterOrEqualToNumber_remoteValueToCompareIsProvided_Stub stub =
            new GreaterOrEqualToNumber_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
