import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import 'hero_model_form.dart';

List<SelectListItem<String>> genders = [
  new SelectListItem<String>('Male', 'Male'),
  new SelectListItem<String>('Female', 'Female'),
];

List<SelectListItem<String>> powers = [
  new SelectListItem<String>('Fly', 'Fly'),
  new SelectListItem<String>('Laser beams', 'Laser beams'),
  new SelectListItem<String>('Superhuman strength', 'Superhuman strength'),
];

class HeroForm extends StatefulWidget {
  HeroForm({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HeroForm();
}

class _HeroForm extends State<HeroForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ModelFormState<HeroModelForm> formState = new ModelFormState<HeroModelForm>(
    new HeroModelForm(null, null, null, null),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero form',
      home: Scaffold(
        body: PropertyChangeProvider(
          value: formState,
          child: Form(
            key: this._formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                _buildNameInput(this.formState.model.getListenerName('name')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
class HeroForm extends StatelessWidget {
  final ModelFormState<HeroModelForm> formState =
      new ModelFormState<HeroModelForm>(
    new HeroModelForm(null, null, null, null),
  );

  @override
  Widget build(BuildContext context) {
    // register services
    ListItemsProvider.register('getGenderItems', () => genders);
    ListItemsProvider.register('getPowerItems', () => powers);

    return MaterialApp(
      title: 'Property Change Notifier',
      home: Scaffold(
        body:  Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NameInput(formState, formState.model.getListenerName('name')),
                GenderInput(formState, formState.model.getListenerName('gender')),
                //BirthdayInput(formState.model.getListenerName('birth_day')),
                PowersInput(formState, formState.model.getListenerName('powers')),
              ],
            ),
          ),
        ),
      //   body: PropertyChangeProvider(
      //     value: formState,
      //     child: Center(
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           NameInput(formState.model.getListenerName('name')),
      //           ErrorMessage(formState.model.getListenerName('name')),
      //           GenderInput(formState.model.getListenerName('gender')),
      //           BirthdayInput(formState.model.getListenerName('birth_day')),
      //           PowersInput(formState.model.getListenerName('powers')),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}*/

/*Widget _buildNameInput(String listenerName) =>
  PropertyChangeConsumer<ModelFormState<HeroModelForm>>(
    properties: [listenerName],
    builder: (BuildContext context, ModelFormState<HeroModelForm> formState, properties) {
      return TextFormField(
        decoration: const InputDecoration(labelText: 'Name *'),
        onChanged: (String value) async {
          formState.model.name = value;
        },
        validator: (_) {
          String message = formState.getError(listenerName)?.message;
          return message;
        },
      );
    },
  );*/


/*class NameInput extends StatelessWidget {
  NameInput(this._formState, this._listenerName);

  ModelFormState<HeroModelForm> _formState;
  String _listenerName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Name *'),
      onSaved: (String value) {
        //this._formState.model.name = value;
      },
      validator: (String value) {
        // String message = formState.getError(this._listenerName)?.message;
        // return message;
        return null;
      },
    );
    // return PropertyChangeConsumer<ModelFormState<HeroModelForm>>(
    //   properties: [this._listenerName],
    //   builder: (BuildContext context, ModelFormState<HeroModelForm> formState, properties) {
    //     return TextFormField(
    //       decoration: const InputDecoration(labelText: 'Name *'),
    //       onChanged: (String value) async {
    //         formState.model.name = value;
    //       },
    //       validator: (_) {
    //         String message = formState.getError(this._listenerName)?.message;
    //         return message;
    //       },
    //     );
    //   },
    // );
  }
}*/

// class ErrorMessage extends StatelessWidget {
//   ErrorMessage(this._listenerName);

//   String _listenerName;

//   @override
//   Widget build(BuildContext context) {
//     return PropertyChangeConsumer<ModelFormState<HeroModelForm>>(
//       properties: [this._listenerName],
//       builder: (BuildContext context, ModelFormState<HeroModelForm> formState, properties) {
//         return Text(formState.getError(this._listenerName)?.message ?? 'pas d\'erreur');
//       },
//     );
//   }
// }

/*class GenderInput extends StatelessWidget {
  GenderInput(this._formState, this._listenerName);

  ModelFormState<HeroModelForm> _formState;
  String _listenerName;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = genders.toDropdownMenuItems<String>(
      (value, text) => DropdownMenuItem<String>(
        child: Text(text),
        value: value,
      ),
    );
    return DropdownButtonFormField(
      decoration: const InputDecoration(labelText: 'Gender *'),
      items: items,
      onSaved: (String value) {
        this._formState.model.gender = value;
      },
      validator: (String value) {
        // String message = formState.getError(this._listenerName)?.message;
        // return message;
        return null;
      },
    );
    /*return PropertyChangeConsumer<ModelFormState<HeroModelForm>>(
      properties: [this._listenerName],
      builder: (BuildContext context, ModelFormState<HeroModelForm> formState, properties) {
        return DropdownButtonFormField(
          decoration: const InputDecoration(labelText: 'Gender *'),
          items: items,
          onChanged: (String value) {
            formState.model.gender = value;
          },
          validator: (String value) {
            String message = formState.getError(this._listenerName)?.message;
            return message;
          },
        );
      },
    );*/
  }
}

// class BirthdayInput extends StatefulWidget {
//   BirthdayInput(this._formState, this._listenerName);

//   ModelFormState<HeroModelForm> _formState;
//   String _listenerName;

//   @override
//   _BirthdayInputState createState() => _BirthdayInputState();
// }

// class _BirthdayInputState extends State<BirthdayInput> {
//   DateTime _selectedDate;

//   Future<void> _openDatetimePicker(BuildContext context, ModelFormState<HeroModelForm> formState) async {
//     final DateTime d = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: new DateTime(DateTime.now().year),
//       lastDate: new DateTime(DateTime.now().year + 1),
//     );

//     if (d != null) {
//       setState(() {
//         this._selectedDate = d.toLocal();
//         formState.model.birth_day = d.toLocal();
//       });
//     }
//   }

//   @override
//   initState() {
//     super.initState();
//     _selectedDate = DateTime.now();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PropertyChangeConsumer<ModelFormState<HeroModelForm>>(
//       properties: [widget._listenerName],
//       builder: (BuildContext context, ModelFormState<HeroModelForm> formState, properties) {
//         return Row(
//           children: [
//             Text(this._selectedDate.toString()),
//             IconButton(
//               icon: Icon(Icons.calendar_today),
//               onPressed: () => this._openDatetimePicker(context, formState),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

class PowersInput extends StatelessWidget {
  PowersInput(this._formState, this._listenerName);

  ModelFormState<HeroModelForm> _formState;
  String _listenerName;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = powers.toDropdownMenuItems<String>(
      (value, text) => DropdownMenuItem<String>(
        child: Text(text),
        value: value,
      ),
    );
    return DropdownButtonFormField(
      decoration: const InputDecoration(labelText: 'Powers *'),
      items: items,
      onSaved: (String value) {
        this._formState.model.addPower(value);
      },
      validator: (String value) {
        // String message = formState.getError(this._listenerName)?.message;
        // return message;
        return null;
      },
    );
    /*return PropertyChangeConsumer<ModelFormState<HeroModelForm>>(
      properties: [this._listenerName],
      builder: (BuildContext context, ModelFormState<HeroModelForm> formState, properties) {
        return DropdownButtonFormField(
          decoration: const InputDecoration(labelText: 'Powers *'),
          items: items,
          onChanged: (String value) {
            formState.model.addPower(value);
          },
          validator: (String value) {
            String message = formState.getError(this._listenerName)?.message;
            return message;
          },
        );
      },
    );*/
  }
}*/
