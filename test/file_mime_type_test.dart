// import 'dart:io';
// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('FileMimeType.', () {
//     group('Test the validation > success.', () {
//       test('Loaded image is JPEG or BNP.', () {
//         File file =
//             new File('${Directory.current.path}\\test\\assets\\glycine.jpg');

//         FileMimeTypeTest tester = new FileMimeTypeTest(file.readAsBytesSync());
//         bool isValid = ModelState.isValid<FileMimeTypeTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('Loaded image is neither JPEG or BNP', () {
//         File file = new File(
//             '${Directory.current.path}\\test\\assets\\erable-japonais.png');

//         FileMimeTypeTest tester = new FileMimeTypeTest(file.readAsBytesSync());
//         bool isValid = ModelState.isValid<FileMimeTypeTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, FileMimeType);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid mime type');
//       });
//     });
//   });
// }
