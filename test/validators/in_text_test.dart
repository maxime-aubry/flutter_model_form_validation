import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('InText.', () {
    group('Test the priority between user and developer static data.', () {
      test('"Text" is provided by user and developer. User data has priority.',
          () async {
        InTextTest model = new InTextTest('father', 'I am your father !');
        ModelFormState<InTextTest> modelState =
            new ModelFormState<InTextTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });

      test('"Text" is provided by user only.', () async {
        InTextTest model = new InTextTest('father', 'I am your father !');
        ModelFormState<InTextTest> modelState =
            new ModelFormState<InTextTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });

      test('"Text" is provided by developer only.', () async {
        InTextTest model = new InTextTest('lorem');
        ModelFormState<InTextTest> modelState =
            new ModelFormState<InTextTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is contained into "text".', () async {
        InTextTest model = new InTextTest('father', 'I am your father !');
        ModelFormState<InTextTest> modelState =
            new ModelFormState<InTextTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not contained into "text".', () async {
        InTextTest model = new InTextTest('luke', 'I am your father !');
        ModelFormState<InTextTest> modelState =
            new ModelFormState<InTextTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, InText);
        expect(error.message, 'error message here');
      });
    });
  });
}
