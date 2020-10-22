// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'models/models.dart';
// import 'models/models.reflectable.dart';

// void main() {
//   initializeReflectable();

//   group('NumberRange.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"Min" and "max" are provided by user and developer. User data has priority.',
//           () async {
//         NumberRangeWithUserAndDeveloperValuesTest model =
//             new NumberRangeWithUserAndDeveloperValuesTest(5, 1, 10);
//         ModelState modelState =
//             new ModelState<NumberRangeWithUserAndDeveloperValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('"Min" and "max" are provided by user only.', () async {
//         NumberRangeWithUserValuesTest model =
//             new NumberRangeWithUserValuesTest(5, 1, 10);
//         ModelState modelState =
//             new ModelState<NumberRangeWithUserValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('"Min" and "max" are provided by developer only.', () async {
//         NumberRangeWithDeveloperValuesTest model =
//             new NumberRangeWithDeveloperValuesTest(-5);
//         ModelState modelState =
//             new ModelState<NumberRangeWithDeveloperValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is equal to "min".', () async {
//         NumberRangeTest model = new NumberRangeTest(1, 1, 10);
//         ModelState modelState = new ModelState<NumberRangeTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('The value is between "min" and "max".', () async {
//         NumberRangeTest model = new NumberRangeTest(5, 1, 10);
//         ModelState modelState = new ModelState<NumberRangeTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('The value is equal to "max".', () async {
//         NumberRangeTest model = new NumberRangeTest(10, 1, 10);
//         ModelState modelState = new ModelState<NumberRangeTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is smaller than "min".', () async {
//         NumberRangeTest model = new NumberRangeTest(0, 1, 10);
//         ModelState modelState = new ModelState<NumberRangeTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.errors['value'].validatorType, NumberRange);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(modelState.errors['value'].error,
//             'This Number is not in the range');
//       });

//       test('The value is greater than "max".', () async {
//         NumberRangeTest model = new NumberRangeTest(11, 1, 10);
//         ModelState modelState = new ModelState<NumberRangeTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.errors['value'].validatorType, NumberRange);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(modelState.errors['value'].error,
//             'This Number is not in the range');
//       });
//     });
//   });
// }
