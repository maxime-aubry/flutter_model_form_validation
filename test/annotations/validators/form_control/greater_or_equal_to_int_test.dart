import 'package:flutter_test/flutter_test.dart';

import 'stubs/greater_or_equal_to_int.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > GreaterOrEqualToInt.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        GreaterOrEqualToInt_ValueIsGreaterThanValueToCompare_Stub stub =
            new GreaterOrEqualToInt_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value equals valueToCompare.', () async {
        GreaterOrEqualToInt_ValueIsEqualToValueToCompare_Stub stub =
            new GreaterOrEqualToInt_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        GreaterOrEqualToInt_ValueAndValueToCompareAreNull_Stub stub =
            new GreaterOrEqualToInt_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        GreaterOrEqualToInt_ValueIsNull_Stub stub =
            new GreaterOrEqualToInt_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        GreaterOrEqualToInt_ValueToCompareIsNull_Stub stub =
            new GreaterOrEqualToInt_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        GreaterOrEqualToInt_ValueIsSmallerThanValueToCompare_Stub stub =
            new GreaterOrEqualToInt_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        GreaterOrEqualToInt_remoteValueToCompareIsProvided_Stub stub =
            new GreaterOrEqualToInt_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
