import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_datetime.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('EqualToDateTime.', () {
    test(
        'EqualToDateTime validator returns True (reason: value is equal to valueToCompare).',
        () async {
      EqualToDateTime_ValueEqualToValueToCompare_Stub stub =
          new EqualToDateTime_ValueEqualToValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      EqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'EqualToDateTime validator returns True (reason: external valueToCompare is ok).',
        () async {
      EqualToDateTime_WithExternalValueToCompare_Stub stub =
          new EqualToDateTime_WithExternalValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      EqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'EqualToDateTime validator returns False (reason: value is not equal to valueToCompare).',
        () async {
      EqualToDateTime_ValueNotEqualToValueToCompare_Stub stub =
          new EqualToDateTime_ValueNotEqualToValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      EqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });

    test(
        'EqualToDateTime validator returns False (reason: missing valueToCompare).',
        () async {
      EqualToDateTime_WithMissingValueToCompare_Stub stub =
          new EqualToDateTime_WithMissingValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      EqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });
  });
}
