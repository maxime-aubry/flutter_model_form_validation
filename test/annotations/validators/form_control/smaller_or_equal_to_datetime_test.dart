import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/smaller_or_equal_to_datetime.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('SmallerOrEqualToDateTime.', () {
    test(
        'SmallerOrEqualToDateTime validator returns True (reason: value is smaller than valueToCompare).',
        () async {
      SmallerOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub stub =
          new SmallerOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      SmallerOrEqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'SmallerOrEqualToDateTime validator returns True (reason: value is equal to valueToCompare).',
        () async {
      SmallerOrEqualToDateTime_ValueIsEqualToValueToCompare_Stub stub =
          new SmallerOrEqualToDateTime_ValueIsEqualToValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      SmallerOrEqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'SmallerOrEqualToDateTime validator returns True (reason: valueToCompare is null).',
        () async {
      SmallerOrEqualToDateTime_ValueToCompareIsNull_Stub stub =
          new SmallerOrEqualToDateTime_ValueToCompareIsNull_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      SmallerOrEqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'SmallerOrEqualToDateTime validator returns False (reason: value is greater than valueToCompare).',
        () async {
      SmallerOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub stub =
          new SmallerOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      SmallerOrEqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });
  });
}
