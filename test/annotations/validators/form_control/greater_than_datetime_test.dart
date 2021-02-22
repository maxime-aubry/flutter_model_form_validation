import 'package:flutter_test/flutter_test.dart';

import 'stubs/greater_than_datetime.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > GreaterThanDateTime.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        GreaterThanDateTime_ValueIsGreaterThanValueToCompare_Stub stub =
            new GreaterThanDateTime_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        GreaterThanDateTime_ValueAndValueToCompareAreNull_Stub stub =
            new GreaterThanDateTime_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        GreaterThanDateTime_ValueIsNull_Stub stub =
            new GreaterThanDateTime_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        GreaterThanDateTime_ValueToCompareIsNull_Stub stub =
            new GreaterThanDateTime_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        GreaterThanDateTime_ValueIsSmallerThanValueToCompare_Stub stub =
            new GreaterThanDateTime_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is equal to valueToCompare.', () async {
        GreaterThanDateTime_ValueIsEqualToValueToCompare_Stub stub =
            new GreaterThanDateTime_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        GreaterThanDateTime_remoteValueToCompareIsProvided_Stub stub =
            new GreaterThanDateTime_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
