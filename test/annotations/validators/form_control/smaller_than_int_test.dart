import 'package:flutter_test/flutter_test.dart';

import 'stubs/smaller_than_int.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > SmallerThanInt.',
      () {
    group('Valid.', () {
      test('value is greater or equal to valueToCompare.', () async {
        SmallerThanInt_ValueIsSmallerThanValueToCompare_Stub stub =
            new SmallerThanInt_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        SmallerThanInt_ValueAndValueToCompareAreNull_Stub stub =
            new SmallerThanInt_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        SmallerThanInt_ValueIsNull_Stub stub =
            new SmallerThanInt_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        SmallerThanInt_ValueToCompareIsNull_Stub stub =
            new SmallerThanInt_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is greater than value to compare.', () async {
        SmallerThanInt_ValueIsGreaterThanValueToCompare_Stub stub =
            new SmallerThanInt_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is equal to valueToCompare.', () async {
        SmallerThanInt_ValueIsEqualToValueToCompare_Stub stub =
            new SmallerThanInt_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        SmallerThanInt_remoteValueToCompareIsProvided_Stub stub =
            new SmallerThanInt_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
