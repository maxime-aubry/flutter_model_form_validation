import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:provider/single_child_widget.dart';

class MultipleStepFormContainer extends SingleChildStatefulWidget {
  final TransitionBuilder builder;

  MultipleStepFormContainer({
    Key key,
    Widget child,
    @required this.builder,
  }) : super(key: key, child: child) {}

  @override
  SingleChildState<MultipleStepFormContainer> createState() =>
      _MultipleStepFormContainerState();
}

class _MultipleStepFormContainerState
    extends SingleChildState<MultipleStepFormContainer> {
  @override
  Widget buildWithChild(BuildContext context, Widget child) =>
      new MultipleStepFormStateIndexerProvider(
        create: (_) => new MultipleStepFormStateIndexer(),
        builder: widget.builder,
        child: child,
      );
}
