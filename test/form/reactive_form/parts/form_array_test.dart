import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../models/models.reflectable.dart';
import 'stubs/form_array.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('Form > ReactiveForm > Parts > FormArray.', () {
    group('formPath.', () {
      test('FormPath accessor works.', () {
        FormArray_FormPathWorks_Stub stub = new FormArray_FormPathWorks_Stub();
        expect(stub.control.formPath, stub.path);
      });
    });

    group('modelPath.', () {
      test('ModelPath accessor works.', () {
        FormArray_ModelPathWorks_Stub stub =
            new FormArray_ModelPathWorks_Stub();
        expect(stub.control.modelPath, stub.path);
      });
    });

    group('After initialization.', () {
      test('FormArray is initialized.', () {
        FormArray_FormArrayIsInitialized_Stub stub =
            new FormArray_FormArrayIsInitialized_Stub();
        expect(stub.control.groups, isNotNull);
        expect(stub.control.groups.length, 3);
        expect(stub.control.groups[0].name, 'control1[0]');
        expect(stub.control.groups[1].name, 'control1[1]');
        expect(stub.control.groups[2].name, 'control1[2]');
      });
    });

    group('addGroup.', () {
      test('Item is added to FormArray.', () {
        FormArray_AddGroupWorks_Stub stub = new FormArray_AddGroupWorks_Stub();
        stub.control.addGroup(stub.groupToAdd, notify: false);
        expect(stub.control.groups.last, stub.groupToAdd);
      });

      test(
          'Throws an exception of FormBuilderException type when group is null.',
          () {
        FormArray_AddGroupThrowsFormBuilderExceptionOnNullGroup_Stub stub =
            new FormArray_AddGroupThrowsFormBuilderExceptionOnNullGroup_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.addGroup(stub.groupToAdd, notify: false);
        }, 'Cannot add FormGroup if this one is null.');
      });

      test(
          'Throws an exception of FormBuilderException type when group already exists.',
          () {
        FormArray_AddGroupThrowsFormBuilderExceptionOnExistingGroup_Stub stub =
            new FormArray_AddGroupThrowsFormBuilderExceptionOnExistingGroup_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.addGroup(stub.groupToAdd, notify: false);
        }, 'Cannot add FormGroup if this one is already added.');
      });
    });

    group('removeGroup.', () {
      test('First item is removed.', () {
        FormArray_RemoveFirstGroupWorks_Stub stub =
            new FormArray_RemoveFirstGroupWorks_Stub();
        stub.control.removeGroup(stub.groupToRemove, notify: false);
        bool exists = stub.control.groups.contains(stub.groupToRemove);
        expect(exists, isFalse);
        expect(stub.control.groups.length, 2);
        expect(stub.control.groups[0].name, 'control1[0]');
        expect(stub.control.groups[1].name, 'control1[1]');
      });

      test('Second item is removed.', () {
        FormArray_RemoveSecondGroupWorks_Stub stub =
            new FormArray_RemoveSecondGroupWorks_Stub();
        stub.control.removeGroup(stub.groupToRemove, notify: false);
        bool exists = stub.control.groups.contains(stub.groupToRemove);
        expect(exists, isFalse);
        expect(stub.control.groups.length, 2);
        expect(stub.control.groups[0].name, 'control1[0]');
        expect(stub.control.groups[1].name, 'control1[1]');
      });

      test('Third item is removed.', () {
        FormArray_RemoveThirdGroupWorks_Stub stub =
            new FormArray_RemoveThirdGroupWorks_Stub();
        stub.control.removeGroup(stub.groupToRemove, notify: false);
        bool exists = stub.control.groups.contains(stub.groupToRemove);
        expect(exists, isFalse);
        expect(stub.control.groups.length, 2);
        expect(stub.control.groups[0].name, 'control1[0]');
        expect(stub.control.groups[1].name, 'control1[1]');
      });

      test(
          'Throw an exception of FormBuilderException type when group is null.',
          () {
        FormArray_RemoveGroupThrowsFormBuilderExceptionOnNullGroup_Stub stub =
            new FormArray_RemoveGroupThrowsFormBuilderExceptionOnNullGroup_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.removeGroup(stub.groupToRemove, notify: false);
        }, 'Cannot add FormGroup if this one is null.');
      });

      test(
          'Throw an exception of FormBuilderException type when group is not registered.',
          () {
        FormArray_RemoveGroupThrowsFormBuilderExceptionOnNotRegisteredGroup_Stub
            stub =
            new FormArray_RemoveGroupThrowsFormBuilderExceptionOnNotRegisteredGroup_Stub();
        expect_exception<FormBuilderException>(() {
          stub.control.removeGroup(stub.groupToRemove, notify: false);
        }, 'Cannot remove FormGroup if this one is not registered.');
      });
    });
  });
}
