import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:provider/provider.dart';

class FormGroupConsumer<TProperty extends ModelForm>
    extends Consumer<TProperty> {
  FormGroupConsumer({
    Key key,
    @required this.builder,
    Widget child,
  })  : assert(builder != null),
        super(key: key, builder: builder, child: child);

  @override
  final Widget Function(
    BuildContext context,
    TProperty value,
    Widget child,
  ) builder;

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return builder(
      context,
      Provider.of<TProperty>(context),
      child,
    );
  }
}

class FormArrayConsumer<TProperty extends ModelForm>
    extends Consumer<FormArrayElement<TProperty>> {
  FormArrayConsumer({
    Key key,
    @required this.builder,
    Widget child,
  })  : assert(builder != null),
        super(key: key, builder: builder, child: child);

  @override
  final Widget Function(
    BuildContext context,
    FormArrayElement<TProperty> value,
    Widget child,
  ) builder;

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return builder(
      context,
      Provider.of<FormArrayElement<TProperty>>(context),
      child,
    );
  }
}

class FormControlConsumer<TProperty> extends Consumer<TProperty> {
  FormControlConsumer({
    Key key,
    @required this.builder,
    Widget child,
  })  : assert(builder != null),
        super(key: key, builder: builder, child: child);

  @override
  final Widget Function(
    BuildContext context,
    TProperty value,
    Widget child,
  ) builder;

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return builder(
      context,
      Provider.of<TProperty>(context),
      child,
    );
  }
}
