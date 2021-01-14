import 'package:date_field/date_field.dart';
import 'package:example/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:intl/intl.dart';

class AuthorStep extends StatefulWidget {
  final ModelFormState mfs;

  const AuthorStep({Key key, this.mfs}) : super(key: key);

  @override
  _AuthorStepState createState() => new _AuthorStepState();
}

class _AuthorStepState extends State<AuthorStep> {
  final List<SelectListItem<EGender>> genders = [
    new SelectListItem<EGender>(EGender.Male, 'Male'),
    new SelectListItem<EGender>(EGender.Female, 'Female'),
  ];

  Reader reader;

  @protected
  void initState() {
    this.reader = (widget.mfs.model as StepForm).reader.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getFirstname(),
        getLastname(),
        getGender(),
        getBirtdate(),
        getSubscriptionDate(),
      ],
    );
  }

  Widget getFirstname() => new TextFormField(
        decoration: InputDecoration(
          icon: new Icon(Icons.person),
          labelText: 'First name',
          hintText: 'First name',
        ),
        keyboardType: TextInputType.text,
        onChanged: (String value) {
          this.reader.firstName.value = value;
        },
      );

  Widget getLastname() => new TextFormField(
        decoration: InputDecoration(
          icon: new Icon(Icons.person),
          labelText: 'Last name',
          hintText: 'Last name',
        ),
        keyboardType: TextInputType.text,
        onChanged: (String value) {
          this.reader.lastName.value = value;
        },
      );

  Widget getGender() => new DropdownButtonFormField(
        decoration: InputDecoration(
          icon: new Icon(Icons.wc),
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
      );

  Widget getBirtdate() => new DateTimeFormField(
        decoration: InputDecoration(
          icon: new Icon(Icons.calendar_today),
          labelText: 'Birth date',
          hintText: 'Birth date',
        ),
        firstDate: new DateTime(0),
        lastDate: DateTime.now(),
        dateFormat: DateFormat('yyyy/dd/MM'),
        onDateSelected: (DateTime value) {
          this.reader.birthDay.value = value;
        },
      );

  Widget getSubscriptionDate() => new DateTimeFormField(
        decoration: InputDecoration(
          icon: new Icon(Icons.calendar_today),
          labelText: 'Subscription date',
          hintText: 'Subscription date',
        ),
        firstDate: new DateTime(0),
        lastDate: DateTime.now(),
        dateFormat: DateFormat('yyyy/dd/MM'),
        onDateSelected: (DateTime value) {
          this.reader.subscriptionDate.value = value;
        },
      );
}
