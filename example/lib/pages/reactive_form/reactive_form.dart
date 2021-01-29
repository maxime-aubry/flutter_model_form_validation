import 'package:example/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class ReactiveForm extends StatefulWidget {
  static const String routeName = '/reactiveForm';

  @override
  _ReactiveFormState createState() => _ReactiveFormState();
}

class _ReactiveFormState extends State<ReactiveForm> {
  final TextEditingController _firstnameController =
      new TextEditingController();
  final TextEditingController _lastnameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Reactive form")),
      drawer: CustomDrawer(),
      body: SmartForm(
        formBuilder: this._getFormBuilder(),
        builder: (context, formState, formGroup, child) => Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              this._firstnameInput(
                  formGroup.controls['firstname'] as FormControl<String>),
              this._lastnameInput(
                  formGroup.controls['lastname'] as FormControl<String>),
            ],
          ),
        ),
      ),
    );
  }

  FormBuilder _getFormBuilder() => new FormBuilder(
        group: new FormGroup(
          controls: {
            'firstname': new FormControl<String>(
              value: null,
              validators: [
                Required(error: 'firstname is required'),
                StringLength(
                  min: 3,
                  max: 5,
                  error: 'string length must be between 3 and 5.',
                )
              ],
            ),
            'lastname': new FormControl<String>(
              value: null,
              validators: [Required(error: 'lastname is required')],
            ),
            'share_address': new FormControl<bool>(value: false),
          },
        ),
      );

  Widget _firstnameInput(FormControl<String> formControl) {
    this._firstnameController.text = formControl.value;

    return new Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: new TextFormField(
        decoration: InputDecoration(labelText: 'firstname'),
        keyboardType: TextInputType.text,
        controller: this._firstnameController,
        onChanged: (value) async {
          await formControl.setValue(value);
        },
        validator: (value) => formControl.error?.message,
      ),
    );
  }

  Widget _lastnameInput(FormControl<String> formControl) {
    this._lastnameController.text = formControl.value;

    return new Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: new TextFormField(
        decoration: InputDecoration(labelText: 'lastname'),
        keyboardType: TextInputType.text,
        controller: this._lastnameController,
        onChanged: (value) async {
          await formControl.setValue(value);
        },
        validator: (value) => formControl.error?.message,
      ),
    );
  }
}
