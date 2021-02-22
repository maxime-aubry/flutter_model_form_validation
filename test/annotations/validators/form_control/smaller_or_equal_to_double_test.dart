import 'package:flutter_test/flutter_test.dart';

import 'stubs/smaller_or_equal_to_double.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > SmallerOrEqualToDouble.',
      () {
    group('Valid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        SmallerOrEqualToDouble_ValueIsSmallerThanValueToCompare_Stub stub =
            new SmallerOrEqualToDouble_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value equals valueToCompare.', () async {
        SmallerOrEqualToDouble_ValueIsEqualToValueToCompare_Stub stub =
            new SmallerOrEqualToDouble_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        SmallerOrEqualToDouble_ValueAndValueToCompareAreNull_Stub stub =
            new SmallerOrEqualToDouble_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        SmallerOrEqualToDouble_ValueIsNull_Stub stub =
            new SmallerOrEqualToDouble_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        SmallerOrEqualToDouble_ValueToCompareIsNull_Stub stub =
            new SmallerOrEqualToDouble_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is greater than valueToCompare.', () async {
        SmallerOrEqualToDouble_ValueIsGreaterThanValueToCompare_Stub stub =
            new SmallerOrEqualToDouble_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        SmallerOrEqualToDouble_remoteValueToCompareIsProvided_Stub stub =
            new SmallerOrEqualToDouble_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
