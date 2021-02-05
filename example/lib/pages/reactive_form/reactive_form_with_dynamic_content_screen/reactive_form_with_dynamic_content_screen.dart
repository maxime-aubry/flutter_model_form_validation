import 'package:example/custom_drawer.dart';
import 'package:example/models.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class ReactiveFormWithDynamicContentScreen extends StatefulWidget {
  static const String routeName = '/reactiveFormWithDynamicContent';

  @override
  _ReactiveFormWithDynamicContentState createState() =>
      _ReactiveFormWithDynamicContentState();
}

class _ReactiveFormWithDynamicContentState
    extends State<ReactiveFormWithDynamicContentScreen> {
  List<SelectListItem<EGender>> genders = [
    new SelectListItem<EGender>(EGender.male, 'male'),
    new SelectListItem<EGender>(EGender.female, 'female'),
  ];

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      //context: new MainFormContext(formBuilder: this._getFormBuilder()),
      formBuilder: this._getFormBuilder(),
      child: new Scaffold(
        appBar: new AppBar(title: Text("Reactive form with dynamic content")),
        drawer: new CustomDrawer(),
        body: new Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: new FormGroupConsumer(
            builder: (_, formGroup, __) => new Column(
              children: [
                this._firstnameInput(formGroup.controls['firstname']),
                this._lastnameInput(formGroup.controls['lastname']),
                this._genderInput(formGroup.controls['gender']),
                this._shareAddressInput(formGroup.controls['share_address']),
                new _AddressFormGroup(),
              ],
            ),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () async {
            ReactiveFormState formState = context.readFormState();

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
            'share_address': new FormControl<bool>(value: false),
            'address': new FormGroup(
              controls: {},
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
        dataSource: this.genders,
        formControl: formControl,
      );

  Widget _shareAddressInput(FormControl<bool> formControl) =>
      new CustomSwitchInput(label: 'share address', formControl: formControl);
}

class _AddressFormGroup extends StatefulWidget {
  @override
  _AddressFormGroupState createState() => _AddressFormGroupState();
}

class _AddressFormGroupState extends State<_AddressFormGroup> {
  @override
  Widget build(BuildContext context) {
    FormGroup parent = context.watchFormGroup();

    return new FormControlProvider<bool>(
      create: (_) => parent.controls['share_address'],
      builder: (context, __) {
        FormGroup addressFormGroup = parent.controls['address'] as FormGroup;
        FormControl<bool> share_address = context.watchFormControl<bool>();

        if (share_address.value) {
          this._enableAddress(addressFormGroup);

          return new Column(
            children: [
              this._streetInput(addressFormGroup.controls['street']),
              this._zipcodeInput(addressFormGroup.controls['zipcode']),
              this._countryInput(addressFormGroup.controls['country']),
            ],
          );
        }

        if (!share_address.value) {
          this._disableAddress(addressFormGroup);
          return new Column();
        }

        return new Column();
      },
    );
  }

  void _enableAddress(FormGroup formGroup) {
    if (!formGroup.containsControl('street')) {
      formGroup.addControl(
        'street',
        new FormControl<String>(
          value: null,
          validators: [Required(error: 'street is required')],
        ),
      );
    }

    if (!formGroup.containsControl('zipcode')) {
      formGroup.addControl(
        'zipcode',
        new FormControl<String>(
          value: null,
          validators: [Required(error: 'zip code is required')],
        ),
      );
    }

    if (!formGroup.containsControl('country')) {
      formGroup.addControl(
        'country',
        new FormControl<String>(
          value: null,
          validators: [Required(error: 'country is required')],
        ),
      );
    }
  }

  void _disableAddress(FormGroup formGroup) {
    if (formGroup.containsControl('street')) {
      formGroup.removeControl('street');
    }

    if (formGroup.containsControl('zipcode')) {
      formGroup.removeControl('zipcode');
    }

    if (formGroup.containsControl('country')) {
      formGroup.removeControl('country');
    }
  }

  Widget _streetInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'street', formControl: formControl);

  Widget _zipcodeInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'zip code', formControl: formControl);

  Widget _countryInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'country', formControl: formControl);
}
