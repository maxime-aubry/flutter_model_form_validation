// import 'package:flutter/material.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:property_change_notifier/property_change_notifier.dart';

// import 'hero_model_form.dart';

// class HeroForm extends StatelessWidget {
//   final ModelFormState<HeroModelForm> formState =
//       new ModelFormState<HeroModelForm>(
//     new HeroModelForm(null, null, null, null),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Property Change Notifier',
//       home: Scaffold(
//         body: PropertyChangeProvider(
//           value: formState,
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NameInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final formState = PropertyChangeProvider.of<ModelFormState<HeroModelForm>>(
//       context,
//       listen: false,
//     ).value;
//     return TextFormField(
//       decoration: const InputDecoration(labelText: 'Name *'),
//       onChanged: (String value) {
//         formState.model.name = value;
//       },
//       validator: (String value) {
//         return formState
//             .getError(formState.model.getListenerName('name'))
//             ?.message;
//       },
//     );
//   }
// }

// class GenderInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final formState = PropertyChangeProvider.of<ModelFormState<HeroModelForm>>(
//       context,
//       listen: false,
//     ).value;
//     return Container();
//   }
// }
