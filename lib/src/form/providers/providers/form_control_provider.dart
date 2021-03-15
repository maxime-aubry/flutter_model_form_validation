import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:provider/provider.dart';

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

extension FormControlProviderExtension on BuildContext {
  FormControl<TProperty> readFormControl<TProperty>() =>
      FormControlProvider.of<TProperty>(this, listen: false);
  FormControl<TProperty> watchFormControl<TProperty>() =>
      FormControlProvider.of<TProperty>(this, listen: true);
}
