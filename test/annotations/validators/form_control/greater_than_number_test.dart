import 'package:flutter_test/flutter_test.dart';

import 'stubs/greater_than_number.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > GreaterThanNumber.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        GreaterThanNumber_ValueIsGreaterThanValueToCompare_Stub stub =
            new GreaterThanNumber_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        GreaterThanNumber_ValueAndValueToCompareAreNull_Stub stub =
            new GreaterThanNumber_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        GreaterThanNumber_ValueIsNull_Stub stub =
            new GreaterThanNumber_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        GreaterThanNumber_ValueToCompareIsNull_Stub stub =
            new GreaterThanNumber_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        GreaterThanNumber_ValueIsSmallerThanValueToCompare_Stub stub =
            new GreaterThanNumber_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is equal to valueToCompare.', () async {
        GreaterThanNumber_ValueIsEqualToValueToCompare_Stub stub =
            new GreaterThanNumber_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        GreaterThanNumber_remoteValueToCompareIsProvided_Stub stub =
            new GreaterThanNumber_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
