// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('PhoneNumber.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"countryCode" and "phoneNumberType" are provided by user and developer. User data has priority.',
//           () {
//         PhoneNumberWithUserAndDeveloperValuesTest tester =
//             new PhoneNumberWithUserAndDeveloperValuesTest(
//                 '01.82.86.66.93', 'FR', PhoneNumberType.landline);
//         bool isValid =
//             ModelState.isValid<PhoneNumberWithUserAndDeveloperValuesTest>(
//                 tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('"countryCode" and "phoneNumberType" are provided by user only.',
//           () {
//         PhoneNumberWithUserValuesTest tester =
//             new PhoneNumberWithUserValuesTest(
//                 '01.82.86.66.93', 'FR', PhoneNumberType.landline);
//         bool isValid =
//             ModelState.isValid<PhoneNumberWithUserValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test(
//           '"countryCode" and "phoneNumberType" are provided by developer only.',
//           () {
//         PhoneNumberWithDeveloperValuesTest tester =
//             new PhoneNumberWithDeveloperValuesTest('713-705-9618');
//         bool isValid =
//             ModelState.isValid<PhoneNumberWithDeveloperValuesTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > success.', () {
//       //#region AD (Andorra)
//       test('Valid landline phone number (AD), +376-715-384.', () {
//         PhoneNumberTest tester =
//             new PhoneNumberTest('+376-715-384', 'AD', PhoneNumberType.landline);
//         bool isValid = ModelState.isValid(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('Valid mobile phone number (AD), +376-315-384.', () {
//         PhoneNumberTest tester =
//             new PhoneNumberTest('+376-315-384', 'AD', PhoneNumberType.mobile);
//         bool isValid = ModelState.isValid(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//       //#endregion

//       //#region AE (United Arab Emirates)
//       test('Valid landline phone number (AE), +971-6-536-6187.', () {
//         PhoneNumberTest tester = new PhoneNumberTest(
//             '+971-6-536-6187', 'AE', PhoneNumberType.landline);
//         bool isValid = ModelState.isValid(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('Valid mobile phone number (AE), +971-55-536-6187.', () {
//         PhoneNumberTest tester = new PhoneNumberTest(
//             '+971-55-536-6187', 'AE', PhoneNumberType.mobile);
//         bool isValid = ModelState.isValid(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//       //#endregion

//       //#region AF (Afghanistan)
//       test('Valid landline phone number (AF), +93-30-567-2940.', () {
//         PhoneNumberTest tester = new PhoneNumberTest(
//             '+93-30-567-2940', 'AF', PhoneNumberType.landline);
//         bool isValid = ModelState.isValid(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('Valid mobile phone number (AF), +93-72-567-2940.', () {
//         PhoneNumberTest tester = new PhoneNumberTest(
//             '+93-72-567-2940', 'AF', PhoneNumberType.mobile);
//         bool isValid = ModelState.isValid(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//       //#endregion

//       //#region AG (Antigua and Barbuda)
//       test('Valid phone number (AG), +1-268-555-2168.', () {
//         PhoneNumberTest tester = new PhoneNumberTest(
//             '+1-268-555-2168', 'AG', PhoneNumberType.landline);
//         bool isValid = ModelState.isValid(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('Valid phone number (AG), +1-268-755-2168.', () {
//         PhoneNumberTest tester = new PhoneNumberTest(
//             '+1-268-755-2168', 'AG', PhoneNumberType.mobile);
//         bool isValid = ModelState.isValid(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//       //#endregion

//       //#endregion AI (Anguilla)
//       test('Valid phone number (AI), +1-264-4556-285.', () {
//         PhoneNumberTest tester = new PhoneNumberTest(
//             '+1-264-4556-285', 'AI', PhoneNumberType.landline);
//         bool isValid = ModelState.isValid(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('Valid phone number (AI), +1-264-7556-285.', () {
//         PhoneNumberTest tester = new PhoneNumberTest(
//             '+1-264-7556-285', 'AI', PhoneNumberType.mobile);
//         bool isValid = ModelState.isValid(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//       //#endregion

