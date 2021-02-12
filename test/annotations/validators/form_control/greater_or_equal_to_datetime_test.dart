import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/greater_or_equal_to_datetime.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('GreaterOrEqualToDateTime.', () {
    test(
        'GreaterOrEqualToDateTime validator returns True (reason: value is greater than valueToCompare).',
        () async {
      GreaterOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub stub =
          new GreaterOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      GreaterOrEqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });
    
    test(
        'GreaterOrEqualToDateTime validator returns True (reason: value is equal to valueToCompare).',
        () async {
      GreaterOrEqualToDateTime_ValueIsEqualToValueToCompare_Stub stub =
          new GreaterOrEqualToDateTime_ValueIsEqualToValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      GreaterOrEqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });
    
    test(
        'GreaterOrEqualToDateTime validator returns True (reason: valueToCompare is null).',
        () async {
      GreaterOrEqualToDateTime_ValueToCompareIsNull_Stub stub =
          new GreaterOrEqualToDateTime_ValueToCompareIsNull_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      GreaterOrEqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });
    
    test(
        'GreaterOrEqualToDateTime validator returns False (reason: value is smaller than valueToCompare).',
        () async {
      GreaterOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub stub =
          new GreaterOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      GreaterOrEqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });
  });
}
