// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('GreaterOrEqualToString.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"valueToCompare" is provided by user and developer. User data has priority.',
//           () {
//         GreaterOrEqualToStringWithUserAndDeveloperValuesTest tester =
//             new GreaterOrEqualToStringWithUserAndDeveloperValuesTest('c', 'c');
//         bool isValid = ModelState.isValid<
//             GreaterOrEqualToStringWithUserAndDeveloperValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by user only.', () {
//         GreaterOrEqualToStringWithUserValuesTest tester =
//             new GreaterOrEqualToStringWithUserValuesTest('c', 'c');
//         bool isValid =
//             ModelState.isValid<GreaterOrEqualToStringWithUserValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by developer only.', () {
//         GreaterOrEqualToStringWithDeveloperValuesTest tester =
//             new GreaterOrEqualToStringWithDeveloperValuesTest('b');
//         bool isValid =
//             ModelState.isValid<GreaterOrEqualToStringWithDeveloperValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is greater than value to compare.', () {
//         GreaterOrEqualToStringTest tester =
//             new GreaterOrEqualToStringTest('c', 'b');
//         bool isValid = ModelState.isValid<GreaterOrEqualToStringTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('The value is equal to value to compare.', () {
//         GreaterOrEqualToStringTest tester =
//             new GreaterOrEqualToStringTest('b', 'b');
//         bool isValid = ModelState.isValid<GreaterOrEqualToStringTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is smaller than value to compare.', () {
//         GreaterOrEqualToStringTest tester =
//             new GreaterOrEqualToStringTest('a', 'b');
//         bool isValid = ModelState.isValid<GreaterOrEqualToStringTest>(tester);
//         expect(isValid, false);

//         expect(
//             ModelState.errors['value'].validatorType, GreaterOrEqualToString);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'Value is not equal to the value to compare');
//       });
//     });
//   });
// }
