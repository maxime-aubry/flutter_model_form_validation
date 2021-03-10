import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/provider/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

//enum EFormType { mainForm, subForm }

class ReactiveForm extends SingleChildStatefulWidget {
  final ReactiveFormBuilder formBuilder;
  final ReactiveFormState formState;

  ReactiveForm({
    Key key,
    @required Widget child,
    @required this.formBuilder,
    //EFormType formType = EFormType.mainForm,
  })  : this.formState = new ReactiveFormState(),
        super(key: key, child: child) {
    //if (formType == EFormType.mainForm)
    this.formBuilder.initialize(this.formState);
  }

  @override
  SingleChildState<ReactiveForm> createState() => _ReactiveFormState();
}

class _ReactiveFormState extends SingleChildState<ReactiveForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget.formState.attachFormKey(this._formKey);
  }

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return Form(
      key: this._formKey,
      autovalidateMode: AutovalidateMode.always,
      child: MultiProvider(
        providers: [
          new FormStateProvider(create: (_) => widget.formState),
          new FormGroupProvider(create: (_) => widget.formBuilder.group),
        ],
        /*builder: (context, child) => widget.builder(
          context,
          child,
        ),*/
        child: child,
      ),
    );
  }
}
