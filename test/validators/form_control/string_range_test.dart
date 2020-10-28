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
//           () async {
//         StringRangeWithUserAndDeveloperValuesTest model =
//             new StringRangeWithUserAndDeveloperValuesTest('m', 'g', 'o');
//         ModelState modelState =
//             new ModelState<StringRangeWithUserAndDeveloperValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('"Min" and "max" are provided by user only.', () async {
//         StringRangeWithUserValuesTest model =
//             new StringRangeWithUserValuesTest('m', 'g', 'o');
//         ModelState modelState =
//             new ModelState<StringRangeWithUserValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('"Min" and "max" are provided by developer only.', () async {
//         StringRangeWithDeveloperValuesTest model =
//             new StringRangeWithDeveloperValuesTest('c');
//         ModelState modelState =
//             new ModelState<StringRangeWithDeveloperValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is equal to "min".', () async {
//         StringRangeTest model = new StringRangeTest('g', 'g', 'o');
//         ModelState modelState = new ModelState<StringRangeTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('The value is between "min" and "max".', () async {
//         StringRangeTest model = new StringRangeTest('m', 'g', 'o');
//         ModelState modelState = new ModelState<StringRangeTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });

//       test('The value is equal to "max".', () async {
//         StringRangeTest model = new StringRangeTest('o', 'g', 'o');
//         ModelState modelState = new ModelState<StringRangeTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is smaller than "min".', () async {
//         StringRangeTest model = new StringRangeTest('f', 'g', 'o');
//         ModelState modelState = new ModelState<StringRangeTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.errors['value'].validatorType, StringRange);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(modelState.errors['value'].error,
//             'This string is not in the range');
//       });

//       test('The value is greater than "max".', () async {
//         StringRangeTest model = new StringRangeTest('p', 'g', 'o');
//         ModelState modelState = new ModelState<StringRangeTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.errors['value'].validatorType, StringRange);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(modelState.errors['value'].error,
//             'This string is not in the range');
//       });
//     });
//   });
// }
