import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_model_form_validation/src/providers/index.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class SmartForm extends SingleChildStatefulWidget {
  final FormBuilder formBuilder;
  final Widget Function(BuildContext context, FormStateBase formState,
      FormGroup formGroup, Widget child) builder;

  SmartForm({
    Key key,
    Widget child,
    @required this.formBuilder,
    @required this.builder,
  }) : super(key: key, child: child);

  @override
  SingleChildState<SmartForm> createState() => _SmartFormState();
}

class _SmartFormState extends SingleChildState<SmartForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormStateBase _formState;

  @override
  void initState() {
    super.initState();
    this._formState = new FormStateBase(formBuilder: widget.formBuilder);
    this._formState.initialize();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return Form(
      key: this._formKey,
      autovalidateMode: AutovalidateMode.always,
      child: MultiProvider(
        providers: [
          FormBuilderProvider(create: (_) => widget.formBuilder),
          FormGroupProvider(create: (_) => widget.formBuilder.group),
          FormStateProvider(create: (_) => this._formState),
        ],
        child: widget.builder(
          context,
          this._formState,
          widget.formBuilder.group,
          child,
        ),
      ),
    );
  }
}