//       //test('Valid phone number (AL).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'AL', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (AM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'AM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (AO).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'AO', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (AQ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'AQ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (AR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'AR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (AS).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'AS', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (AT).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'AT', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (AU).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'AU', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (AW).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'AW', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (AX).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'AX', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (AZ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'AZ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BA).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BA', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BB).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BB', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BD).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BD', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BE).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BE', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BF).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BF', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BG).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BG', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BH).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BH', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BI).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BI', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BJ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BJ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BL).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BL', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BN).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BN', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BO).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BO', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BQ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BQ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BS).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BS', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BT).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BT', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BV).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BV', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BW).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BW', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BY).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BY', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (BZ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'BZ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CA).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CA', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CC).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CC', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CD).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CD', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CF).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CF', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CG).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CG', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CH).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CH', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CI).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CI', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CK).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CK', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CL).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CL', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CN).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CN', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CO).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CO', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CU).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CU', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CV).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CV', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CW).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CW', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CX).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CX', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CY).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CY', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (CZ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'CZ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (DE).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'DE', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (DJ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'DJ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (DK).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'DK', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (DM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'DM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (DO).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'DO', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (DZ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'DZ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (EC).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'EC', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (EE).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'EE', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (EG).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'EG', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (EH).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'EH', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (ER).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'ER', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (ES).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'ES', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (ET).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'ET', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (FI).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'FI', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (FJ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'FJ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (FK).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'FK', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (FM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'FM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (FO).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'FO', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (FR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'FR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GA).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GA', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GB).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GB', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GD).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GD', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GE).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GE', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GF).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GF', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GG).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GG', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GH).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GH', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GI).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GI', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GL).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GL', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GN).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GN', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GP).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GP', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GQ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GQ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GS).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GS', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GT).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GT', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GU).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GU', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GW).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GW', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (GY).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'GY', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (HK).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'HK', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (HM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'HM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (HN).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'HN', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (HR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'HR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (HT).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'HT', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (HU).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'HU', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (ID).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'ID', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (IE).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'IE', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (IL).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'IL', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (IM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'IM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (IN).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'IN', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (IO).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'IO', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (IQ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'IQ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (IR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'IR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (IS).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'IS', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (IT).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'IT', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (JE).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'JE', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (JM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'JM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (JO).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'JO', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (JP).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'JP', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (KE).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'KE', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (KG).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'KG', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (KH).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'KH', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (KI).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'KI', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (KM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'KM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (KN).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'KN', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (KP).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'KP', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (KR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'KR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (KW).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'KW', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (KY).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'KY', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (KZ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'KZ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (LA).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'LA', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (LB).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'LB', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (LC).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'LC', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (LI).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'LI', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (LK).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'LK', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (LR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'LR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (LS).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'LS', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (LT).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'LT', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (LU).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'LU', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (LV).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'LV', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (LY).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'LY', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MA).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MA', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MC).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MC', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MD).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MD', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (ME).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'ME', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MF).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MF', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MG).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MG', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MH).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MH', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MK).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MK', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (ML).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'ML', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MN).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MN', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MO).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MO', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MP).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MP', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MQ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MQ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MS).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MS', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MT).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MT', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MU).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MU', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MV).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MV', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MW).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MW', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MX).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MX', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MY).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MY', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (MZ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'MZ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (NA).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'NA', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (NC).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'NC', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (NE).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'NE', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (NF).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'NF', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (NG).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'NG', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (NI).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'NI', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (NL).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'NL', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (NO).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'NO', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (NP).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'NP', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (NR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'NR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (NU).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'NU', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (NZ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'NZ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (OM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'OM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PA).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PA', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PE).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PE', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PF).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PF', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PG).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PG', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PH).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PH', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PK).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PK', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PL).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PL', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PN).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PN', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PS).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PS', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PT).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PT', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PW).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PW', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (PY).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'PY', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (QA).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'QA', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (RE).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'RE', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (RO).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'RO', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (RS).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'RS', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (RU).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'RU', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (RW).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'RW', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SA).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SA', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SB).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SB', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SC).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SC', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SD).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SD', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SE).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SE', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SG).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SG', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SH).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SH', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SI).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SI', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SJ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SJ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SK).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SK', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SL).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SL', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SN).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SN', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SO).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SO', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SS).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SS', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (ST).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'ST', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SV).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SV', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SX).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SX', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SY).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SY', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (SZ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'SZ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TC).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TC', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TD).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TD', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TF).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TF', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TG).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TG', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TH).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TH', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TJ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TJ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TK).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TK', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TL).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TL', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TN).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TN', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TO).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TO', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TR).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TR', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TT).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TT', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TV).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TV', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TW).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TW', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (TZ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'TZ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (UA).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'UA', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (UG).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'UG', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (UM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'UM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (US).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'US', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (UY).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'UY', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (UZ).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'UZ', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (VA).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'VA', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (VC).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'VC', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (VE).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'VE', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (VG).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'VG', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (VI).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'VI', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (VN).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'VN', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (VU).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'VU', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (WF).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'WF', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (WS).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'WS', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (YE).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'YE', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (YT).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'YT', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (ZA).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'ZA', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (ZM).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'ZM', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});

