// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('RegularExpression.', () {
//     group('Test the validation > success.', () {
//       test('Valid regular expression.', () {
//         RegularExpressionTest tester = new RegularExpressionTest('Hello');
//         bool isValid = ModelState.isValid<RegularExpressionTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('Invalid regular expression.', () {
//         RegularExpressionTest tester =
//             new RegularExpressionTest('Good morning');
//         bool isValid = ModelState.isValid<RegularExpressionTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, RegularExpression);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid regular expression');
//       });
//     });
//   });
// }
