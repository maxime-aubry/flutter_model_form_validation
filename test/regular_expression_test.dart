// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'models/models.dart';
// import 'models/models.reflectable.dart';

// void main() {
//   initializeReflectable();

//   group('RegularExpression.', () {
//     group('Test the validation > success.', () {
//       test('Valid regular expression.', () async {
//         RegularExpressionTest model = new RegularExpressionTest('Hello');
//         ModelState modelState = new ModelState<RegularExpressionTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('Invalid regular expression.', () async {
//         RegularExpressionTest model = new RegularExpressionTest('Good morning');
//         ModelState modelState = new ModelState<RegularExpressionTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.errors['value'].validatorType, RegularExpression);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(modelState.errors['value'].error, 'Invalid regular expression');
//       });
//     });
//   });
// }
