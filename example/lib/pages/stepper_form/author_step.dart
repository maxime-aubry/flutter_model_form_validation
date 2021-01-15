import 'package:date_time_picker/date_time_picker.dart';
import 'package:example/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class AuthorStep extends StatefulWidget {
  final ModelFormState mfs;

  const AuthorStep({Key key, this.mfs}) : super(key: key);

  @override
  _AuthorStepState createState() => new _AuthorStepState();
}

class _AuthorStepState extends State<AuthorStep> {
  final List<SelectListItem<EGender>> genders = [
    new SelectListItem<EGender>(EGender.male, 'Male'),
    new SelectListItem<EGender>(EGender.female, 'Female'),
  ];

  Reader reader;

  @protected
  void initState() {
    this.reader = (widget.mfs.model as StepForm).reader.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: [
          getFirstname(),
          getLastname(),
          getGender(),
          getBirtdate(),
          getSubscriptionDate(),
        ],
      ),
    );
  }

  Widget getFirstname() => new Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: new TextFormField(
          decoration: InputDecoration(
            labelText: 'First name',
            hintText: 'First name',
          ),
          keyboardType: TextInputType.text,
          onChanged: (String value) {
            this.reader.firstName.value = value;
          },
        ),
      );

  Widget getLastname() => new Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: new TextFormField(
          decoration: InputDecoration(
            labelText: 'Last name',
            hintText: 'Last name',
          ),
          keyboardType: TextInputType.text,
          onChanged: (String value) {
            this.reader.lastName.value = value;
          },
        ),
      );

  Widget getGender() => new Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: new DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'Gender',
          hintText: 'Gender',
        ),
        items: genders.toDropdownMenuItems<EGender>(
          (value, text) => new DropdownMenuItem(
            child: new Text(text),
            value: value,
          ),
        ),
        onChanged: (EGender value) {
          this.reader.gender.value = value;
        },
      ));

  Widget getBirtdate() => new DateTimePicker(
        decoration: InputDecoration(
          labelText: 'Birth date',
          hintText: 'Birth date of the book',
        ),
        type: DateTimePickerType.date,
        dateMask: 'd MMM, yyyy',
        firstDate: new DateTime(0),
        lastDate: DateTime.now(),
        icon: Icon(Icons.event),
        dateLabelText: 'Birth date',
        onChanged: (String value) {
          this.reader.birthDay.value = DateFormat('yyyy-M-d').parse(value);
        },
      );

  Widget getSubscriptionDate() => new DateTimePicker(
        decoration: InputDecoration(
          labelText: 'Subscription date',
          hintText: 'Subscription date of the book',
        ),
        type: DateTimePickerType.date,
        dateMask: 'd MMM, yyyy',
        firstDate: new DateTime(0),
        lastDate: DateTime.now(),
        icon: Icon(Icons.event),
        dateLabelText: 'Subscription date',
        onChanged: (String value) {
          this.reader.subscriptionDate.value =
              DateFormat('yyyy-M-d').parse(value);
        },
      );
}
