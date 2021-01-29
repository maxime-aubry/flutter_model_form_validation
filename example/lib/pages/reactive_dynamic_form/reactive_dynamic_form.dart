import 'package:example/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:provider/provider.dart';

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
              new FormControlProvider<bool>(
                create: (context) => formGroup.controls['share_address'],
                builder: (context, child) => Column(
                  children: [
                    this._shareAddressInput(context),
                    this._displayAddress(context, formGroup),
                  ],
                ),
              ),
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

  Widget _firstnameInput(FormControl<String> formControl) => new Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: new TextFormField(
          decoration: InputDecoration(labelText: 'firstname'),
          keyboardType: TextInputType.text,
          controller: new TextEditingController(text: formControl.value),
          onChanged: (value) async {
            await formControl.setValue(value);
          },
          validator: (value) => formControl.error?.message,
        ),
      );

  Widget _lastnameInput(FormControl<String> formControl) => new Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: new TextFormField(
          decoration: InputDecoration(labelText: 'lastname'),
          keyboardType: TextInputType.text,
          controller: new TextEditingController(text: formControl.value),
          onChanged: (value) async {
            await formControl.setValue(value);
          },
          validator: (value) => formControl.error?.message,
        ),
      );

  Widget _shareAddressInput(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text('display address ?')),
        Switch(
          value: Provider.of<FormControl<bool>>(context).value,
          onChanged: (value) {
            Provider.of<FormControl<bool>>(context, listen: false)
                .setValue(value);
          },
        ),
      ],
    );
  }

  Widget _displayAddress(BuildContext context, FormGroup parentFormGroup) =>
      new FormControlConsumer<bool>(
        builder: (context, formControl, child) {
          if (formControl.value) {
            this._addAddress(parentFormGroup);
            return Column(
              children: [
                this._streetInput(parentFormGroup.controls['street']),
              ],
            );
          } else {
            this._removeAddress(parentFormGroup);
          }
          return Column();
        },
      );

  void _addAddress(FormGroup parentFormGroup) {
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
    }
  }

  void _removeAddress(FormGroup parentFormGroup) {
    if (parentFormGroup.containsControl('address'))
      parentFormGroup.removeControl('address');
  }

  Widget _streetInput(FormControl<String> formControl) => new Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: new TextFormField(
          decoration: InputDecoration(labelText: 'street'),
          keyboardType: TextInputType.text,
          controller: new TextEditingController(text: formControl.value),
          onChanged: (value) async {
            await formControl.setValue(value);
          },
          validator: (value) => formControl.error?.message,
        ),
      );
}
