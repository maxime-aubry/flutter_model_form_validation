// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('SmallerThanDatetime.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"valueToCompare" is provided by user and developer. User data has priority.',
//           () {
//         SmallerThanDatetimeWithUserAndDeveloperValuesTest tester =
//             new SmallerThanDatetimeWithUserAndDeveloperValuesTest(
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 1, 2),
//         );
//         bool isValid = ModelState.isValid<
//             SmallerThanDatetimeWithUserAndDeveloperValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by user only.', () {
//         SmallerThanDatetimeWithUserValuesTest tester =
//             new SmallerThanDatetimeWithUserValuesTest(
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 1, 2),
//         );
//         bool isValid =
//             ModelState.isValid<SmallerThanDatetimeWithUserValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by developer only.', () {
//         SmallerThanDatetimeWithDeveloperValuesTest tester =
//             new SmallerThanDatetimeWithDeveloperValuesTest(
//           new DateTime(2018, 12, 31),
//         );
//         bool isValid =
//             ModelState.isValid<SmallerThanDatetimeWithDeveloperValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is smaller than value to compare.', () {
//         SmallerThanDatetimeTest tester = new SmallerThanDatetimeTest(
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 1, 2),
//         );
//         bool isValid = ModelState.isValid<SmallerThanDatetimeTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is equal to value to compare.', () {
//         SmallerThanDatetimeTest tester = new SmallerThanDatetimeTest(
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 1, 1),
//         );
//         bool isValid = ModelState.isValid<SmallerThanDatetimeTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, SmallerThanDateTime);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'Value is not equal to the value to compare');
//       });

//       test('The value is smaller than value to compare.', () {
//         SmallerThanDatetimeTest tester = new SmallerThanDatetimeTest(
//           new DateTime(2020, 1, 1),
//           new DateTime(2019, 12, 31),
//         );
//         bool isValid = ModelState.isValid<SmallerThanDatetimeTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, SmallerThanDateTime);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'Value is not equal to the value to compare');
//       });
//     });
//   });
// }
