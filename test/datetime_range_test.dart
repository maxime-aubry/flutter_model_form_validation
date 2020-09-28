// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('DateTimeRange.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"Min" and "max" are provided by user and developer. User data has priority.',
//           () {
//         DateTimeRangeWithUserAndDeveloperValuesTest tester =
//             new DateTimeRangeWithUserAndDeveloperValuesTest(
//           new DateTime(2020, 8, 15),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         bool isValid =
//             ModelState.isValid<DateTimeRangeWithUserAndDeveloperValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"Min" and "max" are provided by user only.', () {
//         DateTimeRangeWithUserValuesTest tester =
//             new DateTimeRangeWithUserValuesTest(
//           new DateTime(2020, 8, 15),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         bool isValid =
//             ModelState.isValid<DateTimeRangeWithUserValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"Min" and "max" are provided by developer only.', () {
//         DateTimeRangeWithDeveloperValuesTest tester =
//             new DateTimeRangeWithDeveloperValuesTest(new DateTime(2019, 3, 15));
//         bool isValid =
//             ModelState.isValid<DateTimeRangeWithDeveloperValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is equal to "min".', () {
//         DateTimeRangeTest tester = new DateTimeRangeTest(
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         bool isValid = ModelState.isValid<DateTimeRangeTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('The value is between "min" and "max".', () {
//         DateTimeRangeTest tester = new DateTimeRangeTest(
//           new DateTime(2020, 6, 1),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         bool isValid = ModelState.isValid<DateTimeRangeTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('The value is equal to "max".', () {
//         DateTimeRangeTest tester = new DateTimeRangeTest(
//           new DateTime(2020, 12, 31),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         bool isValid = ModelState.isValid<DateTimeRangeTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is smaller than "min".', () {
//         DateTimeRangeTest tester = new DateTimeRangeTest(
//           new DateTime(2019, 12, 31),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         bool isValid = ModelState.isValid<DateTimeRangeTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, DateTimeRange);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'This datetime is not in the range');
//       });

//       test('The value is greater than "max".', () {
//         DateTimeRangeTest tester = new DateTimeRangeTest(
//           new DateTime(2021, 1, 1),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         bool isValid = ModelState.isValid<DateTimeRangeTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, DateTimeRange);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error,
//             'This datetime is not in the range');
//       });
//     });
//   });
// }
