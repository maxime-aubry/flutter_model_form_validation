import 'package:example/main.reflectable.dart';
import 'package:flutter/material.dart';

import 'hero_form.dart';

void main() {
  initializeReflectable();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HeroForm(),
    );
  }
}
