import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_double.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > EqualToDouble.',
      () {
    group('Valid.', () {
      test('value equals valueToCompare.', () async {
        EqualToDouble_ValueEqualsValueToCompare_Stub stub =
            new EqualToDouble_ValueEqualsValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        EqualToDouble_ValueAndValueToCompareAreNull_Stub stub =
            new EqualToDouble_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is null.', () async {
        EqualToDouble_ValueIsNull_Stub stub =
            new EqualToDouble_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is null.', () async {
        EqualToDouble_ValueToCompareIsNull_Stub stub =
            new EqualToDouble_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value does not equal valueToCompare.', () async {
        EqualToDouble_ValueDoesNotEqualValueToCompare_Stub stub =
            new EqualToDouble_ValueDoesNotEqualValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remot valueToCompare is provided.', () async {
        EqualToDouble_remoteValueToCompareIsProvided_Stub stub =
            new EqualToDouble_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
