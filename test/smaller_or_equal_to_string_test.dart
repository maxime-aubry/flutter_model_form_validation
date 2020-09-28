// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('SmallerOrEqualToString.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"valueToCompare" is provided by user and developer. User data has priority.',
//           () {
//         SmallerOrEqualToStringWithUserAndDeveloperValuesTest tester =
//             new SmallerOrEqualToStringWithUserAndDeveloperValuesTest('c', 'c');
//         bool isValid = ModelState.isValid<
//             SmallerOrEqualToStringWithUserAndDeveloperValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by user only.', () {
//         SmallerOrEqualToStringWithUserValuesTest tester =
//             new SmallerOrEqualToStringWithUserValuesTest('c', 'c');
//         bool isValid =
//             ModelState.isValid<SmallerOrEqualToStringWithUserValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by developer only.', () {
//         SmallerOrEqualToStringWithDeveloperValuesTest tester =
//             new SmallerOrEqualToStringWithDeveloperValuesTest('b');
//         bool isValid =
//             ModelState.isValid<SmallerOrEqualToStringWithDeveloperValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is smaller than value to compare.', () {
//         SmallerOrEqualToStringTest tester =
//             new SmallerOrEqualToStringTest('b', 'c');
//         bool isValid = ModelState.isValid<SmallerOrEqualToStringTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('The value is equal to value to compare.', () {
//         SmallerOrEqualToStringTest tester =
//             new SmallerOrEqualToStringTest('b', 'b');
//         bool isValid = ModelState.isValid<SmallerOrEqualToStringTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is greater than value to compare.', () {
//         SmallerOrEqualToStringTest tester =
//             new SmallerOrEqualToStringTest('b', 'a');
//         bool isValid = ModelState.isValid<SmallerOrEqualToStringTest>(tester);
//         expect(isValid, false);

//         expect(
//             ModelState.errors['value'].validatorType, SmallerOrEqualToString);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'Value is not equal to the value to compare');
//       });
//     });
//   });
// }
