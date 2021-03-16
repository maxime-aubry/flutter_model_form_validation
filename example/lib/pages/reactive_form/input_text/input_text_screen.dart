import 'package:example/custom_drawer.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class InputText extends StatefulWidget {
  static const String routeName = '/inputText';

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        FormGroup root = context.watchFormGroup();
        FormControl<String> formControl = root.getFormControl<String>('field');

        return new Scaffold(
          appBar: new AppBar(title: Text("Input text")),
          drawer: new CustomDrawer(),
          body: new Padding(
            padding: EdgeInsets.all(5.0),
            child: this.getInput(formControl),
          ),
          floatingActionButton: new FloatingActionButton(
            child: Icon(Icons.done),
            onPressed: () async {
              ReactiveFormState formState = context.readFormState();
              if (await formState.validate()) {
                // Data treatment and post to server here...
              }
            },
          ),
        );
      },
    );
  }

  ReactiveFormBuilder _getFormBuilder() => new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'field': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        ),
      );

  Widget getInput(FormControl<String> formControl) => new CustomTextInput(
        label: 'input',
        formControl: formControl,
      );
}