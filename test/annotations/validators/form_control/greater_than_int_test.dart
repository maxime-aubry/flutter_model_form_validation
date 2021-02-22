import 'package:flutter_test/flutter_test.dart';

import 'stubs/greater_than_int.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > GreaterThanInt.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        GreaterThanInt_ValueIsGreaterThanValueToCompare_Stub stub =
            new GreaterThanInt_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        GreaterThanInt_ValueAndValueToCompareAreNull_Stub stub =
            new GreaterThanInt_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        GreaterThanInt_ValueIsNull_Stub stub =
            new GreaterThanInt_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        GreaterThanInt_ValueToCompareIsNull_Stub stub =
            new GreaterThanInt_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        GreaterThanInt_ValueIsSmallerThanValueToCompare_Stub stub =
            new GreaterThanInt_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is equal to valueToCompare.', () async {
        GreaterThanInt_ValueIsEqualToValueToCompare_Stub stub =
            new GreaterThanInt_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        GreaterThanInt_remoteValueToCompareIsProvided_Stub stub =
            new GreaterThanInt_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
