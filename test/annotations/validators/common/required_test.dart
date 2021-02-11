import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/required.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../models/models.reflectable.dart';
import 'stubs/required.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('Required.', () {
    group('Required validator for FormGroup.', () {
      test('Required validator returns True on FormGroup for populated array.',
          () async {
        PopulatedFormGroupStub stub = new PopulatedFormGroupStub();
        FormGroup formGroup = stub.getControl();
        Required validator = stub.getValidator();
        bool isValid = await validator.isValid(formGroup);
        expect(isValid, isTrue);
      });

      test('Required validator returns False on FormGroup for null array.',
          () async {
        NullFormGroupStub stub = new NullFormGroupStub();
        FormGroup formGroup = stub.getControl();
        Required validator = stub.getValidator();
        bool isValid = await validator.isValid(formGroup);
        expect(isValid, isFalse);
      });

      test('Required validator returns False on FormGroup for empty array.',
          () async {
        EmptyFormGroupStub stub = new EmptyFormGroupStub();
        FormGroup formGroup = stub.getControl();
        Required validator = stub.getValidator();
        bool isValid = await validator.isValid(formGroup);
        expect(isValid, isFalse);
      });
    });

    group('Required validator for FormArray.', () {
      test('Required validator returns True on FormArray for populated array.',
          () async {
        PopulatedFormArrayStub stub = new PopulatedFormArrayStub();
        FormArray formArray = stub.getControl();
        Required validator = stub.getValidator();
        bool isValid = await validator.isValid(formArray);
        expect(isValid, isTrue);
      });

      test('Required validator returns False on FormArray for null array.',
          () async {
        NullFormArrayStub stub = new NullFormArrayStub();
        FormArray formArray = stub.getControl();
        Required validator = stub.getValidator();
        bool isValid = await validator.isValid(formArray);
        expect(isValid, isFalse);
      });

      test('Required validator returns False on FormArray for empty array.',
          () async {
        EmptyFormArrayStub stub = new EmptyFormArrayStub();
        FormArray formArray = stub.getControl();
        Required validator = stub.getValidator();
        bool isValid = await validator.isValid(formArray);
        expect(isValid, isFalse);
      });
    });

    group('Required validator for FormControl.', () {
      test(
          'Required validator returns True on FormControl<String> for given value.',
          () async {
        PopulatedFormControlStub stub = new PopulatedFormControlStub();
        FormControl formControl = stub.getControl();
        Required validator = stub.getValidator();
        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
      });

      test(
          'Required validator returns False on FormControl<String> for null value.',
          () async {
        NullFormControlStub stub = new NullFormControlStub();
        FormControl formControl = stub.getControl();
        Required validator = stub.getValidator();
        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
      });

      test(
          'Required validator returns False on FormControl<String> for empty string value.',
          () async {
        EmptyFormControlStub stub = new EmptyFormControlStub();
        FormControl formControl = stub.getControl();
        Required validator = stub.getValidator();
        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
      });
    });
  });
}
