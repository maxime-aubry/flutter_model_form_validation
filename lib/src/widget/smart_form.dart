import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class SmartForm extends SingleChildStatefulWidget {
  final Widget child;
  final FormBuilder formBuilder;
  // final Widget Function(
  //   BuildContext context,
  //   Widget child,
  //   FormStateBase formState,
  // ) builder;

  const SmartForm({
    Key key,
    @required this.child,
    @required this.formBuilder,
    // @required this.builder,
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
          ChangeNotifierProvider(create: (_) => widget.formBuilder.group, child: child),
          Provider(create: (_) => this._formState),
        ],
        child: child,
      ),
    );
  }
}
