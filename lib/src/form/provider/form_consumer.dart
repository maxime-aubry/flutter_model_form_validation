import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
import 'package:provider/provider.dart';

class FormStateConsumer extends Consumer<ReactiveFormState> {
  FormStateConsumer({
    Key key,
    @required this.builder,
    Widget child,
  })  : assert(builder != null),
        super(key: key, builder: builder, child: child);

  @override
  final Widget Function(
    BuildContext context,
    ReactiveFormState formState,
    Widget child,
  ) builder;
}

class FormGroupConsumer extends Consumer<FormGroup> {
  FormGroupConsumer({
    Key key,
    @required this.builder,
    Widget child,
  })  : assert(builder != null),
        super(key: key, builder: builder, child: child);

  @override
  final Widget Function(
    BuildContext context,
    FormGroup formGroup,
    Widget child,
  ) builder;
}

class FormArrayConsumer extends Consumer<FormArray> {
  FormArrayConsumer({
    Key key,
    @required this.builder,
    Widget child,
  })  : assert(builder != null),
        super(key: key, builder: builder, child: child);

  @override
  final Widget Function(
    BuildContext context,
    FormArray value,
    Widget child,
  ) builder;
}

class FormControlConsumer<TField> extends Consumer<FormControl<TField>> {
  FormControlConsumer({
    Key key,
    @required this.builder,
    Widget child,
  })  : assert(builder != null),
        super(key: key, builder: builder, child: child);

  @override
  final Widget Function(
    BuildContext context,
    FormControl<TField> formControl,
    Widget child,
  ) builder;
}
