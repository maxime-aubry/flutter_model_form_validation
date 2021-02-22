import 'package:flutter_test/flutter_test.dart';

import 'stubs/smaller_or_equal_to_datetime.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > SmallerOrEqualToDateTime.',
      () {
    group('Valid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        SmallerOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub stub =
            new SmallerOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value equals valueToCompare.', () async {
        SmallerOrEqualToDateTime_ValueIsEqualToValueToCompare_Stub stub =
            new SmallerOrEqualToDateTime_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        SmallerOrEqualToDateTime_ValueAndValueToCompareAreNull_Stub stub =
            new SmallerOrEqualToDateTime_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is null.', () async {
        SmallerOrEqualToDateTime_ValueIsNull_Stub stub =
            new SmallerOrEqualToDateTime_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is null.', () async {
        SmallerOrEqualToDateTime_ValueToCompareIsNull_Stub stub =
            new SmallerOrEqualToDateTime_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is greater than valueToCompare.', () async {
        SmallerOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub stub =
            new SmallerOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        SmallerOrEqualToDateTime_remoteValueToCompareIsProvided_Stub stub =
            new SmallerOrEqualToDateTime_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
