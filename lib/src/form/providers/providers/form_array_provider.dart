import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:provider/provider.dart';

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

extension FormArrayProviderExtension on BuildContext {
  FormArray readFormArray() => FormArrayProvider.of(this, listen: false);
  FormArray watchFormArray() => FormArrayProvider.of(this, listen: true);
}
