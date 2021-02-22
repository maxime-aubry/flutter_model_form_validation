import 'package:flutter_test/flutter_test.dart';

import 'stubs/not_equal_to_string.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > NotEqualToString.',
      () {
    group('Valid.', () {
      test('value is smaller than valueToCompare.', () async {
        NotEqualToString_ValueIsSmallerThanValueToCompare_Stub stub =
            new NotEqualToString_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is greater than valueToCompare.', () async {
        NotEqualToString_ValueIsGreaterThanValueToCompare_Stub stub =
            new NotEqualToString_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        NotEqualToString_ValueAndValueToCompareAreNull_Stub stub =
            new NotEqualToString_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        NotEqualToString_ValueIsNull_Stub stub =
            new NotEqualToString_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        NotEqualToString_ValueToCompareIsNull_Stub stub =
            new NotEqualToString_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is equal to valueToCompare.', () async {
        NotEqualToString_ValueIsEqualToValueToCompare_Stub stub =
            new NotEqualToString_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        NotEqualToString_remoteValueToCompareIsProvided_Stub stub =
            new NotEqualToString_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
