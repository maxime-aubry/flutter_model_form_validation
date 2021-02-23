import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../models/models.reflectable.dart';
import 'stubs/form_control.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('Form > ReactiveForm > Parts > FormControl.', () {
    group('formPath.', () {
      test('FormPath accessor works.', () {
        FormControl_FormPathWorks_Stub stub =
            new FormControl_FormPathWorks_Stub();
        expect(stub.control.formPath, stub.path);
      });
    });

    group('modelPath.', () {
      test('ModelPath accessor works.', () {
        FormControl_ModelPathWorks_Stub stub =
            new FormControl_ModelPathWorks_Stub();
        expect(stub.control.modelPath, stub.path);
      });
    });

    group('setValue.', () {
      test('SetValue works.', () {
        FormControl_SetValueWorks_Stub stub =
            new FormControl_SetValueWorks_Stub();
        stub.control.setValue(stub.value, validate: false);
        expect(stub.control.value, stub.value);
      });

      test('SetValue save null instead of empty string.', () {
        FormControl_SetValueEmptyStringBecomeNull_Stub stub =
            new FormControl_SetValueEmptyStringBecomeNull_Stub();
        stub.control.setValue(stub.value, validate: false);
        expect(stub.control.value, isNull);
      });

      test('SetValue save DateTime.', () {
        FormControl_SetValueDateTimeValueIsSaved_Stub stub =
            new FormControl_SetValueDateTimeValueIsSaved_Stub();
        stub.control.setValue(stub.value, validate: false);
        expect(stub.control.value, stub.value);
      });
    });
  });
}
