import 'package:example/custom_drawer.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class ReactiveDynamicForm extends StatefulWidget {
  static const String routeName = '/reactiveDynamicForm';

  @override
  _ReactiveDynamicFormState createState() => _ReactiveDynamicFormState();
}

class _ReactiveDynamicFormState extends State<ReactiveDynamicForm> {
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
              this._firstnameInput(formGroup.controls['firstname']),
              this._lastnameInput(formGroup.controls['lastname']),
              this._shareAddressInput(formGroup.controls['share_address']),
              _AddressFormGroup(formGroup.controls['share_address']),
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

  Widget _firstnameInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'firstname', formControl: formControl);

  Widget _lastnameInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'lastname', formControl: formControl);

  Widget _shareAddressInput(FormControl<bool> formControl) =>
      new CustomSwitchInput(label: 'share address', formControl: formControl);
}

class _AddressFormGroup extends StatefulWidget {
  final FormControl<bool> shareAddress;

  const _AddressFormGroup({Key key, this.shareAddress}) : super(key: key);

  @override
  _AddressFormGroupState createState() => _AddressFormGroupState();
}

class _AddressFormGroupState extends State<_AddressFormGroup> {
  @override
  Widget build(BuildContext context) => new FormControlProvider<bool>(
        create: (context) => widget.shareAddress,
        child: new FormControlConsumer<bool>(
          builder: (context, formControl, child) {
            return Container();
          },
        ),
      );
  /*return FormControlConsumer<bool>(
      builder: (context, formControl, child) {
        if (formControl.value) {
          FormGroup currentFormGroup = this._addAddress(parentFormGroup);

          return FormGroupProvider(
            create: (context) => currentFormGroup,
            child: Column(
              children: [
                this._streetInput(currentFormGroup.controls['street']),
                this._zipcodeInput(currentFormGroup.controls['zipcode']),
                this._countryInput(currentFormGroup.controls['country']),
              ],
            ),
          );
        }

        this._removeAddress(parentFormGroup);
        return Column();
      },
    );*/

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
