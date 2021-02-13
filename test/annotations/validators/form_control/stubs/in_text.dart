import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stub.dart';

class _InTextStub extends IStub<FormControl<String>, InText> {}

/* Value is valid */

/* Value is not valid */

/* Remote parameters are provided */

/* None parameter is provided */



// import 'package:flutter_model_form_validation/src/annotations/index.dart';
// import 'package:flutter_model_form_validation/src/form/index.dart';

// import '../../stub.dart';

// abstract class _IInTextStub extends IStub<FormControl<String>, InText> {}

// class InText_ValueInText_Stub extends _IInTextStub {
//   @override
//   FormControl<String> getControl() {
//     FormControl<String> value = new FormControl<String>(
//       value: 'consectetur',
//       validators: [],
//     );
//     return value;
//   }

//   @override
//   InText getValidator() => InText(
//         text:
//             'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//         error: 'value not inside text',
//       );
// }

// class InText_NullValue_Stub extends _IInTextStub {
//   @override
//   FormControl<String> getControl() {
//     FormControl<String> value = new FormControl<String>(
//       value: null,
//       validators: [],
//     );
//     return value;
//   }

//   @override
//   InText getValidator() => InText(
//         text:
//             'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//         error: 'value not inside text',
//       );
// }

// class InText_EmptyValue_Stub extends _IInTextStub {
//   @override
//   FormControl<String> getControl() {
//     FormControl<String> value = new FormControl<String>(
//       value: '',
//       validators: [],
//     );
//     return value;
//   }

//   @override
//   InText getValidator() => InText(
//         text:
//             'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//         error: 'value not inside text',
//       );
// }

// class InText_WithExternalTextToCompare_Stub extends _IInTextStub {
//   @override
//   FormControl<String> getControl() {
//     FormControl<String> text = new FormControl<String>(
//       value:
//           'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
//       validators: [],
//     );
//     FormControl<String> value = new FormControl<String>(
//       value: 'exercitation',
//       validators: [],
//     );
//     FormGroup root = new FormGroup(
//       controls: {
//         'value': value,
//         'text': text,
//       },
//       validators: [],
//     );

//     text.parentGroup = root;
//     value.parentGroup = root;

//     return value;
//   }

//   @override
//   InText getValidator() => InText(
//         text:
//             'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//         error: 'value not inside text',
//       );
// }

// class InText_ValueNotInText_Stub extends _IInTextStub {
//   @override
//   FormControl<String> getControl() {
//     FormControl<String> value = new FormControl<String>(
//       value: 'azerty',
//       validators: [],
//     );
//     return value;
//   }

//   @override
//   InText getValidator() => InText(
//         text:
//             'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//         error: 'value not inside text',
//       );
// }

// class InText_WithMissingTextToCompare_Stub extends _IInTextStub {
//   @override
//   FormControl<String> getControl() {
//     FormControl<String> value = new FormControl<String>(
//       value: 'consectetur',
//       validators: [],
//     );
//     return value;
//   }

//   @override
//   InText getValidator() => InText(
//         text: null,
//         error: 'value not inside text',
//       );
// }
