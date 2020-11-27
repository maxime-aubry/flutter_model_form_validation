import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Model Form Validation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new FormPage(title: 'Flutter Model Form Validation Demo'),
    );
  }
}

class FormPage extends StatefulWidget {
  FormPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ModelFormPage(),
    );
  }
}

class ModelFormPage extends StatefulWidget {
  @override
  _ModelFormPageState createState() => new _ModelFormPageState();
}

class _ModelFormPageState extends State<ModelFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // GlobalKey<FormFieldState> _passKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  int currentStep = 0;
  bool complete = false;
  List<Step> steps = [
    Step(
      title: const Text('New author'),
      isActive: true,
      state: StepState.editing,
      content: new CreateAuthorStep(),
    ),
    Step(
      title: const Text('Books'),
      isActive: true,
      state: StepState.disabled,
      content: new AddBooksStep(),
    ),
  ];

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: Stepper(
              steps: steps,
              currentStep: currentStep,
              onStepContinue: next,
              onStepTapped: (step) => goTo(step),
              onStepCancel: cancel,
            ),
          ),
        ],
      ),
    );
  }
}

//#region STEP : Create author
class CreateAuthorStep extends StatefulWidget {
  @override
  _CreateAuthorStepState createState() => new _CreateAuthorStepState();
}

class _CreateAuthorStepState extends State<CreateAuthorStep> {
  List<SelectListItem<int>> genders = [
    new SelectListItem<int>(0, 'Male'),
    new SelectListItem<int>(1, 'Female'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getFirstname(),
        getLastname(),
        getGender(),
        getBirtdate(),
        getDeathdate(),
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
      );

  Widget getLastname() => new TextFormField(
        decoration: InputDecoration(
          icon: new Icon(Icons.person),
          labelText: 'Last name',
          hintText: 'Last name',
        ),
        keyboardType: TextInputType.text,
      );

  Widget getGender() => new DropdownButtonFormField(
        decoration: InputDecoration(
          icon: new Icon(Icons.wc),
          labelText: 'Gender',
          hintText: 'Gender',
        ),
        items: genders.toDropdownMenuItems<int>(
          (value, text) => new DropdownMenuItem(
            child: new Text(text),
            value: value,
          ),
        ),
        onChanged: (int value) {},
      );

  Widget getBirtdate() => new DateTimeFormField(
        decoration: InputDecoration(
          icon: new Icon(Icons.calendar_today),
          labelText: 'Birth date',
          hintText: 'Birth date',
        ),
        firstDate: new DateTime(0),
        lastDate: DateTime.now(),
        //initialValue: DateTime.now(),
        dateFormat: DateFormat('yyyy/dd/MM'),
        onDateSelected: (DateTime value) {},
        onSaved: (DateTime value) {},
        validator: (DateTime value) {
          return null;
        },
      );

  Widget getDeathdate() => new DateTimeFormField(
        decoration: InputDecoration(
          icon: new Icon(Icons.calendar_today),
          labelText: 'Death date',
          hintText: 'Death date',
        ),
        firstDate: new DateTime(0),
        lastDate: DateTime.now(),
        //initialValue: DateTime.now(),
        dateFormat: DateFormat('yyyy/dd/MM'),
        onDateSelected: (DateTime value) {},
        onSaved: (DateTime value) {},
        validator: (DateTime value) {
          return null;
        },
      );
}
//#endregion

//#region STEP : Add books
class AddBooksStep extends StatefulWidget {
  @override
  _AddBooksStepState createState() => new _AddBooksStepState();
}

class _AddBooksStepState extends State<AddBooksStep> {
  List<SelectListItem<int>> literaryGenres = [
    new SelectListItem<int>(0, 'Humor'),
    new SelectListItem<int>(1, 'Romance'),
    new SelectListItem<int>(2, 'Science fiction'),
    new SelectListItem<int>(3, 'Other'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getAddBookButton(),
        getTitle(),
        getLiteraryGenre(),
        getPrice(),
      ],
    );
  }

  Widget getAddBookButton() => new Align(
        alignment: Alignment.topLeft,
        child: TextButton.icon(
          label: Text('Add book'),
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
      );

  Widget getTitle() => new TextFormField(
        decoration: InputDecoration(
          labelText: 'Title',
          hintText: 'Title',
        ),
        keyboardType: TextInputType.text,
      );

  Widget getLiteraryGenre() => new DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'Literary genre',
          hintText: 'Literary genre',
        ),
        items: literaryGenres.toDropdownMenuItems<int>(
          (value, text) => new DropdownMenuItem(
            child: new Text(text),
            value: value,
          ),
        ),
        onChanged: (int value) {},
      );

  Widget getPrice() => new TextFormField(
        decoration: InputDecoration(
          labelText: 'Price',
          hintText: 'Price',
        ),
        keyboardType: TextInputType.number,
      );
}
//#endregion
