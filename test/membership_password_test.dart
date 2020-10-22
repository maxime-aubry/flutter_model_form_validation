// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('MembershipPassword.', () {
//     group('Test the validation > success.', () {
//       test('Valid password.', () async {
//         MembershipPasswordTest model =
//             new MembershipPasswordTest('M@xime!20200101');
//         ModelState modelState = new ModelState<MembershipPasswordTest>(model);
//         Map<String, bool> details = MembershipPassword.getErrorDetails(
//             '0Siatis@0719', 8, 16, true, true, true, true);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//         expect(details['includesAlphabeticalCharacters'], true);
//         expect(details['includesUppercaseCharacters'], true);
//         expect(details['includesNumericalCharacters'], true);
//         expect(details['includesSpecialCharacters'], true);
//         expect(details['minLength'], true);
//         expect(details['maxLength'], true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('Invalid password.', () async {
//         MembershipPasswordTest model =
//             new MembershipPasswordTest('Maxime20200101');
//         ModelState modelState = new ModelState<MembershipPasswordTest>(model);
//         Map<String, bool> details = MembershipPassword.getErrorDetails(
//             '0Siatis0719', 8, 16, true, true, true, true);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.errors['value'].validatorType, MembershipPassword);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(modelState.errors['value'].error, 'Invalid password');
//         expect(details['includesAlphabeticalCharacters'], true);
//         expect(details['includesUppercaseCharacters'], true);
//         expect(details['includesNumericalCharacters'], true);
//         expect(details['includesSpecialCharacters'], false);
//         expect(details['minLength'], true);
//         expect(details['maxLength'], true);
//       });
//     });
//   });
// }
