// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('Email.', () {
//     group('Test the validation > success.', () {
//       test('Valid email.', () {
//         EmailTest tester = new EmailTest('azerty@test.com');
//         bool isValid = ModelState.isValid<EmailTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });
//     group('Test the validation > failure.', () {
//       test('Invalid email.', () {
//         EmailTest tester = new EmailTest('azerty@.com');
//         bool isValid = ModelState.isValid<EmailTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, Email);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid email');
//       });
//     });
//   });
// }
