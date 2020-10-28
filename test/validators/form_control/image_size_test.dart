// import 'dart:io';

// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'models/models.dart';
// import 'models/models.reflectable.dart';

// void main() {
//   initializeReflectable();

//   group('ImageSize.', () {
//     group('Test the validation > success.', () {
//       test('Loaded file has a valid size (500px/500px min, 1000px/1000px max).',
//           () async {
//         File file =
//             new File('${Directory.current.path}\\test\\assets\\glycine.jpg');
//         ImageSizeTest model = new ImageSizeTest(file.readAsBytesSync());
//         ModelState<ImageSizeTest> modelState =
//             new ModelState<ImageSizeTest>(model);

//         expect(await modelState.validateForm(), true);
//         expect(modelState.errors.isEmpty, true);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test(
//           'Loaded file has not a valid size (500px/500px min, 1000px/1000px max).',
//           () async {
//         File file = new File(
//             '${Directory.current.path}\\test\\assets\\erable-japonais.png');
//         ImageSizeTest model = new ImageSizeTest(file.readAsBytesSync());
//         ModelState<ImageSizeTest> modelState =
//             new ModelState<ImageSizeTest>(model);

//         expect(await modelState.validateForm(), false);
//         expect(modelState.errors['value'].validatorType, ImageSize);
//         expect(modelState.errors['value'].propertyName, 'value');
//         expect(modelState.errors['value'].error, 'Taille d\'image incorrecte');
//       });
//     });
//   });
// }
