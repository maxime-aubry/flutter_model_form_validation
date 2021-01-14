import 'package:example/models.reflectable.dart';
import 'package:example/pages/basic_form/basic_form.dart';
import 'package:example/pages/home.dart';
import 'package:example/pages/stepper_form/add_book.dart';
import 'package:example/pages/stepper_form/stepper_form.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';

void main() {
  initializeReflectable();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Model Form Validation Demo.',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      routes: {
        pageRoutes.home: (context) => Home(),
        pageRoutes.basicForm: (context) => BasicForm(),
        pageRoutes.stepperForm: (context) => StepperForm(),
        pageRoutes.addBook: (context) => AddBook(),
      },
    );
  }
}