//       //test('Valid phone number (ZW).', () {
//       //PhoneNumberTest tester = new PhoneNumberTest('', 'ZW', PhoneNumberType.landline);
//       //bool isValid = ModelState.isValid(tester);
//       //expect(isValid, true);
//       //expect(ModelState.errors.isEmpty, true);
//       //});
//     });

//     group('Test the validation > failure.', () {
//       // test('Invalid phone number (xx).', () {
//       //   PhoneNumberTest tester = new PhoneNumberTest('', '', PhoneNumberType.landline);
//       //   bool isValid = ModelState.isValid<PhoneNumberTest>(tester);
//       //   expect(isValid, false);

//       //   expect(ModelState.errors['value'].validatorType, PhoneNumber);
//       //   expect(ModelState.errors['value'].propertyName, 'value');
//       //   expect(ModelState.errors['value'].error, 'Invalid phone number');
//       // });

//       //#region AD (Andorra)
//       test('Invalid landline phone number (AD), +376-215-384.', () {
//         PhoneNumberTest tester =
//             new PhoneNumberTest('+376-215-384', 'AD', PhoneNumberType.landline);
//         bool isValid = ModelState.isValid<PhoneNumberTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, PhoneNumber);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid phone number');
//       });

//       test('Invalid mobile phone number (AD), +376-715-384.', () {
//         PhoneNumberTest tester =
//             new PhoneNumberTest('+376-715-384', 'AD', PhoneNumberType.mobile);
//         bool isValid = ModelState.isValid<PhoneNumberTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, PhoneNumber);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid phone number');
//       });
//       //#endregion

//       //#region AE (United Arab Emirates)
//       test('Invalid landline phone number (AE), +971-55-536-6187.', () {
//         PhoneNumberTest tester = new PhoneNumberTest(
//             '+971-55-536-6187', 'AE', PhoneNumberType.landline);
//         bool isValid = ModelState.isValid<PhoneNumberTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, PhoneNumber);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid phone number');
//       });

//       test('Invalid mobile phone number (AE), +971-6-536-6187.', () {
//         PhoneNumberTest tester = new PhoneNumberTest(
//             '+971-6-536-6187', 'AE', PhoneNumberType.mobile);
//         bool isValid = ModelState.isValid<PhoneNumberTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, PhoneNumber);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid phone number');
//       });
//       //#endregion

//       //#region AF (Afghanistan)
//       test('Invalid landline phone number (AF), +93-72-567-2940.', () {
//         PhoneNumberTest tester = new PhoneNumberTest(
//             '+93-72-567-2940', 'AF', PhoneNumberType.landline);
//         bool isValid = ModelState.isValid<PhoneNumberTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, PhoneNumber);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid phone number');
//       });

//       test('Invalid mobile phone number (AF), +93-30-567-2940.', () {
//         PhoneNumberTest tester = new PhoneNumberTest(
//             '+93-30-567-2940', 'AF', PhoneNumberType.mobile);
//         bool isValid = ModelState.isValid<PhoneNumberTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, PhoneNumber);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid phone number');
//       });
//       //#endregion
//     });
//   });
// }
