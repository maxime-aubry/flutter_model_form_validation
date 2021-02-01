// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// import '../models/models.dart';
// import '../models/models.reflectable.dart';
// import '../models/models_outside_of_library.dart';

// void main() {
//   initializeReflectable();

//   group('FormDeclarers.', () {
//     group('Filters.', () {
//       test('isEnum returns true for EGender enum type.', () {
//         bool result = isEnum<EGender>();
//         expect(result, true);
//       });

//       test('isEnum returns false for EFakeEnum enum type.', () {
//         bool result = isEnum<EFakeEnum>();
//         expect(result, false);
//       });

//       test('isEnum returns true for String type.', () {
//         bool result = isEnum<String>();
//         expect(result, false);
//       });

//       test('isListOfEnum returns true for List<EGender> enum type.', () {
//         bool result = isListOfEnum<List<EGender>>('test.models');
//         expect(result, true);
//       });

//       test('isListOfEnum returns true for List<EFakeEnum> enum type.', () {
//         bool result = isListOfEnum<List<EFakeEnum>>('test.models');
//         expect(result, false);
//       });

//       test(
//           'isListOfEnum returns true for List<EGender> enum type. Bad library name.',
//           () {
//         bool result = isListOfEnum<List<EGender>>('bad.library.name');
//         expect(result, false);
//       });

//       test(
//           'isListOfEnum returns false for List<EFakeEnum> enum type. Enum not defined into library.',
//           () {
//         bool result = isListOfEnum<List<EFakeEnum>>('test.models');
//         expect(result, false);
//       });

//       test('isListOfType returns true for List<String> type.', () {
//         bool result = isListOfType<List<String>, String>();
//         expect(result, true);
//       });

//       test('isListOfType returns false for List<int> type.', () {
//         bool result = isListOfType<List<int>, String>();
//         expect(result, false);
//       });
//     });
//   });
// }

// // expect(() {
// //   FormControlElement<EGender> formControl =
// //       new FormControlElement<EGender>(EGender.male, 'test.models');
// // },
// //     throwsA(isA<FormDeclarerException>()
// //         .having((error) => error.message, 'description', 'matcher')));
