import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:provider/provider.dart';

class MultipleStepFormStateIndexerProvider
    extends Provider<MultipleStepFormStateIndexer> {
  MultipleStepFormStateIndexerProvider({
    Key key,
    @required Create<MultipleStepFormStateIndexer> create,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          builder: builder,
          child: child,
        );

  static MultipleStepFormStateIndexer of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<MultipleStepFormStateIndexer>(context, listen: listen);

  MultipleStepFormStateIndexerProvider.value({
    Key key,
    @required MultipleStepFormStateIndexer value,
    TransitionBuilder builder,
    Widget child,
  }) : super.value(
          key: key,
          value: value,
          builder: builder,
          child: child,
        );
}

extension MultipleStepFormStateIndexerExtension on BuildContext {
  MultipleStepFormStateIndexer readMultipleStepFormStateIndexer() =>
      MultipleStepFormStateIndexerProvider.of(this, listen: false);
  MultipleStepFormStateIndexer watchMultipleStepFormStateIndexer() =>
      MultipleStepFormStateIndexerProvider.of(this, listen: true);
}
