import 'package:flutter_test/flutter_test.dart';

import 'stubs/smaller_or_equal_to_string.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > SmallerOrEqualToString.',
      () {
    group('Valid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        SmallerOrEqualToString_ValueIsSmallerThanValueToCompare_Stub stub =
            new SmallerOrEqualToString_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value equals valueToCompare.', () async {
        SmallerOrEqualToString_ValueIsEqualToValueToCompare_Stub stub =
            new SmallerOrEqualToString_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        SmallerOrEqualToString_ValueAndValueToCompareAreNull_Stub stub =
            new SmallerOrEqualToString_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        SmallerOrEqualToString_ValueIsNull_Stub stub =
            new SmallerOrEqualToString_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        SmallerOrEqualToString_ValueToCompareIsNull_Stub stub =
            new SmallerOrEqualToString_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is greater than valueToCompare.', () async {
        SmallerOrEqualToString_ValueIsGreaterThanValueToCompare_Stub stub =
            new SmallerOrEqualToString_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        SmallerOrEqualToString_remoteValueToCompareIsProvided_Stub stub =
            new SmallerOrEqualToString_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
