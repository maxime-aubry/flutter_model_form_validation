import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:provider/provider.dart';

/// [ReactiveFormStateProvider] provides a [ReactiveFormState] to a form.
/// {@category Providers}
/// {@subCategory Providers}
class ReactiveFormStateProvider extends Provider<ReactiveFormState> {
  // FormStateProvider({
  //   Key key,
  //   @required Create<ReactiveFormState> create,
  //   Dispose<ReactiveFormState> dispose,
  //   bool lazy,
  //   TransitionBuilder builder,
  //   Widget child,
  // }) : super(
  //         key: key,
  //         create: create,
  //         dispose: dispose,
  //         lazy: lazy,
  //         builder: builder,
  //         child: child,
  //       );

  /// [of] provides a [ReactiveFormState].
  /// If [listen] is [True], [ReactiveFormState] will refresh each time the object will change.
  /// 
  /// You can use it just like this :
  /// 
  /// ``` dart
  /// ReactiveFormState formState = ReactiveFormStateProvider.of(context, listen: true);
  /// ```
  static ReactiveFormState of(BuildContext context, {bool listen = true}) =>
      Provider.of<ReactiveFormState>(context, listen: listen);

  /// [ReactiveFormStateProvider] provides a [ReactiveFormState] to a form.
  /// Use it when you want to instanciate a [ReactiveFormState] outside the provider.
  /// 
  /// You can use it just like this :
  /// 
  /// ``` dart
  /// ReactiveFormState reactiveFormState = // ...
  /// 
  /// child: new ReactiveFormStateProvider.value(
  ///   value: reactiveFormState,
  ///   builder: (context, _) {
  ///     return new Container();
  ///   },
  /// );
  /// ```
  ReactiveFormStateProvider.value({
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
  /// [readFormState] gets a [ReactiveFormState] object.
  /// If a widget use this object, it won't rebuild when object changes.
  /// 
  /// You can use it just like this :
  /// 
  /// ``` dart
  /// ReactiveFormState formState = context.readFormState();
  /// ```
  /// 
  /// If form has multiple steps, you can use it juste like it :
  /// 
  /// ``` dart
  /// ReactiveFormState formState = context.readFormState(step: 'step1');
  /// ```
  ReactiveFormState readFormState({String step = null}) {
    //#region locales methods
    ReactiveFormState readState() => ReactiveFormStateProvider.of(this, listen: false);

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

  /// [watchFormState] gets a [ReactiveFormState] object.
  /// If a widget use this object, it will rebuild when object changes.
  /// 
  /// You can use it just like this :
  /// 
  /// ``` dart
  /// ReactiveFormState formState = context.watchFormState();
  /// ```
  /// 
  /// If form has multiple steps, you can use it juste like it :
  /// 
  /// ``` dart
  /// ReactiveFormState formState = context.watchFormState(step: 'step1');
  /// ```
  ReactiveFormState watchFormState({String step = null}) {
    //#region locales methods
    ReactiveFormState watchState() => ReactiveFormStateProvider.of(this, listen: true);

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
