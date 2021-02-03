import 'package:example/custom_drawer.dart';
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
  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      builder: (context, formState, __) => new Scaffold(
        appBar: new AppBar(title: Text("Reactive form with dynamic content")),
        drawer: new CustomDrawer(),
        body: new Padding(
          padding: EdgeInsets.all(5.0),
          child: new FormGroupConsumer(
            builder: (_, formGroup, __) => new Column(
              children: [
                this._firstnameInput(formGroup.controls['firstname']),
                this._lastnameInput(formGroup.controls['lastname']),
                this._shareAddressInput(formGroup.controls['share_address']),
                new _AddressFormGroup(),
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
    FormGroup parent = FormGroupProvider.of(context);
    FormGroup addressFormGroup = parent.controls['address'] as FormGroup;

    return new FormControlProvider<bool>(
      create: (_) => parent.controls['share_address'],
      builder: (context, __) {
        FormControl<bool> share_address = FormControlProvider.of<bool>(context);

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
