import 'package:flutter_test/flutter_test.dart';

import 'stubs/not_equal_to_double.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > NotEqualToDouble.',
      () {
    group('Valid.', () {
      test('value is smaller than valueToCompare.', () async {
        NotEqualToDouble_ValueIsSmallerThanValueToCompare_Stub stub =
            new NotEqualToDouble_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is greater than valueToCompare.', () async {
        NotEqualToDouble_ValueIsGreaterThanValueToCompare_Stub stub =
            new NotEqualToDouble_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        NotEqualToDouble_ValueAndValueToCompareAreNull_Stub stub =
            new NotEqualToDouble_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is null.', () async {
        NotEqualToDouble_ValueIsNull_Stub stub =
            new NotEqualToDouble_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is null.', () async {
        NotEqualToDouble_ValueToCompareIsNull_Stub stub =
            new NotEqualToDouble_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is equal to valueToCompare.', () async {
        NotEqualToDouble_ValueIsEqualToValueToCompare_Stub stub =
            new NotEqualToDouble_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        NotEqualToDouble_remoteValueToCompareIsProvided_Stub stub =
            new NotEqualToDouble_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
