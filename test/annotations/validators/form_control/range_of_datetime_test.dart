import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../models/models.reflectable.dart';
import 'stubs/index.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('RangeOfDateTime.', () {
    test('RangeOfDateTime validator returns True for 2021-01-01.', () async {
      RangeOfDateTimeEqualToMinStub stub = new RangeOfDateTimeEqualToMinStub();
      FormControl formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('RangeOfDateTime validator returns True for 2021-12-31.', () async {
      RangeOfDateTimeEqualToMaxStub stub = new RangeOfDateTimeEqualToMaxStub();
      FormControl formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });
  });
}
