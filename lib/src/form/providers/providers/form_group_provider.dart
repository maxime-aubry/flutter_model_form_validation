import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:provider/provider.dart';

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

extension FormGroupProviderExtension on BuildContext {
  FormGroup readFormGroup() => FormGroupProvider.of(this, listen: false);
  FormGroup watchFormGroup() => FormGroupProvider.of(this, listen: true);
}
