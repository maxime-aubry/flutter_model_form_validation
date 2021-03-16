import 'package:example/models.reflectable.dart';
import 'package:example/pages/index.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

void main() {
  initializeReflectable();
  LibraryInitializer.initialize(libraryName: 'example.models');
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
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', 'US')],
      home: Home(),
      routes: {
        pageRoutes.home: (context) => Home(),
        pageRoutes.inputNumber: (context) => InputNumber(),
        pageRoutes.inputText: (context) => InputText(),
        pageRoutes.inputDateTime: (context) => InputDateTime(),
        pageRoutes.reactiveForm: (context) => ReactiveFormScreen(),
        pageRoutes.reactiveFormWithDynamicContent: (context) =>
            ReactiveFormWithDynamicContentScreen(),
        pageRoutes.reactiveFormWithFormArray: (context) =>
            ReactiveFormWithFormArrayScreen(),
        pageRoutes.reactiveMultipleStepsForm: (context) =>
            ReactiveMultipleStepsFormScreen(),
      },
    );
  }
}
