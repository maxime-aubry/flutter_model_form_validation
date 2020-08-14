import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper;
import 'model_form_state.dart';

/// [ModelFormUtilities] is a statis class utility that provides methods to validate your form with BlOcs.
class ModelFormUtilities {
  /// Provides a deep copy of your viewmodel.
  static TViewmodel getDeepCopy<TViewmodel>(TViewmodel viewmodel) =>
      JsonMapper.deserialize<TViewmodel>(JsonMapper.serialize(viewmodel));

  /// [refreshWhen] refreshes your widget.
  /// [previous] and [current] are both states of your application, before and after changes.
  /// [condition] is an optional parameter function. If you provide it, you can refresh each widget for its own property into the viewmodel.
  /// If you don't provide it, all your inputs will be refreshed (and so validated) each time you will change a value into the viewmodel.
  static bool refreshWhen<TFormState extends ModelFormState<TModel>, TModel>(
      TFormState previous, TFormState current,
      [bool Function(TFormState p, TFormState c) condition]) {
    if (previous.viewmodel == null && current.viewmodel == null) return false;
    if (condition != null)
      return condition(previous, current);
    else
      return (previous != current);
  }

  /// [getErrorMessage] provides an error message to display.
  /// [state] is your current state, that contains your viewmodel to validate.
  /// [protpertyName] is the name of the property you wan't to get the error message.
  static String
      getErrorMessage<TFormState extends ModelFormState<TModel>, TModel>(
    TFormState state,
    String propertyName,
  ) {
    if (state == null) return null;
    if (state.errors == null) return null;
    return state.errors[propertyName]?.error;
  }
}
