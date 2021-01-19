import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class FormGroupProvider<TProperty extends ModelForm,
        Controller extends FormGroupElement<TProperty>>
    extends SingleChildStatelessWidget {
  FormGroupProvider({
    Key key,
    @required this.create,
    Widget child,
  }) : super(key: key, child: child);

  final Create<Controller> create;

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return InheritedProvider<Controller>(
      create: create,
      builder: (context, _) {
        return ValueListenableProvider<TProperty>.value(
          value: context.watch<Controller>(),
          child: child,
        );
      },
    );
  }
}

class FormArrayProvider<TProperty extends ModelForm,
        Controller extends FormArrayElement<TProperty>>
    extends SingleChildStatelessWidget {
  FormArrayProvider({
    Key key,
    @required this.create,
    Widget child,
  }) : super(key: key, child: child);

  final Create<Controller> create;

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return InheritedProvider<Controller>(
      create: create,
      builder: (context, _) {
        return ValueListenableProvider<FormArrayItems<TProperty>>.value(
          value: context.watch<Controller>(),
          child: child,
        );
      },
    );
  }
}

class FormControlProvider<TProperty extends ModelForm,
        Controller extends FormControlElement<TProperty>>
    extends SingleChildStatelessWidget {
  FormControlProvider({
    Key key,
    @required this.create,
    Widget child,
  }) : super(key: key, child: child);

  final Create<Controller> create;

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return InheritedProvider<Controller>(
      create: create,
      builder: (context, _) {
        return ValueListenableProvider<TProperty>.value(
          value: context.watch<Controller>(),
          child: child,
        );
      },
    );
  }
}
