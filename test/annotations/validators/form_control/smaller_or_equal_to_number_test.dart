import 'package:flutter_test/flutter_test.dart';

import 'stubs/smaller_or_equal_to_number.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > SmallerOrEqualToNumber.',
      () {
    group('Valid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        SmallerOrEqualToNumber_ValueIsSmallerThanValueToCompare_Stub stub =
            new SmallerOrEqualToNumber_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value equals valueToCompare.', () async {
        SmallerOrEqualToNumber_ValueIsEqualToValueToCompare_Stub stub =
            new SmallerOrEqualToNumber_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        SmallerOrEqualToNumber_ValueAndValueToCompareAreNull_Stub stub =
            new SmallerOrEqualToNumber_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        SmallerOrEqualToNumber_ValueIsNull_Stub stub =
            new SmallerOrEqualToNumber_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        SmallerOrEqualToNumber_ValueToCompareIsNull_Stub stub =
            new SmallerOrEqualToNumber_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is greater than valueToCompare.', () async {
        SmallerOrEqualToNumber_ValueIsGreaterThanValueToCompare_Stub stub =
            new SmallerOrEqualToNumber_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        SmallerOrEqualToNumber_remoteValueToCompareIsProvided_Stub stub =
            new SmallerOrEqualToNumber_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}