import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../models/models.reflectable.dart';
import 'stubs/form_group.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('Form > ReactiveForm > Parts > FormGroup.', () {
    group('formPath.', () {
      test('FormPath accessor works.', () {
        FormGroup_FormPathWorks_Stub stub = new FormGroup_FormPathWorks_Stub();
        FormGroup target = stub.control.getFormGroup(stub.key);
        expect(target.formPath, stub.path);
      });
    });

    group('modelPath.', () {
      test('ModelPath accessor works.', () {
        FormGroup_ModelPathWorks_Stub stub =
            new FormGroup_ModelPathWorks_Stub();
        FormGroup target = stub.control.getFormGroup(stub.key);
        expect(target.modelPath, stub.path);
      });
    });

    group('containsControl.', () {
      test('Control is found using by key.', () {
        FormGroup_ContainsControlFindControlByKey_Stub stub =
            new FormGroup_ContainsControlFindControlByKey_Stub();
        bool exists = stub.control.containsControl(stub.key);
        expect(exists, isTrue);
      });

      test('Control is not found using by key.', () {
        FormGroup_ContainsControlDoesNotFindControlByKey_Stub stub =
            new FormGroup_ContainsControlDoesNotFindControlByKey_Stub();
        bool exists = stub.control.containsControl(stub.key);
        expect(exists, isFalse);
      });

      test(
          'Throws an exception of FormGroup_FormBuilderException type when name is null.',
          () {
        FormGroup_ContainsControlThrowsFormBuilderExceptionOnNullName_Stub
            stub =
            new FormGroup_ContainsControlThrowsFormBuilderExceptionOnNullName_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.containsControl(stub.key);
        }, 'Cannot check if control does exist if its name is not provided.');
      });

      test(
          'Throws an exception of FormGroup_FormBuilderException type when name is empty.',
          () {
        FormGroup_ContainsControlThrowsFormBuilderExceptionOnEmptyName_Stub
            stub =
            new FormGroup_ContainsControlThrowsFormBuilderExceptionOnEmptyName_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.containsControl(stub.key);
        }, 'Cannot check if control does exist if its name is not provided.');
      });
    });

    group('addControl.', () {
      test('Control is added.', () {
        FormGroup_AddControlWorks_Stub stub =
            new FormGroup_AddControlWorks_Stub();
        stub.control.addControl(stub.key, stub.controlToAdd);
        bool isRegistered = stub.control.containsControl(stub.key);
        expect(isRegistered, isTrue);
      });

      test(
          'Throws an exception of FormBuilderException type when name is null.',
          () {
        FormGroup_AddControlThrowsFormBuilderExceptionOnNullName_Stub stub =
            new FormGroup_AddControlThrowsFormBuilderExceptionOnNullName_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.addControl(stub.key, stub.controlToAdd);
        }, 'Cannot add control if its name is not provided.');
      });

      test(
          'Throws an exception of FormBuilderException type when name is empty.',
          () {
        FormGroup_AddControlThrowsFormBuilderExceptionOnEmptyName_Stub stub =
            new FormGroup_AddControlThrowsFormBuilderExceptionOnEmptyName_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.addControl(stub.key, stub.controlToAdd);
        }, 'Cannot add control if its name is not provided.');
      });

      test(
          'Throws an exception of FormBuilderException type when control is null.',
          () {
        FormGroup_AddControlThrowsFormBuilderExceptionOnNullControl_Stub stub =
            new FormGroup_AddControlThrowsFormBuilderExceptionOnNullControl_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.addControl(stub.key, stub.controlToAdd);
        }, 'Cannot add control if this one is null.');
      });

      test(
          'Throws an exception of FormBuilderException type when key does already exist.',
          () {
        FormGroup_AddControlFormBuilderExceptionOnExistingKey_Stub stub =
            new FormGroup_AddControlFormBuilderExceptionOnExistingKey_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.addControl(stub.key, stub.controlToAdd);
        }, 'Cannot add control if this one is already added.');
      });
    });

    group('removeControl.', () {
      test('Control is removed.', () {
        FormGroup_RemoveControlWorks_Stub stub =
            new FormGroup_RemoveControlWorks_Stub();
        stub.control.removeControl(stub.key);
        bool isRegistered = stub.control.containsControl(stub.key);
        expect(isRegistered, isFalse);
      });

      test(
          'Throws an exception of FormBuilderException type when name is null.',
          () {
        FormGroup_RemoveControlThrowsFormBuilderExceptionOnNullName_Stub stub =
            new FormGroup_RemoveControlThrowsFormBuilderExceptionOnNullName_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.removeControl(stub.key);
        }, 'Cannot remove control if its name is not provided.');
      });

      test(
          'Throws an exception of FormBuilderException type when name is empty.',
          () {
        FormGroup_RemoveControlThrowsFormBuilderExceptionOnEmptyName_Stub stub =
            new FormGroup_RemoveControlThrowsFormBuilderExceptionOnEmptyName_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.removeControl(stub.key);
        }, 'Cannot remove control if its name is not provided.');
      });

      test(
          'Throws an exception of FormBuilderException type when control is not registered.',
          () {
        FormGroup_RemoveControlThrowsFormBuilderExceptionOnNotRegisteredControl_Stub
            stub =
            new FormGroup_RemoveControlThrowsFormBuilderExceptionOnNotRegisteredControl_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.removeControl(stub.key);
        }, 'Cannot remove control if this one is not registered.');
      });
    });

    group('getFormGroup.', () {
      test('FormGroup is found.', () {
        FormGroup_GetFormGroupWorks_Stub stub =
            new FormGroup_GetFormGroupWorks_Stub();
        FormGroup formGroup = stub.control.getFormGroup(stub.key);
        expect(formGroup, isNotNull);
      });

      test(
          'Throws an exception of FormBuilderException type when control is not found.',
          () {
        FormGroup_GetFormGroupThrowsFormBuilderExceptionOnControlNotFound_Stub
            stub =
            new FormGroup_GetFormGroupThrowsFormBuilderExceptionOnControlNotFound_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.getFormGroup(stub.key);
        }, 'FormGroup not found.');
      });

      test(
          'Throws an exception of FormBuilderException type when key does exist but control has a bad type.',
          () {
        FormGroup_GetFormGroupThrowsFormBuilderExceptionOnBadType_Stub stub =
            new FormGroup_GetFormGroupThrowsFormBuilderExceptionOnBadType_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.getFormGroup(stub.key);
        }, 'Control is not of FormGroup type.');
      });
    });

    group('getFormArray', () {
      test('FormArray is found.', () {
        FormGroup_GetFormArrayWorks_Stub stub =
            new FormGroup_GetFormArrayWorks_Stub();
        FormArray formArray = stub.control.getFormArray(stub.key);
        expect(formArray, isNotNull);
      });

      test(
          'Throws an exception of FormBuilderException type when control is not found.',
          () {
        FormGroup_GetFormArrayThrowsFormBuilderExceptionOnControlNotFound_Stub
            stub =
            new FormGroup_GetFormArrayThrowsFormBuilderExceptionOnControlNotFound_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.getFormArray(stub.key);
        }, 'FormArray not found.');
      });

      test(
          'Throws an exception of FormBuilderException type when key does exist but control has a bad type.',
          () {
        FormGroup_GetFormArrayThrowsFormBuilderExceptionOnBadType_Stub stub =
            new FormGroup_GetFormArrayThrowsFormBuilderExceptionOnBadType_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.getFormArray(stub.key);
        }, 'Control is not of FormArray type.');
      });
    });

    group('getFormControl', () {
      test('FormControl is found.', () {
        FormGroup_GetFormControlWorks_Stub stub =
            new FormGroup_GetFormControlWorks_Stub();
        FormControl formControl = stub.control.getFormControl<String>(stub.key);
        expect(formControl, isNotNull);
      });

      test(
          'Throws an exception of FormBuilderException type when control is not found.',
          () {
        FormGroup_GetFormControlThrowsFormBuilderExceptionOnControlNotFound_Stub
            stub =
            new FormGroup_GetFormControlThrowsFormBuilderExceptionOnControlNotFound_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.getFormControl<String>(stub.key);
        }, 'FormControl not found.');
      });

      test(
          'Throws an exception of FormBuilderException type when key does exist but control has a bad type.',
          () {
        FormGroup_GetFormControlThrowsFormBuilderExceptionOnBadType_Stub stub =
            new FormGroup_GetFormControlThrowsFormBuilderExceptionOnBadType_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.getFormControl<int>(stub.key);
        }, 'Control is not of FormControl<int> type.');
      });
    });
  });
}
