import 'package:flutter_test/flutter_test.dart';

import 'stubs/smaller_than_string.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > SmallerThanString.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        SmallerThanString_ValueIsSmallerThanValueToCompare_Stub stub =
            new SmallerThanString_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        SmallerThanString_ValueAndValueToCompareAreNull_Stub stub =
            new SmallerThanString_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        SmallerThanString_ValueIsNull_Stub stub =
            new SmallerThanString_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        SmallerThanString_ValueToCompareIsNull_Stub stub =
            new SmallerThanString_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is greater than value to compare.', () async {
        SmallerThanString_ValueIsGreaterThanValueToCompare_Stub stub =
            new SmallerThanString_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is equal to valueToCompare.', () async {
        SmallerThanString_ValueIsEqualToValueToCompare_Stub stub =
            new SmallerThanString_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        SmallerThanString_remoteValueToCompareIsProvided_Stub stub =
            new SmallerThanString_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
