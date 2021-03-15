import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:provider/provider.dart';

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
