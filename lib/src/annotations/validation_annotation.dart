import 'package:flutter/widgets.dart';

/// [ValidationAnnotation] is the parent class for every validators you will create and use.
/// {@category Metadata}
/// {@subCategory ValidationAnnotation}
abstract class ValidationAnnotation<TValue> {
  const ValidationAnnotation({
    @required this.criticityLevel,
    @required this.error,
  });

  /// This reprensents the order of execution for validation. If a validator returns false, the queue will stop on this point. Nexts validators won't be fired.
  final int criticityLevel;

  /// This is the error to display (provided by developers).
  final String error;

  /// Verify if the model is valid compared to the current validator You must add [value] parameter, this one is your current property to validate.
  /// [model] parameter is also required, even if your custom validator won't use it.
  /// It reprensents your full object model with all values.
  /// Maybe you would validate a property in comparison to others.
  Future<bool> isValid<TModel>(TValue value, TModel model);
}
