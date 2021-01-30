import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class CustomTextInput extends StatefulWidget {
  final String label;
  final FormControl<String> formControl;

  const CustomTextInput({
    Key key,
    @required this.label,
    @required this.formControl,
  }) : super(key: key);

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) => new Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: new TextFormField(
          decoration: InputDecoration(labelText: widget.label),
          keyboardType: TextInputType.text,
          controller: new TextEditingController(text: widget.formControl.value),
          onChanged: (value) async => await widget.formControl.setValue(value),
          validator: (value) => widget.formControl.error?.message,
        ),
      );
}
