import 'package:flutter_test/flutter_test.dart';

import 'stubs/not_equal_to_number.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > NotEqualToNumber.',
      () {
    group('Valid.', () {
      test('value is smaller than valueToCompare.', () async {
        NotEqualToNumber_ValueIsSmallerThanValueToCompare_Stub stub =
            new NotEqualToNumber_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is greater than valueToCompare.', () async {
        NotEqualToNumber_ValueIsGreaterThanValueToCompare_Stub stub =
            new NotEqualToNumber_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        NotEqualToNumber_ValueAndValueToCompareAreNull_Stub stub =
            new NotEqualToNumber_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        NotEqualToNumber_ValueIsNull_Stub stub =
            new NotEqualToNumber_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        NotEqualToNumber_ValueToCompareIsNull_Stub stub =
            new NotEqualToNumber_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is equal to valueToCompare.', () async {
        NotEqualToNumber_ValueIsEqualToValueToCompare_Stub stub =
            new NotEqualToNumber_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        NotEqualToNumber_remoteValueToCompareIsProvided_Stub stub =
            new NotEqualToNumber_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
