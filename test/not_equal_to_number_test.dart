// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('NotEqualToNumber.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"valueToCompare" is provided by user and developer. User data has priority.',
//           () {
//         NotEqualToNumberWithUserAndDeveloperValuesTest tester =
//             new NotEqualToNumberWithUserAndDeveloperValuesTest(10, 11);
//         bool isValid =
//             ModelState.isValid<NotEqualToNumberWithUserAndDeveloperValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by user only.', () {
//         NotEqualToNumberWithUserValuesTest tester =
//             new NotEqualToNumberWithUserValuesTest(10, 11);
//         bool isValid =
//             ModelState.isValid<NotEqualToNumberWithUserValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by developer only.', () {
//         NotEqualToNumberWithDeveloperValuesTest tester =
//             new NotEqualToNumberWithDeveloperValuesTest(2);
//         bool isValid =
//             ModelState.isValid<NotEqualToNumberWithDeveloperValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is equal to value to compare.', () {
//         NotEqualToNumberTest tester = new NotEqualToNumberTest(1, 2);
//         bool isValid = ModelState.isValid<NotEqualToNumberTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is not equal to value to compare.', () {
//         NotEqualToNumberTest tester = new NotEqualToNumberTest(1, 1);
//         bool isValid = ModelState.isValid<NotEqualToNumberTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, NotEqualToNumber);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'Value is not equal to the value to compare');
//       });
//     });
//   });
// }
