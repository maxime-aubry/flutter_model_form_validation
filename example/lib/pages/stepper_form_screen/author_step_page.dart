// import 'package:date_time_picker/date_time_picker.dart';
// import 'package:example/models.dart';
// import 'package:example/widgets/custom_singledropdown.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

// class AuthorStepPage extends StatefulWidget {
//   @override
//   _AuthorStepPageState createState() => new _AuthorStepPageState();
// }

// class _AuthorStepPageState extends State<AuthorStepPage> {
//   final List<SelectListItem<EGender>> genders = [
//     new SelectListItem<EGender>(EGender.male, 'Male'),
//     new SelectListItem<EGender>(EGender.female, 'Female'),
//   ];

//   final TextEditingController _firstNameController =
//       new TextEditingController();
//   final TextEditingController _lastNameController = new TextEditingController();

//   @override
//   void dispose() {
//     this._firstNameController.dispose();
//     this._lastNameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(5.0),
//       child: new FormGroupConsumer<AuthorStep>(
//         builder: (context, authorStep, child) => Column(
//           children: [
//             getFirstname(authorStep),
//             getLastname(authorStep),
//             getGender(authorStep),
//             getBirtdate(authorStep),
//             getSubscriptionDate(authorStep),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget getFirstname(AuthorStep authorStep) {
//     this._firstNameController.text = authorStep.firstName.value;

//     return new Padding(
//       padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
//       child: new TextFormField(
//         decoration: InputDecoration(
//           labelText: 'First name',
//         ),
//         keyboardType: TextInputType.text,
//         controller: this._firstNameController,
//         onChanged: (String value) {
//           authorStep.firstName.value = value;
//         },
//       ),
//     );
//   }

//   Widget getLastname(AuthorStep authorStep) {
//     this._lastNameController.text = authorStep.lastName.value;

//     return new Padding(
//       padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
//       child: new TextFormField(
//         decoration: InputDecoration(
//           labelText: 'Last name',
//         ),
//         keyboardType: TextInputType.text,
//         controller: this._lastNameController,
//         onChanged: (String value) {
//           authorStep.lastName.value = value;
//         },
//       ),
//     );
//   }

//   Widget getGender(AuthorStep authorStep) => CustomSingleDropdown<EGender>(
//         label: 'Gender',
//         dataSource: this.genders,
//         value: authorStep.gender.value,
//         onChange: (state) {
//           authorStep.gender.value = state.value;
//         },
//       );

//   Widget getBirtdate(AuthorStep authorStep) {
//     final DateFormat formatter = DateFormat('yyyy-MM-dd');
//     String _initialValue = (authorStep.birthDay.value != null)
//         ? formatter.format(authorStep.birthDay.value)
//         : null;

//     return new Padding(
//       padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
//       child: new DateTimePicker(
//         decoration: InputDecoration(
//           labelText: 'Birth date',
//         ),
//         type: DateTimePickerType.date,
//         dateMask: 'd MMM, yyyy',
//         firstDate: new DateTime(0),
//         lastDate: DateTime.now(),
//         initialValue: _initialValue,
//         icon: Icon(Icons.event),
//         dateLabelText: 'Birth date',
//         onChanged: (String value) {
//           authorStep.birthDay.value = DateFormat('yyyy-MM-dd').parse(value);
//         },
//       ),
//     );
//   }

//   Widget getSubscriptionDate(AuthorStep authorStep) {
//     final DateFormat formatter = DateFormat('yyyy-MM-dd');
//     String _initialValue = (authorStep.subscriptionDate.value != null)
//         ? formatter.format(authorStep.subscriptionDate.value)
//         : null;

//     return new Padding(
//       padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
//       child: new DateTimePicker(
//         decoration: InputDecoration(
//           labelText: 'Subscription date',
//         ),
//         type: DateTimePickerType.date,
//         dateMask: 'd MMM, yyyy',
//         firstDate: new DateTime(0),
//         lastDate: DateTime.now(),
//         initialValue: _initialValue,
//         icon: Icon(Icons.event),
//         dateLabelText: 'Subscription date',
//         onChanged: (String value) {
//           authorStep.subscriptionDate.value =
//               DateFormat('yyyy-M-d').parse(value);
//         },
//       ),
//     );
//   }
// }
