// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('SmallerThanString.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"valueToCompare" is provided by user and developer. User data has priority.',
//           () {
//         SmallerThanStringWithUserAndDeveloperValuesTest tester =
//             new SmallerThanStringWithUserAndDeveloperValuesTest('c', 'd');
//         bool isValid =
//             ModelState.isValid<SmallerThanStringWithUserAndDeveloperValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by user only.', () {
//         SmallerThanStringWithUserValuesTest tester =
//             new SmallerThanStringWithUserValuesTest('c', 'd');
//         bool isValid =
//             ModelState.isValid<SmallerThanStringWithUserValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by developer only.', () {
//         SmallerThanStringWithDeveloperValuesTest tester =
//             new SmallerThanStringWithDeveloperValuesTest('a');
//         bool isValid =
//             ModelState.isValid<SmallerThanStringWithDeveloperValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is smaller than value to compare.', () {
//         SmallerThanStringTest tester = new SmallerThanStringTest('b', 'c');
//         bool isValid = ModelState.isValid<SmallerThanStringTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is equal to value to compare.', () {
//         SmallerThanStringTest tester = new SmallerThanStringTest('b', 'b');
//         bool isValid = ModelState.isValid<SmallerThanStringTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, SmallerThanString);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'Value is not equal to the value to compare');
//       });

//       test('The value is not equal to value to compare.', () {
//         SmallerThanStringTest tester = new SmallerThanStringTest('b', 'a');
//         bool isValid = ModelState.isValid<SmallerThanStringTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, SmallerThanString);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'Value is not equal to the value to compare');
//       });
//     });
//   });
// }
