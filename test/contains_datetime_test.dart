// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('ContainsDateTime.', () {
//     group('Test the validation > success.', () {
//       test('"2020-06-01" is in array.', () {
//         ContainsDateTimeTest model =
//             new ContainsDateTimeTest(new DateTime(2020, 6, 1));
//         ModelState<ContainsDateTimeTest> modelState =
//             new ModelState<ContainsDateTimeTest>(model);
//         modelState.initModelState();

//         expect(modelState.isValid(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('"2020-06-02" is not in array.', () {
//         ContainsDateTimeTest model =
//             new ContainsDateTimeTest(new DateTime(2020, 6, 2));
//         ModelState<ContainsDateTimeTest> modelState =
//             new ModelState<ContainsDateTimeTest>(model);
//         modelState.initModelState();

//         expect(modelState.isValid(), false);
//         expect(modelState.errors['value'].validatorType, ContainsDateTime);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(modelState.errors['value'].error, 'Invalid datetime');
//       });
//     });
//   });
// }
