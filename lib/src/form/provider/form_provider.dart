import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
import 'package:provider/provider.dart';

class FormStateProvider extends Provider<ReactiveFormState> {
  FormStateProvider({
    Key key,
    @required Create<ReactiveFormState> create,
    Dispose<ReactiveFormState> dispose,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          dispose: dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );

  static ReactiveFormState of(BuildContext context, {bool listen = true}) =>
      Provider.of<ReactiveFormState>(context, listen: listen);
}

class FormGroupProvider extends ChangeNotifierProvider<FormGroup> {
  FormGroupProvider({
    Key key,
    @required Create<FormGroup> create,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          lazy: lazy,
          builder: builder,
          child: child,
        );

  static FormGroup of(BuildContext context, {bool listen = true}) =>
      Provider.of<FormGroup>(context, listen: listen);
}

class FormArrayProvider extends ChangeNotifierProvider<FormArray> {
  FormArrayProvider({
    Key key,
    @required Create<FormArray> create,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          lazy: lazy,
          builder: builder,
          child: child,
        );

  static FormArray of(BuildContext context, {bool listen = true}) =>
      Provider.of<FormArray>(context, listen: listen);
}

class FormControlProvider<TProperty>
    extends ChangeNotifierProvider<FormControl<TProperty>> {
  FormControlProvider({
    Key key,
    @required Create<FormControl<TProperty>> create,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          lazy: lazy,
          builder: builder,
          child: child,
        );

  static FormControl<TProperty> of<TProperty>(BuildContext context,
          {bool listen = true}) =>
      Provider.of<FormControl<TProperty>>(context, listen: listen);
}
