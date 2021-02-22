import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_double.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > EqualToDouble.',
      () {
    group('Valid.', () {
      test('value equals valueToCompare.', () async {
        EqualToDouble_ValueIsEqualToValueToCompare_Stub stub =
            new EqualToDouble_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        EqualToDouble_ValueAndValueToCompareAreNull_Stub stub =
            new EqualToDouble_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        EqualToDouble_ValueIsNull_Stub stub =
            new EqualToDouble_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        EqualToDouble_ValueToCompareIsNull_Stub stub =
            new EqualToDouble_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is smaller than valueToCompare.', () async {
        EqualToDouble_ValueIsSmallerThanValueToCompare_Stub stub =
            new EqualToDouble_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is greater than valueToCompare.', () async {
        EqualToDouble_ValueIsGreaterThanValueToCompare_Stub stub =
            new EqualToDouble_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        EqualToDouble_remoteValueToCompareIsProvided_Stub stub =
            new EqualToDouble_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
