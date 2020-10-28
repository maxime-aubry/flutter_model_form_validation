// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'models/models.dart';
// import 'models/models.reflectable.dart';

// void main() {
//   initializeReflectable();

//   group('ContainsNumber.', () {
//     group('Test the validation > success.', () {
//       test('2 is in array.', () async {
//         ContainsNumberTest model = new ContainsNumberTest(2);
//         ModelState<ContainsNumberTest> modelState =
//             new ModelState<ContainsNumberTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('4 is not in array.', () async {
//         ContainsNumberTest model = new ContainsNumberTest(4);
//         ModelState<ContainsNumberTest> modelState =
//             new ModelState<ContainsNumberTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.errors['value'].validatorType, ContainsNumber);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(modelState.errors['value'].error, 'Invalid number');
//       });
//     });
//   });
// }
