import 'package:example/custom_drawer.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class ReactiveDynamicFormScreen extends StatefulWidget {
  static const String routeName = '/reactiveDynamicForm';

  @override
  _ReactiveDynamicFormScreenState createState() =>
      _ReactiveDynamicFormScreenState();
}

class _ReactiveDynamicFormScreenState extends State<ReactiveDynamicFormScreen> {
  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      builder: (context, formState, formGroup, child) => new Scaffold(
        appBar: AppBar(title: Text("Reactive form")),
        drawer: CustomDrawer(),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              this._firstnameInput(formGroup.controls['firstname']),
              this._lastnameInput(formGroup.controls['lastname']),
              this._shareAddressInput(formGroup.controls['share_address']),
              _AddressFormGroup(parentFormGroup: formGroup),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
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
  final FormGroup parentFormGroup;

  _AddressFormGroup({Key key, this.parentFormGroup}) : super(key: key);

  @override
  _AddressFormGroupState createState() => _AddressFormGroupState();
}

class _AddressFormGroupState extends State<_AddressFormGroup> {
  @override
  Widget build(BuildContext context) => new FormControlProvider<bool>(
        create: (context) => widget.parentFormGroup.controls['share_address']
            as FormControl<bool>,
        builder: (context, child) => new FormControlConsumer<bool>(
          builder: (context, formControl, child) {
            if (formControl.value) {
              FormGroup addressFormGroup =
                  this._addAddress(widget.parentFormGroup);

              return FormGroupProvider(
                create: (context) => addressFormGroup,
                child: Column(
                  children: [
                    this._streetInput(addressFormGroup.controls['street']),
                    this._zipcodeInput(
                      addressFormGroup.controls['zipcode'],
                    ),
                    this._countryInput(
                      addressFormGroup.controls['country'],
                    ),
                  ],
                ),
              );
            }

            this._removeAddress(widget.parentFormGroup);
            return Column();
          },
        ),
      );

  FormGroup _addAddress(FormGroup parentFormGroup) {
    if (!parentFormGroup.containsControl('address')) {
      FormGroup address = new FormGroup(name: 'address', controls: {
        'street': new FormControl<String>(
          value: null,
          validators: [Required(error: 'street is required')],
        ),
        'zipcode': new FormControl<String>(
          value: null,
          validators: [Required(error: 'zip code is required')],
        ),
        'country': new FormControl<String>(
          value: null,
          validators: [Required(error: 'country is required')],
        ),
      });
      parentFormGroup.addControl('address', address);
      return address;
    }

    return null;
  }

  void _removeAddress(FormGroup parentFormGroup) {
    if (parentFormGroup.containsControl('address'))
      parentFormGroup.removeControl('address');
  }

  Widget _streetInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'street', formControl: formControl);

  Widget _zipcodeInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'zip code', formControl: formControl);

  Widget _countryInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'country', formControl: formControl);
}
