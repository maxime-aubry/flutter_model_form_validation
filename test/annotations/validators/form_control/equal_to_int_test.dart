import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_int.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > EqualToInt.', () {
    group('Valid.', () {
      test('value equals valueToCompare.', () async {
        EqualToInt_ValueIsEqualToValueToCompare_Stub stub =
            new EqualToInt_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        EqualToInt_ValueAndValueToCompareAreNull_Stub stub =
            new EqualToInt_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is null.', () async {
        EqualToInt_ValueIsNull_Stub stub = new EqualToInt_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is null.', () async {
        EqualToInt_ValueToCompareIsNull_Stub stub =
            new EqualToInt_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is smaller than valueToCompare.', () async {
        EqualToInt_ValueIsSmallerThanValueToCompare_Stub stub =
            new EqualToInt_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is greater than valueToCompare.', () async {
        EqualToInt_ValueIsGreaterThanValueToCompare_Stub stub =
            new EqualToInt_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        EqualToInt_remoteValueToCompareIsProvided_Stub stub =
            new EqualToInt_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
