import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:provider/provider.dart';

class FormStateProvider extends Provider<ReactiveFormState> {
  FormStateProvider({
    Key key,
    @required Create<ReactiveFormState> create,
    Dispose<ReactiveFormState> dispose,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          dispose: dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );

  static ReactiveFormState of(BuildContext context, {bool listen = true}) =>
      Provider.of<ReactiveFormState>(context, listen: listen);

  FormStateProvider.value({
    Key key,
    @required ReactiveFormState value,
    UpdateShouldNotify<ReactiveFormState> updateShouldNotify,
    TransitionBuilder builder,
    Widget child,
  }) : super.value(
          key: key,
          value: value,
          updateShouldNotify: updateShouldNotify,
          builder: builder,
          child: child,
        );
}

extension FormStateProviderExtension on BuildContext {
  ReactiveFormState readFormState({String step = null}) {
    //#region locales methods
    ReactiveFormState readState() => FormStateProvider.of(this, listen: false);

    ReactiveFormState readStepState() {
      MultipleStepFormStateIndexer indexer =
          this.readMultipleStepFormStateIndexer();
      ReactiveFormState formState = indexer.getFormState(step);
      return formState;
    }
    //#endregion

    if (step == null) return readState();
    return readStepState();
  }

  ReactiveFormState watchFormState({String step = null}) {
    //#region locales methods
    ReactiveFormState watchState() => FormStateProvider.of(this, listen: true);

    ReactiveFormState watchStepState() {
      MultipleStepFormStateIndexer indexer =
          this.watchMultipleStepFormStateIndexer();
      ReactiveFormState formState = indexer.getFormState(step);
      return formState;
    }
    //#endregion

    if (step == null) return watchState();
    return watchStepState();
  }
}
