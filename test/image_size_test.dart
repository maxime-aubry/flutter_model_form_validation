// import 'dart:io';
// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('ImageSize.', () {
//     group('Test the validation > success.', () {
//       test('Loaded file has a valid size (500px/500px min, 1000px/1000px max).',
//           () {
//         File file =
//             new File('${Directory.current.path}\\test\\assets\\glycine.jpg');
//         ImageSizeTest tester = new ImageSizeTest(file.readAsBytesSync());
//         bool isValid = ModelState.isValid<ImageSizeTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test(
//           'Loaded file has not a valid size (500px/500px min, 1000px/1000px max).',
//           () {
//         File file = new File(
//             '${Directory.current.path}\\test\\assets\\erable-japonais.png');
//         ImageSizeTest tester = new ImageSizeTest(file.readAsBytesSync());
//         bool isValid = ModelState.isValid<ImageSizeTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, ImageSize);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Taille d\'image incorrecte');
//       });
//     });
//   });
// }
