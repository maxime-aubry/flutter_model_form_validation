import 'package:example/hero_model_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

class HeroForm extends StatelessWidget {
  final ModelFormState<HeroModelForm> formState = new ModelFormState<HeroModelForm>(
    new HeroModelForm(null, null, null, null),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Change Notifier',
      home: Scaffold(
        body: PropertyChangeProvider(
          value: formState,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [],
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
    return PropertyChangeConsumer<ModelFormState<HeroModelForm>>(
      builder: (context, formState, properties) {
        if (properties.isEmpty) return Container();
        return Text('$properties changed');
      },
    );
  }
}