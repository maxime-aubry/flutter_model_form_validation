import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/provider/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ReactiveForm extends SingleChildStatefulWidget {
  final ReactiveFormBuilder formBuilder;
  final Widget Function(
    BuildContext context,
    ReactiveFormState formState,
    Widget child,
  ) builder;

  ReactiveForm({
    Key key,
    Widget child,
    @required this.formBuilder,
    @required this.builder,
  }) : super(key: key, child: child);

  @override
  SingleChildState<ReactiveForm> createState() => _ReactiveFormState();
}

class _ReactiveFormState extends SingleChildState<ReactiveForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ReactiveFormState _formState;

  @override
  void initState() {
    super.initState();
    this._formState = new ReactiveFormState(
      formBuilder: widget.formBuilder,
      formKey: this._formKey,
    );
    this._formState.initialize();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return Form(
      key: this._formKey,
      autovalidateMode: AutovalidateMode.always,
      child: MultiProvider(
        providers: [
          new FormStateProvider(create: (_) => this._formState),
          new FormGroupProvider(create: (_) => widget.formBuilder.group),
        ],
        child: widget.builder(
          context,
          this._formState,
          child,
        ),
      ),
    );
  }
}
