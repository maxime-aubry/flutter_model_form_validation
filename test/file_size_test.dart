// import 'dart:io';
// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('FileSize.', () {
//     group('Test the validation > success.', () {
//       test('Loaded image is lighter or equal to 1MO.', () {
//         File file =
//             new File('${Directory.current.path}\\test\\assets\\glycine.jpg');

//         FileSizeTest tester = new FileSizeTest(file.readAsBytesSync());
//         bool isValid = ModelState.isValid<FileSizeTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('Loaded image is heavier than 1MO.', () {
//         File file = new File(
//             '${Directory.current.path}\\test\\assets\\erable-japonais.png');

//         FileSizeTest tester = new FileSizeTest(file.readAsBytesSync());
//         bool isValid = ModelState.isValid<FileSizeTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, FileSize);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid file size');
//       });
//     });
//   });
// }
