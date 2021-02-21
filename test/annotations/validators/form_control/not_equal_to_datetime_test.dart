import 'package:flutter_test/flutter_test.dart';

import 'stubs/not_equal_to_datetime.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > NotEqualToDateTime.',
      () {
    group('Valid.', () {
      test('value is smaller than valueToCompare.', () async {
        NotEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub stub =
            new NotEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is greater than valueToCompare.', () async {
        NotEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub stub =
            new NotEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        NotEqualToDateTime_ValueAndValueToCompareAreNull_Stub stub =
            new NotEqualToDateTime_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is null.', () async {
        NotEqualToDateTime_ValueIsNull_Stub stub =
            new NotEqualToDateTime_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is null.', () async {
        NotEqualToDateTime_ValueToCompareIsNull_Stub stub =
            new NotEqualToDateTime_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is equal to valueToCompare.', () async {
        NotEqualToDateTime_ValueIsEqualToValueToCompare_Stub stub =
            new NotEqualToDateTime_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        NotEqualToDateTime_remoteValueToCompareIsProvided_Stub stub =
            new NotEqualToDateTime_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
