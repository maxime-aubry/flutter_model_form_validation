// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'models/models.dart';
// import 'models/models.reflectable.dart';

// void main() {
//   initializeReflectable();

//   group('EqualToDatetime.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"valueToCompare" is provided by user and developer. User data has priority.',
//           () async {
//         EqualToDatetimeWithUserAndDeveloperValuesTest model =
//             new EqualToDatetimeWithUserAndDeveloperValuesTest(
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 1, 1),
//         );
//         ModelState<EqualToDatetimeWithUserAndDeveloperValuesTest> modelState =
//             new ModelState<EqualToDatetimeWithUserAndDeveloperValuesTest>(
//                 model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by user only.', () async {
//         EqualToDatetimeWithUserValuesTest model =
//             new EqualToDatetimeWithUserValuesTest(
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 1, 1),
//         );
//         ModelState<EqualToDatetimeWithUserValuesTest> modelState =
//             new ModelState<EqualToDatetimeWithUserValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('"valueToCompare" is provided by developer only.', () async {
//         EqualToDatetimeWithDeveloperValuesTest model =
//             new EqualToDatetimeWithDeveloperValuesTest(
//           new DateTime(2019, 1, 1),
//         );
//         ModelState<EqualToDatetimeWithDeveloperValuesTest> modelState =
//             new ModelState<EqualToDatetimeWithDeveloperValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is equal to value to compare.', () async {
//         EqualToDatetimeTest model = new EqualToDatetimeTest(
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 1, 1),
//         );
//         ModelState<EqualToDatetimeTest> modelState =
//             new ModelState<EqualToDatetimeTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is not equal to value to compare.', () async {
//         EqualToDatetimeTest model = new EqualToDatetimeTest(
//           new DateTime(2020, 1, 2),
//           new DateTime(2020, 1, 1),
//         );
//         ModelState<EqualToDatetimeTest> modelState =
//             new ModelState<EqualToDatetimeTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.errors['value'].validatorType, EqualToDateTime);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(modelState.errors['value'].error,
//             'Value is not equal to the value to compare');
//       });
//     });
//   });
// }
