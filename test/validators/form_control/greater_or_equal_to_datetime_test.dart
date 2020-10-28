// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('GreaterOrEqualToDatetime.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"valueToCompare" is provided by user and developer. User data has priority.',
//           () async {
//         GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest model =
//             new GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest(
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 1, 1),
//         );
//         ModelState<GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest>
//             modelState = new ModelState<
//                 GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by user only.', () async {
//         GreaterOrEqualToDatetimeWithUserValuesTest model =
//             new GreaterOrEqualToDatetimeWithUserValuesTest(
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 1, 1),
//         );
//         ModelState<GreaterOrEqualToDatetimeWithUserValuesTest> modelState =
//             new ModelState<GreaterOrEqualToDatetimeWithUserValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by developer only.', () async {
//         GreaterOrEqualToDatetimeWithDeveloperValuesTest model =
//             new GreaterOrEqualToDatetimeWithDeveloperValuesTest(
//           new DateTime(2019, 1, 1),
//         );
//         ModelState<GreaterOrEqualToDatetimeWithDeveloperValuesTest> modelState =
//             new ModelState<GreaterOrEqualToDatetimeWithDeveloperValuesTest>(
//                 model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is greater than value to compare.', () async {
//         GreaterOrEqualToDatetimeTest model = new GreaterOrEqualToDatetimeTest(
//           new DateTime(2020, 1, 2),
//           new DateTime(2020, 1, 1),
//         );
//         ModelState<GreaterOrEqualToDatetimeTest> modelState =
//             new ModelState<GreaterOrEqualToDatetimeTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('The value is equal to value to compare.', () async {
//         GreaterOrEqualToDatetimeTest model = new GreaterOrEqualToDatetimeTest(
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 1, 1),
//         );
//         ModelState<GreaterOrEqualToDatetimeTest> modelState =
//             new ModelState<GreaterOrEqualToDatetimeTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is smaller than value to compare.', () async {
//         GreaterOrEqualToDatetimeTest model = new GreaterOrEqualToDatetimeTest(
//           new DateTime(2019, 12, 31),
//           new DateTime(2020, 1, 1),
//         );
//         ModelState<GreaterOrEqualToDatetimeTest> modelState =
//             new ModelState<GreaterOrEqualToDatetimeTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(
//             modelState.errors['value'].validatorType, GreaterOrEqualToDateTime);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(modelState.errors['value'].error,
//             'Value is not equal to the value to compare');
//       });
//     });
//   });
// }
