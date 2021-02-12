import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/greater_than_datetime.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('GreaterThanDateTime.', () {
    test(
        'GreaterThanDateTime validator returns True (reason: value is greater than valueToCompare).',
        () async {
      GreaterThanDateTime_ValueIsGreaterThanValueToCompare_Stub stub =
          new GreaterThanDateTime_ValueIsGreaterThanValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      GreaterThanDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'GreaterThanDateTime validator returns True (reason: valueToCompare is null).',
        () async {
      GreaterThanDateTime_ValueToCompareIsNull_Stub stub =
          new GreaterThanDateTime_ValueToCompareIsNull_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      GreaterThanDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'GreaterThanDateTime validator returns False (reason: value is smaller than valueToCompare).',
        () async {
      GreaterThanDateTime_ValueIsSmallerThanValueToCompare_Stub stub =
          new GreaterThanDateTime_ValueIsSmallerThanValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      GreaterThanDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });
  });
}
