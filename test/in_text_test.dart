// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'models/models.dart';
// import 'models/models.reflectable.dart';

// void main() {
//   initializeReflectable();

//   group('InText.', () {
//     group('Test the priority between user and developer static data.', () {
//       test('"Text" is provided by user and developer. User data has priority.',
//           () async {
//         InTextWithUserAndDeveloperValuesTest model =
//             new InTextWithUserAndDeveloperValuesTest(
//                 'father', 'I am your father !');
//         ModelState<InTextWithUserAndDeveloperValuesTest> modelState =
//             new ModelState<InTextWithUserAndDeveloperValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('"Text" is provided by user only.', () async {
//         InTextWithUserValuesTest model =
//             new InTextWithUserValuesTest('father', 'I am your father !');
//         ModelState<InTextWithUserValuesTest> modelState =
//             new ModelState<InTextWithUserValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('"Text" is provided by developer only.', () async {
//         InTextWithDeveloperValuesTest model =
//             new InTextWithDeveloperValuesTest('lorem');
//         ModelState<InTextWithDeveloperValuesTest> modelState =
//             new ModelState<InTextWithDeveloperValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is contained into "text".', () async {
//         InTextTest model = new InTextTest('father', 'I am your father !');
//         ModelState<InTextTest> modelState = new ModelState<InTextTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is not contained into "text".', () async {
//         InTextTest model = new InTextTest('luke', 'I am your father !');
//         ModelState<InTextTest> modelState = new ModelState<InTextTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.errors['value'].validatorType, InText);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(
//             modelState.errors['value'].error, 'Keyword is not in the string');
//       });
//     });
//   });
// }
