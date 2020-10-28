// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'models/models.dart';
// import 'models/models.reflectable.dart';

// void main() {
//   initializeReflectable();

//   group('Email.', () {
//     group('Test the validation > success.', () {
//       test('Valid email.', () async {
//         EmailTest model = new EmailTest('azerty@test.com');
//         ModelState<EmailTest> modelState = new ModelState<EmailTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });
//     group('Test the validation > failure.', () {
//       test('Invalid email.', () async {
//         EmailTest model = new EmailTest('azerty@.com');
//         ModelState<EmailTest> modelState = new ModelState<EmailTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.errors['value'].validatorType, Email);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(modelState.errors['value'].error, 'Invalid email');
//       });
//     });
//   });
// }
