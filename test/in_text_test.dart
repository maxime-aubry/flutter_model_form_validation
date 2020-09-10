import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('InText.', () {
    group('Test the priority between user and developer static data.', () {
      test('"Text" is provided by user and developer. User data has priority.',
          () {
        InTextWithUserAndDeveloperValuesTest tester =
            new InTextWithUserAndDeveloperValuesTest(
                'father', 'I am your father !');
        bool isValid =
            ModelState.isValid<InTextWithUserAndDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"Text" is provided by user only.', () {
        InTextWithUserValuesTest tester =
            new InTextWithUserValuesTest('father', 'I am your father !');
        bool isValid = ModelState.isValid<InTextWithUserValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"Text" is provided by developer only.', () {
        InTextWithDeveloperValuesTest tester =
            new InTextWithDeveloperValuesTest('lorem');
        bool isValid =
            ModelState.isValid<InTextWithDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is contained into "text".', () {
        InTextTest tester = new InTextTest('father', 'I am your father !');
        bool isValid = ModelState.isValid<InTextTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not contained into "text".', () {
        InTextTest tester = new InTextTest('luke', 'I am your father !');
        bool isValid = ModelState.isValid<InTextTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, InText);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(
            ModelState.errors['value'].error, 'Keyword is not in the string');
      });
    });
  });
}
