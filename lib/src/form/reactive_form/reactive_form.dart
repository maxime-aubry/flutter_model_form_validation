import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/providers/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
import 'package:provider/single_child_widget.dart';

class ReactiveForm extends SingleChildStatefulWidget {
  final ReactiveFormBuilder formBuilder;
  final ReactiveFormState formState;
  final String step;
  final TransitionBuilder builder;

  ReactiveForm({
    Key key,
    Widget child,
    TransitionBuilder builder,
    @required this.formBuilder,
    String step,
  })  : this.formState = new ReactiveFormState(),
        this.step = step,
        this.builder = builder,
        super(key: key, child: child) {
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
    this._registerStepFormState();

    return Form(
      key: this._formKey,
      autovalidateMode: AutovalidateMode.always,
      child: FormProvider(
        providers: [
          new FormStateProvider.value(value: widget.formState),
          new FormGroupProvider.value(value: widget.formBuilder.group),
        ],
        builder: widget.builder,
        child: child,
      ),
    );
  }

  void _registerStepFormState() {
    try {
      if (widget.step != null) {
        MultipleStepFormStateIndexer indexer =
            context.readMultipleStepFormStateIndexer();
        indexer.addFormState(widget.step, widget.formState);
      }
    } catch (e) {
      throw new Exception('Cannot register FormState of this step.');
    }
  }
}
