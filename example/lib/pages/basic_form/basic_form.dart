import 'package:example/custom_drawer.dart';
import 'package:flutter/material.dart';

class BasicForm extends StatefulWidget {
  static const String routeName = '/basicForm';

  @override
  _BasicFormState createState() => _BasicFormState();
}

class _BasicFormState extends State<BasicForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Basic form")),
      drawer: CustomDrawer(),
      body: Form(
        key: _formKey,
        child: Center(child: Text("This is basic form")),
      ),
    );
  }
}
