import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../models/models.reflectable.dart';
import 'initializer/fake_initializer.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('Form > ReactiveForm > Parts > FormControl.', () {
    group('Getters.', () {
      test('FormPath getter works.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> child =
            root.controls['child'] as FormControl<String>;

        expect(child.formPath, 'root.controls[\'child\']');
      });

      test('ModelPath getter works.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> child =
            root.controls['child'] as FormControl<String>;

        expect(child.modelPath, 'root.child');
      });
    });

    group('setValue.', () {
      test('SetValue works.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> child =
            root.controls['child'] as FormControl<String>;

        child.setValue('azerty', validate: false);
        expect(child.value, 'azerty');
      });

      test('SetValue saves null instead of empty string.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> child =
            root.controls['child'] as FormControl<String>;

        child.setValue('', validate: false);
        expect(child.value, isNull);
      });

      test('SetValue saves DateTime.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(value: null, validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<DateTime> child =
            root.controls['child'] as FormControl<DateTime>;

        child.setValue(new DateTime(2021, 1, 1), validate: false);
        expect(child.value, new DateTime(2021, 1, 1));
      });
    });
  });
}
