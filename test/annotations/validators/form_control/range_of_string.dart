import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../models/models.reflectable.dart';
import 'stubs/index.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('RangeOfString.', () {
    test('RangeOfString validator returns True for min string.', () async {
      RangeOfStringEqualToMinStub stub = new RangeOfStringEqualToMinStub();
      FormControl formControl = stub.getControl();
      RangeOfString validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('RangeOfString validator returns True for max string.', () async {
      RangeOfStringEqualToMaxStub stub = new RangeOfStringEqualToMaxStub();
      FormControl formControl = stub.getControl();
      RangeOfString validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('RangeOfString validator returns True for string between min and max.', () async {
      RangeOfStringBetweenMinAndMaxStub stub = new RangeOfStringBetweenMinAndMaxStub();
      FormControl formControl = stub.getControl();
      RangeOfString validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('RangeOfString validator returns True for string with external min and max.', () async {
      RangeOfStringWithExternalMinMaxStub stub = new RangeOfStringWithExternalMinMaxStub();
      FormControl formControl = stub.getControl();
      RangeOfString validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('RangeOfString validator returns False for string before min.', () async {
      RangeOfStringBeforeMinStub stub = new RangeOfStringBeforeMinStub();
      FormControl formControl = stub.getControl();
      RangeOfString validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });

    test('RangeOfString validator returns False for string after max.', () async {
      RangeOfStringAfterMaxStub stub = new RangeOfStringAfterMaxStub();
      FormControl formControl = stub.getControl();
      RangeOfString validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });

    test('RangeOfString validator returns False for invalid min and max values.', () async {
      RangeOfStringWithInvalidMinMaxStub stub = new RangeOfStringWithInvalidMinMaxStub();
      FormControl formControl = stub.getControl();
      RangeOfString validator = stub.getValidator();
      
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
