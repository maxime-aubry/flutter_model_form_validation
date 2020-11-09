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
        body: PropertyChangeProvider(
          value: formState,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NameInput(),
                GenderInput(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formState = FormStateChangeProvider.of<ModelFormState<HeroModelForm>>(
      context,
      listen: false,
    ).value;
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Name *'),
      onChanged: (String value) {
        formState.model.name = value;
      },
      validator: (String value) {
        return formState
            .getError(formState.model.getListenerName('name'))
            ?.message;
      },
    );
  }
}

class GenderInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = genders.toDropdownMenuItems<String>(
      (value, text) => DropdownMenuItem<String>(
        child: Text(text),
        value: value,
      ),
    );
    final formState = FormStateChangeProvider.of<ModelFormState<HeroModelForm>>(
      context,
      listen: false,
    ).value;
    return DropdownButtonFormField(
      decoration: const InputDecoration(labelText: 'Gender *'),
      items: items,
      onChanged: (String value) {
        formState.model.gender = value;
      },
      validator: (String value) {
        return formState
            .getError(formState.model.getListenerName('gender'))
            ?.message;
      },
    );
  }
}

class PowerInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = powers.toDropdownMenuItems<String>(
      (value, text) => DropdownMenuItem<String>(
        child: Text(text),
        value: value,
      ),
    );
    final formState = FormStateChangeProvider.of<ModelFormState<HeroModelForm>>(
      context,
      listen: false,
    ).value;
    return DropdownButtonFormField(
      decoration: const InputDecoration(labelText: 'Gender *'),
      items: items,
      onChanged: (String value) {
        formState.model.gender = value;
      },
      validator: (String value) {
        return formState
            .getError(formState.model.getListenerName('gender'))
            ?.message;
      },
    );
  }
}
