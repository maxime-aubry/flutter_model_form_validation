// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('GreaterThanNumber.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"valueToCompare" is provided by user and developer. User data has priority.',
//           () {
//         GreaterThanNumberWithUserAndDeveloperValuesTest tester =
//             new GreaterThanNumberWithUserAndDeveloperValuesTest(11, 10);
//         bool isValid =
//             ModelState.isValid<GreaterThanNumberWithUserAndDeveloperValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by user only.', () {
//         GreaterThanNumberWithUserValuesTest tester =
//             new GreaterThanNumberWithUserValuesTest(11, 10);
//         bool isValid =
//             ModelState.isValid<GreaterThanNumberWithUserValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by developer only.', () {
//         GreaterThanNumberWithDeveloperValuesTest tester =
//             new GreaterThanNumberWithDeveloperValuesTest(2);
//         bool isValid =
//             ModelState.isValid<GreaterThanNumberWithDeveloperValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is greater than value to compare.', () {
//         GreaterThanNumberTest tester = new GreaterThanNumberTest(2, 1);
//         bool isValid = ModelState.isValid<GreaterThanNumberTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is equal to value to compare.', () {
//         GreaterThanNumberTest tester = new GreaterThanNumberTest(1, 1);
//         bool isValid = ModelState.isValid<GreaterThanNumberTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, GreaterThanNumber);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'Value is not equal to the value to compare');
//       });

//       test('The value is smaller than value to compare.', () {
//         GreaterThanNumberTest tester = new GreaterThanNumberTest(0, 1);
//         bool isValid = ModelState.isValid<GreaterThanNumberTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, GreaterThanNumber);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'Value is not equal to the value to compare');
//       });
//     });
//   });
// }
