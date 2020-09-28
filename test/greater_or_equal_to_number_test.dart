// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('GreaterOrEqualToNumber.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"valueToCompare" is provided by user and developer. User data has priority.',
//           () {
//         GreaterOrEqualToNumberWithUserAndDeveloperValuesTest tester =
//             new GreaterOrEqualToNumberWithUserAndDeveloperValuesTest(10, 10);
//         bool isValid = ModelState.isValid<
//             GreaterOrEqualToNumberWithUserAndDeveloperValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by user only.', () {
//         GreaterOrEqualToNumberWithUserValuesTest tester =
//             new GreaterOrEqualToNumberWithUserValuesTest(10, 10);
//         bool isValid =
//             ModelState.isValid<GreaterOrEqualToNumberWithUserValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by developer only.', () {
//         GreaterOrEqualToNumberWithDeveloperValuesTest tester =
//             new GreaterOrEqualToNumberWithDeveloperValuesTest(1);
//         bool isValid =
//             ModelState.isValid<GreaterOrEqualToNumberWithDeveloperValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is greater than value to compare.', () {
//         GreaterOrEqualToNumberTest tester =
//             new GreaterOrEqualToNumberTest(2, 1);
//         bool isValid = ModelState.isValid<GreaterOrEqualToNumberTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('The value is equal to value to compare.', () {
//         GreaterOrEqualToNumberTest tester =
//             new GreaterOrEqualToNumberTest(1, 1);
//         bool isValid = ModelState.isValid<GreaterOrEqualToNumberTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is smaller than value to compare.', () {
//         GreaterOrEqualToNumberTest tester =
//             new GreaterOrEqualToNumberTest(0, 1);
//         bool isValid = ModelState.isValid<GreaterOrEqualToNumberTest>(tester);
//         expect(isValid, false);

//         expect(
//             ModelState.errors['value'].validatorType, GreaterOrEqualToNumber);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'Value is not equal to the value to compare');
//       });
//     });
//   });
// }
