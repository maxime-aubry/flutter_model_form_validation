import 'package:example/models.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../custom_drawer.dart';

class ReactiveFormScreen extends StatefulWidget {
  static const String routeName = '/reactiveForm';

  @override
  _ReactiveFormScreenState createState() => _ReactiveFormScreenState();
}

class _ReactiveFormScreenState extends State<ReactiveFormScreen> {
  List<SelectListItem<EGender>> genders = [
    new SelectListItem<EGender>(EGender.male, 'male'),
    new SelectListItem<EGender>(EGender.female, 'female'),
  ];

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      child: new Scaffold(
        appBar: new AppBar(title: Text("Reactive form")),
        drawer: new CustomDrawer(),
        body: new Padding(
          padding: EdgeInsets.all(5.0),
          child: new FormGroupConsumer(
            builder: (_, formGroup, __) => new Column(
              children: [
                this._firstnameInput(formGroup.controls['firstname']),
                this._lastnameInput(formGroup.controls['lastname']),
                this._genderInput(formGroup.controls['gender']),
              ],
            ),
          ),
        ),
        floatingActionButton: new FormStateConsumer(
          builder: (_, formState, __) => new FloatingActionButton(
            child: Icon(Icons.done),
            onPressed: () async {
              if (await formState.validate()) {
                // Data treatment and post to server here...
              }
            },
          ),
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
          validators: [],
        ),
      );

  Widget _firstnameInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'firstname', formControl: formControl);

  Widget _lastnameInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'lastname', formControl: formControl);

  Widget _genderInput(FormControl<EGender> formControl) =>
      new CustomSingleDropdown<EGender>(
        label: 'gender',
        dataSource: this.genders,
        formControl: formControl,
      );
}
