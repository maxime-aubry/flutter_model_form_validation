import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_number.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > EqualToNumber.',
      () {
    group('Valid.', () {
      test('value equals valueToCompare.', () async {
        EqualToNumber_ValueIsEqualToValueToCompare_Stub stub =
            new EqualToNumber_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        EqualToNumber_ValueAndValueToCompareAreNull_Stub stub =
            new EqualToNumber_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is null.', () async {
        EqualToNumber_ValueIsNull_Stub stub =
            new EqualToNumber_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is null.', () async {
        EqualToNumber_ValueToCompareIsNull_Stub stub =
            new EqualToNumber_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is smaller than valueToCompare.', () async {
        EqualToNumber_ValueIsSmallerThanValueToCompare_Stub stub =
            new EqualToNumber_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is greater than valueToCompare.', () async {
        EqualToNumber_ValueIsGreaterThanValueToCompare_Stub stub =
            new EqualToNumber_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        EqualToNumber_remoteValueToCompareIsProvided_Stub stub =
            new EqualToNumber_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
