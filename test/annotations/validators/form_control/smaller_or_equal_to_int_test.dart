import 'package:flutter_test/flutter_test.dart';

import 'stubs/smaller_or_equal_to_int.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > SmallerOrEqualToInt.',
      () {
    group('Valid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        SmallerOrEqualToInt_ValueIsSmallerThanValueToCompare_Stub stub =
            new SmallerOrEqualToInt_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value equals valueToCompare.', () async {
        SmallerOrEqualToInt_ValueIsEqualToValueToCompare_Stub stub =
            new SmallerOrEqualToInt_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        SmallerOrEqualToInt_ValueAndValueToCompareAreNull_Stub stub =
            new SmallerOrEqualToInt_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        SmallerOrEqualToInt_ValueIsNull_Stub stub =
            new SmallerOrEqualToInt_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        SmallerOrEqualToInt_ValueToCompareIsNull_Stub stub =
            new SmallerOrEqualToInt_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is greater than valueToCompare.', () async {
        SmallerOrEqualToInt_ValueIsGreaterThanValueToCompare_Stub stub =
            new SmallerOrEqualToInt_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        SmallerOrEqualToInt_remoteValueToCompareIsProvided_Stub stub =
            new SmallerOrEqualToInt_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
