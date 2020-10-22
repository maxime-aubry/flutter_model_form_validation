import 'package:equatable/equatable.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_error.dart';

/// [ModelFormState] is the parent class of your state class if you want to use BlOcs.
/// {@category BlOcs support}
class ModelFormState<TViewModel> extends Equatable {
  const ModelFormState({
    this.viewmodel,
    this.isValid = false,
    this.errors = const {},
  });

  /// [viewmodel] is a generic property that contains the model of your form.
  final TViewModel viewmodel;

  /// [isValid] informs if form is valid or not.
  final bool isValid;

  /// [errors] contains all error messages about model form validation.
  final Map<String, ValidationError> errors;

  @override
  List<Object> get props => [
        viewmodel,
        isValid,
        errors,
      ];
}
