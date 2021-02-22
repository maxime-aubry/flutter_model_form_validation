import 'package:flutter_test/flutter_test.dart';

import 'stubs/smaller_than_datetime.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > SmallerThanDateTime.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        SmallerThanDateTime_ValueIsSmallerThanValueToCompare_Stub stub =
            new SmallerThanDateTime_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        SmallerThanDateTime_ValueIsNull_Stub stub =
            new SmallerThanDateTime_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Invalid.', () {
      test('value is greater than value to compare.', () async {
        SmallerThanDateTime_ValueIsGreaterThanValueToCompare_Stub stub =
            new SmallerThanDateTime_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        SmallerThanDateTime_remoteValueToCompareIsProvided_Stub stub =
            new SmallerThanDateTime_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
