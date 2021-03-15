import 'package:example/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return new ReactiveForm(
      step: 'profile',
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        return Container();
      },
    );
  }

  ReactiveFormBuilder _getFormBuilder() => new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'firstname': new FormControl<String>(
              value: null,
              validators: [Required(error: 'firstname is required.')],
            ),
            'lastname': new FormControl<String>(
              value: null,
              validators: [Required(error: 'lastname is required.')],
            ),
            'gender': new FormControl<EGender>(
              value: null,
              validators: [
                Required(error: 'gender is required.'),
                SingleSelect(
                  serviceName: 'getListOfGenders',
                  error: 'unknown gender.',
                )
              ],
            ),
          },
          validators: [],
        ),
      );
}
