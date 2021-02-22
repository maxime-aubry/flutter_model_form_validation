import 'package:flutter_test/flutter_test.dart';

import 'stubs/smaller_than_double.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > SmallerThanDouble.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        SmallerThanDouble_ValueIsSmallerThanValueToCompare_Stub stub =
            new SmallerThanDouble_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        SmallerThanDouble_ValueIsNull_Stub stub =
            new SmallerThanDouble_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Invalid.', () {
      test('value is greater than value to compare.', () async {
        SmallerThanDouble_ValueIsGreaterThanValueToCompare_Stub stub =
            new SmallerThanDouble_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        SmallerThanDouble_remoteValueToCompareIsProvided_Stub stub =
            new SmallerThanDouble_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
