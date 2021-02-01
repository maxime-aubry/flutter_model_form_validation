import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
import 'package:provider/provider.dart';

// class FormGroupConsumer<TProperty extends ModelForm> extends ValueListenableBuilder<TProperty> {
//   FormGroupConsumer({
//     Key key,
//     FormGroupElement<TProperty> valueListenable,
//     ValueWidgetBuilder<TProperty> builder,
//     Widget child,
//   }) : super(key: key, valueListenable: valueListenable, builder: builder, child: child);
// }

// class FormArrayConsumer<TProperty extends ModelForm> extends ValueListenableBuilder<FormArrayItems<TProperty>> {
//   FormArrayConsumer({
//     Key key,
//     FormArrayElement<TProperty> valueListenable,
//     ValueWidgetBuilder<FormArrayItems<TProperty>> builder,
//     Widget child,
//   }) : super(key: key, valueListenable: valueListenable, builder: builder, child: child);
// }

// class FormControlConsumer<TProperty extends ModelForm> extends ValueListenableBuilder<TProperty> {
//   FormControlConsumer({
//     Key key,
//     FormControlElement<TProperty> valueListenable,
//     ValueWidgetBuilder<TProperty> builder,
//     Widget child,
//   }) : super(key: key, valueListenable: valueListenable, builder: builder, child: child);
// }

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

// class FormControlConsumer<TField> extends Consumer<FormControl<TField>> {
//   FormControlConsumer({
//     Key key,
//     @required this.name,
//     @required this.builder,
//     Widget child,
//   })  : assert(builder != null),
//         super(key: key, builder: builder, child: child);

//   final String name;

//   @override
//   final Widget Function(
//     BuildContext context,
//     FormControl<TField> value,
//     Widget child,
//   ) builder;

//   @override
//   Widget buildWithChild(BuildContext context, Widget child) {
//     return builder(
//       context,
//       this._getFormControl(context),
//       child,
//     );
//   }

//   FormControl _getFormControl(BuildContext context) {
//     try {
//       FormGroup formGroup = Provider.of<FormGroup>(context);

//       if (!formGroup.containsControl(this.name))
//         throw new FormConsumerException('Form group does not contain any abstract control named ${this.name}.');

//       if (formGroup.controls[this.name] is! FormControl)
//         throw new FormConsumerException('Abstract control named ${this.name} is not a form control.');

//       return formGroup.controls[this.name] as FormControl;
//     } on Exception catch (e) {
//       throw e;
//     }
//   }
// }
