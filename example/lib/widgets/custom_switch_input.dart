import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class CustomSwitchInput extends StatefulWidget {
  final String label;
  final FormControl<bool> formControl;

  const CustomSwitchInput({
    Key key,
    @required this.label,
    @required this.formControl,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitchInput> {
  @override
  Widget build(BuildContext context) => new FormControlProvider<bool>(
        create: (context) => widget.formControl,
        builder: (context, child) => new Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: new Row(
            children: [
              Expanded(
                child: Text(
                  'display address ?',
                  style: new TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
              Switch(
                value: FormControlProvider.of<bool>(context).value,
                onChanged: (value) {
                  FormControlProvider.of<bool>(context, listen: false)
                      .setValue(value);
                },
              ),
            ],
          ),
        ),
      );
}