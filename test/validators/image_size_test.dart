import 'dart:io';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('ImageSize.', () {
    group('Test the validation > success.', () {
      test('Loaded file has a valid size (500px/500px min, 1000px/1000px max).',
          () async {
        File file = new File('${Directory.current.path}/assets/glycine.jpg');
        ImageSizeTest model = new ImageSizeTest(file.readAsBytesSync());
        ModelFormState formState = new ModelFormState(model: model);

        expect(await formState.validateForm(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test(
          'Loaded file has not a valid size (500px/500px min, 1000px/1000px max).',
          () async {
        File file =
            new File('${Directory.current.path}/assets/erable-japonais.png');
        ImageSizeTest model = new ImageSizeTest(file.readAsBytesSync());
        ModelFormState formState = new ModelFormState(model: model);

        expect(await formState.validateForm(), false);
        expect(formState.status, EFormStatus.invalid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, ImageSize);
        expect(error.message, 'error message here');
      });
    });
  });
}
