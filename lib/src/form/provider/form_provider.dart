import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
import 'package:provider/provider.dart';

extension ReadContext on BuildContext {
  ReactiveFormState readFormState() =>
      FormStateProvider.of(this, listen: false);
  ReactiveFormState watchFormState() =>
      FormStateProvider.of(this, listen: true);

  FormGroup readFormGroup() => FormGroupProvider.of(this, listen: false);
  FormGroup watchFormGroup() => FormGroupProvider.of(this, listen: true);

  FormArray readFormArray() => FormArrayProvider.of(this, listen: false);
  FormArray watchFormArray() => FormArrayProvider.of(this, listen: true);

  FormControl<TProperty> readFormControl<TProperty>() =>
      FormControlProvider.of<TProperty>(this, listen: false);
  FormControl<TProperty> watchFormControl<TProperty>() =>
      FormControlProvider.of<TProperty>(this, listen: true);
}

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

  FormStateProvider.value({
    Key key,
    @required ReactiveFormState value,
    UpdateShouldNotify<ReactiveFormState> updateShouldNotify,
    TransitionBuilder builder,
    Widget child,
  }) : super.value(
          key: key,
          value: value,
          updateShouldNotify: updateShouldNotify,
          builder: builder,
          child: child,
        );
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

  FormGroupProvider.value({
    Key key,
    @required FormGroup value,
    TransitionBuilder builder,
    Widget child,
  }) : super.value(
          key: key,
          value: value,
          builder: builder,
          child: child,
        );
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

  FormArrayProvider.value({
    Key key,
    @required FormArray value,
    TransitionBuilder builder,
    Widget child,
  }) : super.value(
          key: key,
          value: value,
          builder: builder,
          child: child,
        );
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

  static FormControl<TProperty> of<TProperty>(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<FormControl<TProperty>>(context, listen: listen);

  FormControlProvider.value({
    Key key,
    @required FormControl<TProperty> value,
    TransitionBuilder builder,
    Widget child,
  }) : super.value(
          key: key,
          value: value,
          builder: builder,
          child: child,
        );
}
