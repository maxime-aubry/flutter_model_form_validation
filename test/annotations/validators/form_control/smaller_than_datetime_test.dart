import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/smaller_than_datetime.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('SmallerThanDateTime.', () {
    test(
        'SmallerThanDateTime validator returns True (reason: value is smaller than valueToCompare).',
        () async {
      SmallerThanDateTime_ValueIsSmallerThanValueToCompare_Stub stub =
          new SmallerThanDateTime_ValueIsSmallerThanValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      SmallerThanDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'SmallerThanDateTime validator returns True (reason: valueToCompare is null).',
        () async {
      SmallerThanDateTime_ValueToCompareIsNull_Stub stub =
          new SmallerThanDateTime_ValueToCompareIsNull_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      SmallerThanDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'SmallerThanDateTime validator returns False (reason: value is greater than valueToCompare).',
        () async {
      SmallerThanDateTime_ValueIsGreaterThanValueToCompare_Stub stub =
          new SmallerThanDateTime_ValueIsGreaterThanValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      SmallerThanDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });
  });
}
