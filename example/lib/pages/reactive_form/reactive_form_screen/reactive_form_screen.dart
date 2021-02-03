import 'package:example/custom_drawer.dart';
import 'package:example/models.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class ReactiveFormScreen extends StatefulWidget {
  static const String routeName = '/reactiveForm';

  @override
  _ReactiveFormScreenState createState() => _ReactiveFormScreenState();
}

class _ReactiveFormScreenState extends State<ReactiveFormScreen> {
  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      builder: (context, formState, __) => new Scaffold(
        appBar: new AppBar(title: Text("Reactive form")),
        drawer: new CustomDrawer(),
        body: new Padding(
          padding: EdgeInsets.all(5.0),
          child: new FormGroupConsumer(
            builder: (_, formGroup, __) => new Column(
              children: [
                this._firstnameInput(formGroup.controls['firstname']),
                this._lastnameInput(formGroup.controls['lastname']),
                //this._genderInput(formGroup.controls['gender']),
              ],
            ),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () async {
            if (await formState.validate()) {
              // Data treatment and post to server here...
            }
          },
          child: Icon(Icons.done),
        ),
      ),
    );
  }

  ReactiveFormBuilder _getFormBuilder() => new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'firstname': new FormControl<String>(
              value: null,
              validators: [Required(error: 'firstname is required')],
            ),
            'lastname': new FormControl<String>(
              value: null,
              validators: [Required(error: 'lastname is required')],
            ),
            'gender': new FormControl<EGender>(
              value: null,
              validators: [Required(error: 'gender is required')],
            ),
          },
        ),
      );

  Widget _firstnameInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'firstname', formControl: formControl);

  Widget _lastnameInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'lastname', formControl: formControl);

  Widget _genderInput(FormControl<EGender> formControl) =>
      new CustomSingleDropdown<EGender>(
        label: 'gender',
        dataSource: [],
        value: FormControlProvider.of<EGender>(context).value,
        onChange: (value) {
          FormControlProvider.of<EGender>(context, listen: false)
              .setValue(value.value);
        },
      );
}
