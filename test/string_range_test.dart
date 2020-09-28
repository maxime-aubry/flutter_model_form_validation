// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('StringRange.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"Min" and "max" are provided by user and developer. User data has priority.',
//           () {
//         StringRangeWithUserAndDeveloperValuesTest tester =
//             new StringRangeWithUserAndDeveloperValuesTest('m', 'g', 'o');
//         bool isValid =
//             ModelState.isValid<StringRangeWithUserAndDeveloperValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"Min" and "max" are provided by user only.', () {
//         StringRangeWithUserValuesTest tester =
//             new StringRangeWithUserValuesTest('m', 'g', 'o');
//         bool isValid =
//             ModelState.isValid<StringRangeWithUserValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"Min" and "max" are provided by developer only.', () {
//         StringRangeWithDeveloperValuesTest tester =
//             new StringRangeWithDeveloperValuesTest('c');
//         bool isValid =
//             ModelState.isValid<StringRangeWithDeveloperValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is equal to "min".', () {
//         StringRangeTest tester = new StringRangeTest('g', 'g', 'o');
//         bool isValid = ModelState.isValid<StringRangeTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('The value is between "min" and "max".', () {
//         StringRangeTest tester = new StringRangeTest('m', 'g', 'o');
//         bool isValid = ModelState.isValid<StringRangeTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('The value is equal to "max".', () {
//         StringRangeTest tester = new StringRangeTest('o', 'g', 'o');
//         bool isValid = ModelState.isValid<StringRangeTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is smaller than "min".', () {
//         StringRangeTest tester = new StringRangeTest('f', 'g', 'o');
//         bool isValid = ModelState.isValid<StringRangeTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, StringRange);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'This string is not in the range');
//       });

//       test('The value is greater than "max".', () {
//         StringRangeTest tester = new StringRangeTest('p', 'g', 'o');
//         bool isValid = ModelState.isValid<StringRangeTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, StringRange);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'This string is not in the range');
//       });
//     });
//   });
// }
