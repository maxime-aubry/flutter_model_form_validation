// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('FormIndexer.', () {
//     ReactiveFormBuilder _formBuilder;
//     ReactiveFormState _formState;

//     setUpAll(() {
//       _formBuilder = new ReactiveFormBuilder(
//         group: new FormGroup(
//           controls: {},
//           validators: [],
//         ),
//       );
//       _formState = new ReactiveFormState(formBuilder: _formBuilder);
//       _formState.initialize();
//     });

//     test('CheckEnum returns true for EGender.', () async {

//       FormIndexer indexer = new FormIndexer();
//       indexer.addControl(formGroup);

//       expect(indexer.keys, contains(formGroup.uniqueName));
//       expect(indexer[formGroup.uniqueName], formGroup);
//     });
//   });
// }
