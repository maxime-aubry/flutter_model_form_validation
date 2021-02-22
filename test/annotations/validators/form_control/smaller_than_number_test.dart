import 'package:flutter_test/flutter_test.dart';

import 'stubs/smaller_than_number.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > SmallerThanNumber.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        SmallerThanNumber_ValueIsSmallerThanValueToCompare_Stub stub =
            new SmallerThanNumber_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        SmallerThanNumber_ValueIsNull_Stub stub =
            new SmallerThanNumber_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Invalid.', () {
      test('value is greater than value to compare.', () async {
        SmallerThanNumber_ValueIsGreaterThanValueToCompare_Stub stub =
            new SmallerThanNumber_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        SmallerThanNumber_remoteValueToCompareIsProvided_Stub stub =
            new SmallerThanNumber_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
