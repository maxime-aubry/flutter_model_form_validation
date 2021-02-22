import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_datetime.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > EqualToDateTime.',
      () {
    group('Valid.', () {
      test('value equals valueToCompare.', () async {
        EqualToDateTime_ValueIsEqualToValueToCompare_Stub stub =
            new EqualToDateTime_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        EqualToDateTime_ValueAndValueToCompareAreNull_Stub stub =
            new EqualToDateTime_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        EqualToDateTime_ValueIsNull_Stub stub =
            new EqualToDateTime_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        EqualToDateTime_ValueToCompareIsNull_Stub stub =
            new EqualToDateTime_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is smaller than valueToCompare.', () async {
        EqualToDateTime_ValueIsSmallerThanValueToCompare_Stub stub =
            new EqualToDateTime_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is greater than valueToCompare.', () async {
        EqualToDateTime_ValueIsGreaterThanValueToCompare_Stub stub =
            new EqualToDateTime_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        EqualToDateTime_remoteValueToCompareIsProvided_Stub stub =
            new EqualToDateTime_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
