import 'package:flutter_test/flutter_test.dart';

import 'stubs/greater_than_string.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > GreaterThanString.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        GreaterThanString_ValueIsGreaterThanValueToCompare_Stub stub =
            new GreaterThanString_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        GreaterThanString_ValueAndValueToCompareAreNull_Stub stub =
            new GreaterThanString_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is null.', () async {
        GreaterThanString_ValueIsNull_Stub stub =
            new GreaterThanString_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is null.', () async {
        GreaterThanString_ValueToCompareIsNull_Stub stub =
            new GreaterThanString_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is smaller than valueToCompare.', () async {
        GreaterThanString_ValueIsSmallerThanValueToCompare_Stub stub =
            new GreaterThanString_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is equal to valueToCompare.', () async {
        GreaterThanString_ValueIsEqualToValueToCompare_Stub stub =
            new GreaterThanString_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        GreaterThanString_remoteValueToCompareIsProvided_Stub stub =
            new GreaterThanString_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
