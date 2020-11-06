// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// import '../../models/models.dart';
// import '../../models/models.reflectable.dart';

// void main() {
//   initializeReflectable();

//   group('NbItems.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"Min" and "max" are provided by user and developer. User data has priority.',
//           () async {
//         NbItemsWithUserAndDeveloperValuesTest model =
//             new NbItemsWithUserAndDeveloperValuesTest(
//           ["azerty", "ytreza"],
//           2,
//           4,
//         );
//         ModelFormState<NbItemsWithUserAndDeveloperValuesTest> modelState =
//             new ModelFormState<NbItemsWithUserAndDeveloperValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.status, EFormStatus.valid);
//         ValidationError error =
//             modelState.getError(model.getListenerName('value'));
//         expect(error, isNull);
//       });

//       test('"Min" and "max" are provided by user only.', () async {
//         NbItemsWithUserValuesTest model = new NbItemsWithUserValuesTest(
//           ["azerty", "ytreza"],
//           2,
//           4,
//         );
//         ModelFormState<NbItemsWithUserValuesTest> modelState =
//             new ModelFormState<NbItemsWithUserValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.status, EFormStatus.valid);
//         ValidationError error =
//             modelState.getError(model.getListenerName('value'));
//         expect(error, isNull);
//       });

//       test('"Min" and "max" are provided by developer only.', () async {
//         NbItemsWithDeveloperValuesTest model =
//             new NbItemsWithDeveloperValuesTest(
//           ["azerty", "ytreza"],
//         );
//         ModelFormState<NbItemsWithDeveloperValuesTest> modelState =
//             new ModelFormState<NbItemsWithDeveloperValuesTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.status, EFormStatus.valid);
//         ValidationError error =
//             modelState.getError(model.getListenerName('value'));
//         expect(error, isNull);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The list length is equal to "min".', () async {
//         NbItemsTest model = new NbItemsTest(
//           ["azerty", "ytreza"],
//           2,
//           4,
//         );
//         ModelFormState<NbItemsTest> modelState =
//             new ModelFormState<NbItemsTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.status, EFormStatus.valid);
//         ValidationError error =
//             modelState.getError(model.getListenerName('value'));
//         expect(error, isNull);
//       });

//       test('The list length is between "min" and "max".', () async {
//         NbItemsTest model = new NbItemsTest(
//           ["azerty", "ytreza", "lorem"],
//           2,
//           4,
//         );
//         ModelFormState<NbItemsTest> modelState =
//             new ModelFormState<NbItemsTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.status, EFormStatus.valid);
//         ValidationError error =
//             modelState.getError(model.getListenerName('value'));
//         expect(error, isNull);
//       });

//       test('The list length is equal to "max".', () async {
//         NbItemsTest model = new NbItemsTest(
//           ["azerty", "ytreza", "lorem", "ipsum"],
//           2,
//           4,
//         );
//         ModelFormState<NbItemsTest> modelState =
//             new ModelFormState<NbItemsTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.status, EFormStatus.valid);
//         ValidationError error =
//             modelState.getError(model.getListenerName('value'));
//         expect(error, isNull);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The list length is smaller than "min".', () async {
//         NbItemsTest model = new NbItemsTest(
//           ["azerty"],
//           2,
//           4,
//         );
//         ModelFormState<NbItemsTest> modelState =
//             new ModelFormState<NbItemsTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.status, EFormStatus.invalid);
//         ValidationError error =
//             modelState.getError(model.getListenerName('value'));
//         expect(error, isNotNull);
//         expect(error.propertyName, 'value');
//         expect(error.validatorType, NbItems);
//         expect(error.message, 'error message here');
//       });

//       test('The list length is greater than "max".', () async {
//         NbItemsTest model = new NbItemsTest(
//           ["azerty", "ytreza", "lorem", "ipsum", "dolor"],
//           2,
//           4,
//         );
//         ModelFormState<NbItemsTest> modelState =
//             new ModelFormState<NbItemsTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.status, EFormStatus.invalid);
//         ValidationError error =
//             modelState.getError(model.getListenerName('value'));
//         expect(error, isNotNull);
//         expect(error.propertyName, 'value');
//         expect(error.validatorType, NbItems);
//         expect(error.message, 'error message here');
//       });
//     });
//   });
// }
