import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('InText.', () {
    group('Test the priority between user and developer static data.', () {
      test('"Text" is provided by user and developer. User data has priority.',
          () async {
        InTextWithUserAndDeveloperValuesTest model =
            new InTextWithUserAndDeveloperValuesTest(
                'father', 'I am your father !');
        ModelFormState<InTextWithUserAndDeveloperValuesTest> modelState =
            new ModelFormState<InTextWithUserAndDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"Text" is provided by user only.', () async {
        InTextWithUserValuesTest model =
            new InTextWithUserValuesTest('father', 'I am your father !');
        ModelFormState<InTextWithUserValuesTest> modelState =
            new ModelFormState<InTextWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"Text" is provided by developer only.', () async {
        InTextWithDeveloperValuesTest model =
            new InTextWithDeveloperValuesTest('lorem');
        ModelFormState<InTextWithDeveloperValuesTest> modelState =
            new ModelFormState<InTextWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
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
        ValidationError error = modelState.getError(model.getListenerName('value'));
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
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, InText);
        expect(error.message, 'error message here');
      });
    });
  });
}
