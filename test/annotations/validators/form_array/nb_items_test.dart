import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../models/models.reflectable.dart';
import 'stubs/index.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('NbItems.', () {
    test('NbItems validator returns True for filled array.', () async {
      FilledArrayStub stub = new FilledArrayStub();
      FormArray formArray = stub.getControl();
      NbItems validator = stub.getValidator();
      bool isValid = await validator.isValid(formArray);
      expect(isValid, isTrue);
    });

    test(
        'NbItems validator returns True for filled array, with external min and max values.',
        () async {
      FilledArrayWithExternalMinMaxStub stub =
          new FilledArrayWithExternalMinMaxStub();
      FormArray formArray = stub.getControl();
      NbItems validator = stub.getValidator();
      bool isValid = await validator.isValid(formArray);
      expect(isValid, isTrue);
    });

    test(
        'NbItems validator returns True for filled array, with invalid min and max values.',
        () async {
      FilledArrayWithInvalidlMinMaxStub stub =
          new FilledArrayWithInvalidlMinMaxStub();
      FormArray formArray = stub.getControl();
      NbItems validator = stub.getValidator();

      expect(
        () async {
          await validator.isValid(formArray);
        },
        throwsA(
          isA<ValidationException>().having(
              (error) => error.message,
              'description',
              'NbItems validator does not accept that min value is greater than max value.'),
        ),
      );
    });

    test('NbItems validator returns True for filled array.', () async {
      FilledArrayStub stub = new FilledArrayStub();
      FormArray formArray = stub.getControl();
      NbItems validator = stub.getValidator();
      bool isValid = await validator.isValid(formArray);
      expect(isValid, isTrue);
    });

    test('NbItems validator returns False for null array.', () async {
      NullArrayStub stub = new NullArrayStub();
      FormArray formArray = stub.getControl();
      NbItems validator = stub.getValidator();
      bool isValid = await validator.isValid(formArray);
      expect(isValid, isFalse);
    });

    test('NbItems validator returns False for empty array.', () async {
      EmptyArrayStub stub = new EmptyArrayStub();
      FormArray formArray = stub.getControl();
      NbItems validator = stub.getValidator();
      bool isValid = await validator.isValid(formArray);
      expect(isValid, isFalse);
    });
  });
}
