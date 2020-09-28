// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('EqualToString.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"valueToCompare" is provided by user and developer. User data has priority.',
//           () {
//         EqualToStringWithUserAndDeveloperValuesTest tester =
//             new EqualToStringWithUserAndDeveloperValuesTest('a', 'a');
//         bool isValid =
//             ModelState.isValid<EqualToStringWithUserAndDeveloperValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by user only.', () {
//         EqualToStringWithUserValuesTest tester =
//             new EqualToStringWithUserValuesTest('a', 'a');
//         bool isValid =
//             ModelState.isValid<EqualToStringWithUserValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by developer only.', () {
//         EqualToStringWithDeveloperValuesTest tester =
//             new EqualToStringWithDeveloperValuesTest('b');
//         bool isValid =
//             ModelState.isValid<EqualToStringWithDeveloperValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is equal to value to compare.', () {
//         EqualToStringTest tester = new EqualToStringTest('a', 'a');
//         bool isValid = ModelState.isValid<EqualToStringTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is not equal to value to compare.', () {
//         EqualToStringTest tester = new EqualToStringTest('a', 'b');
//         bool isValid = ModelState.isValid<EqualToStringTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, EqualToString);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'Value is not equal to the value to compare');
//       });
//     });
//   });
// }
