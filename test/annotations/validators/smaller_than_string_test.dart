// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// import '../models/models.dart';
// import '../models/models.reflectable.dart';

// void main() {
//   initializeReflectable();

//   group('SmallerThanString.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"valueToCompare" is provided by user and developer. User data has priority.',
//           () async {
//         SmallerThanStringTest model = new SmallerThanStringTest('c', 'd');
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), true);
//         expect(formState.status, EFormStatus.valid);
//         ValidationError error = formState.formBuilder
//             .getFormElement<ModelFormControl>(model, 'value')
//             ?.error;
//         expect(error, isNull);
//       });

//       test('"valueToCompare" is provided by user only.', () async {
//         SmallerThanStringTest model = new SmallerThanStringTest('c', 'd');
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), true);
//         expect(formState.status, EFormStatus.valid);
//         ValidationError error = formState.formBuilder
//             .getFormElement<ModelFormControl>(model, 'value')
//             ?.error;
//         expect(error, isNull);
//       });

//       test('"valueToCompare" is provided by developer only.', () async {
//         SmallerThanStringTest model = new SmallerThanStringTest('a');
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), true);
//         expect(formState.status, EFormStatus.valid);
//         ValidationError error = formState.formBuilder
//             .getFormElement<ModelFormControl>(model, 'value')
//             ?.error;
//         expect(error, isNull);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is smaller than value to compare.', () async {
//         SmallerThanStringTest model = new SmallerThanStringTest('b', 'c');
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), true);
//         expect(formState.status, EFormStatus.valid);
//         ValidationError error = formState.formBuilder
//             .getFormElement<ModelFormControl>(model, 'value')
//             ?.error;
//         expect(error, isNull);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is equal to value to compare.', () async {
//         SmallerThanStringTest model = new SmallerThanStringTest('b', 'b');
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), false);
//         expect(formState.status, EFormStatus.invalid);
//         ValidationError error = formState.formBuilder
//             .getFormElement<ModelFormControl>(model, 'value')
//             ?.error;
//         expect(error, isNotNull);
//         expect(error.propertyName, 'value');
//         expect(error.validatorType, SmallerThan);
//         expect(error.message, 'error message here');
//       });

//       test('The value is not equal to value to compare.', () async {
//         SmallerThanStringTest model = new SmallerThanStringTest('b', 'a');
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), false);
//         expect(formState.status, EFormStatus.invalid);
//         ValidationError error = formState.formBuilder
//             .getFormElement<ModelFormControl>(model, 'value')
//             ?.error;
//         expect(error, isNotNull);
//         expect(error.propertyName, 'value');
//         expect(error.validatorType, SmallerThan);
//         expect(error.message, 'error message here');
//       });
//     });
//   });
// }
