// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'models/models.dart';
// import 'models/models.reflectable.dart';

// void main() {
//   initializeReflectable();

//   group('ContainsString.', () {
//     group('Test the validation > success.', () {
//       test('"lorem" is in array.', () async {
//         ContainsStringTest model = new ContainsStringTest('lorem');
//         ModelState<ContainsStringTest> modelState =
//             new ModelState<ContainsStringTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('"lorem" is not in array.', () async {
//         ContainsStringTest model = new ContainsStringTest('consectetur');
//         ModelState<ContainsStringTest> modelState =
//             new ModelState<ContainsStringTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.errors['value'].validatorType, ContainsString);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(modelState.errors['value'].error, 'Invalid keyword');
//       });
//     });
//   });
// }
