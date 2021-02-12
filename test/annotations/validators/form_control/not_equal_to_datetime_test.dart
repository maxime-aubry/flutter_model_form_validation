import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/not_equal_to_datetime.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('NotEqualToDateTime.', () {
    test(
        'NotEqualToDateTime validator returns True (reason: value is equal to valueToCompare).',
        () async {
      NotEqualToDateTime_ValueNotEqualToValueToCompare_Stub stub =
          new NotEqualToDateTime_ValueNotEqualToValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      NotEqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'NotEqualToDateTime validator returns True (reason: external valueToCompare is ok).',
        () async {
      NotEqualToDateTime_WithExternalValueToCompare_Stub stub =
          new NotEqualToDateTime_WithExternalValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      NotEqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'NotEqualToDateTime validator returns False (reason: value is equal to valueToCompare).',
        () async {
      NotEqualToDateTime_ValueEqualToValueToCompare_Stub stub =
          new NotEqualToDateTime_ValueEqualToValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      NotEqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });

    test(
        'NotEqualToDateTime validator returns False (reason: missing valueToCompare).',
        () async {
      NotEqualToDateTime_WithMissingValueToCompare_Stub stub =
          new NotEqualToDateTime_WithMissingValueToCompare_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      NotEqualToDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });
  });
}
