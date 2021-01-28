import 'package:example/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class BasicForm extends StatefulWidget {
  static const String routeName = '/basicForm';

  @override
  _BasicFormState createState() => _BasicFormState();
}

class _BasicFormState extends State<BasicForm> {
  final TextEditingController _loginController = new TextEditingController();

  FormBuilder _formBuilder;

  @override
  void initState() {
    super.initState();

    this._formBuilder = new FormBuilder(
      group: new FormGroup(
        controls: {
          'login': new FormControl<String>(
              value: null, validators: [Required(error: 'login is required')]),
          'password': new FormControl<String>(
              value: null,
              validators: [Required(error: 'password is required')]),
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Basic form")),
      drawer: CustomDrawer(),
      body: SmartForm(
        formBuilder: this._formBuilder,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              this._loginInput(),
              this._passwordInput(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginInput() => new FormGroupConsumer(
        builder: (context, formGroup, child) {
          // this._loginController.text = formGroup.controls['']

          return new Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: new TextFormField(
              decoration: InputDecoration(
                labelText: 'Login',
              ),
              keyboardType: TextInputType.text,
              controller: this._loginController,
              onChanged: (String value) {
                formControl.value = value;
              },
            ),
          );
        },
      );

  Widget _passwordInput() => new FormControlConsumer<String>(
        builder: (context, formControl, child) {
          this._loginController.text = formControl.value;

          return new Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: new TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              keyboardType: TextInputType.text,
              controller: this._loginController,
              onChanged: (String value) {
                formControl.value = value;
              },
            ),
          );
        },
      );
}
