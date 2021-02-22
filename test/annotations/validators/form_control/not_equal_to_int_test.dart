import 'package:flutter_test/flutter_test.dart';

import 'stubs/not_equal_to_int.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > NotEqualToInt.',
      () {
    group('Valid.', () {
      test('value is smaller than valueToCompare.', () async {
        NotEqualToInt_ValueIsSmallerThanValueToCompare_Stub stub =
            new NotEqualToInt_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is greater than valueToCompare.', () async {
        NotEqualToInt_ValueIsGreaterThanValueToCompare_Stub stub =
            new NotEqualToInt_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        NotEqualToInt_ValueAndValueToCompareAreNull_Stub stub =
            new NotEqualToInt_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        NotEqualToInt_ValueIsNull_Stub stub =
            new NotEqualToInt_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        NotEqualToInt_ValueToCompareIsNull_Stub stub =
            new NotEqualToInt_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is equal to valueToCompare.', () async {
        NotEqualToInt_ValueIsEqualToValueToCompare_Stub stub =
            new NotEqualToInt_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        NotEqualToInt_remoteValueToCompareIsProvided_Stub stub =
            new NotEqualToInt_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
