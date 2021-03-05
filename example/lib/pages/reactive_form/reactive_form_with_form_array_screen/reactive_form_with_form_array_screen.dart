import 'package:example/custom_drawer.dart';
import 'package:example/models.dart';
import 'package:example/pages/index.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class ReactiveFormWithFormArrayScreen extends StatefulWidget {
  static const String routeName = '/reactiveFormWithFormArray';

  @override
  _ReactiveFormWithFormArrayScreenState createState() =>
      _ReactiveFormWithFormArrayScreenState();
}

class _ReactiveFormWithFormArrayScreenState
    extends State<ReactiveFormWithFormArrayScreen> {
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
        body: new SingleChildScrollView(
          child: new Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: new FormGroupConsumer(
              builder: (_, root, __) => new Column(
                children: [
                  this._firstnameInput(
                    root.getFormControl<String>('firstname'),
                  ),
                  this._lastnameInput(root.getFormControl<String>('lastname')),
                  this._genderInput(root.getFormControl<EGender>('gender')),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: const Text(
                        'Social links',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  new SocialLinksArray(),
                ],
              ),
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
            'social_links': new FormArray(
              groups: [
                new FormGroup(
                  controls: {
                    'social_network': new FormControl<ESocialNetwork>(
                      value: ESocialNetwork.github,
                      validators: [],
                    ),
                    'url': new FormControl<String>(
                      value: 'azerty',
                      validators: [],
                    ),
                  },
                  validators: [],
                ),
              ],
              validators: [NbItems(min: 1, max: 3, error: 'error')],
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
