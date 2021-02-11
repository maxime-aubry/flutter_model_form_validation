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
    test('RangeOfDateTime validator returns True for min date.', () async {
      RangeOfDateTimeEqualToMinStub stub = new RangeOfDateTimeEqualToMinStub();
      FormControl formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('RangeOfDateTime validator returns True for max date.', () async {
      RangeOfDateTimeEqualToMaxStub stub = new RangeOfDateTimeEqualToMaxStub();
      FormControl formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('RangeOfDateTime validator returns True for date between min and max.', () async {
      RangeOfDateTimeBetweenMinAndMaxStub stub = new RangeOfDateTimeBetweenMinAndMaxStub();
      FormControl formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('RangeOfDateTime validator returns True for date with external min and max.', () async {
      RangeOfDateTimeWithExternalMinMaxStub stub = new RangeOfDateTimeWithExternalMinMaxStub();
      FormControl formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('RangeOfDateTime validator returns False for date before min.', () async {
      RangeOfDateTimeBeforeMinStub stub = new RangeOfDateTimeBeforeMinStub();
      FormControl formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });

    test('RangeOfDateTime validator returns False for date after max.', () async {
      RangeOfDateTimeAfterMaxStub stub = new RangeOfDateTimeAfterMaxStub();
      FormControl formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });

    test('RangeOfDateTime validator returns False for invalid min and max values.', () async {
      RangeOfDateTimeWithInvalidMinMaxStub stub = new RangeOfDateTimeWithInvalidMinMaxStub();
      FormControl formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      
      expect(
        () async {
          await validator.isValid(formControl);
        },
        throwsA(
          isA<ValidationException>().having(
              (error) => error.message,
              'description',
              'Range validator does not accept that min value is greater than max value.'),
        ),
      );
    });
  });
}
