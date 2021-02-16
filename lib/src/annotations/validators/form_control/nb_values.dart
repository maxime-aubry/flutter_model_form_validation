import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class NbValues extends FormControlValidatorAnnotation<List> {
  const NbValues({
    this.min,
    this.max,
    this.minOnProperty,
    this.maxOnProperty,
    @required String error,
  }) : super(error: error);

  /// [min] is minimal quantity of items.
  final int min;

  /// [max] is maximal quantity of items.
  final int max;

  /// [minOnProperty] is the name of targeted property that user uses to provide minimal quantity of items of your array. This one has priority on [min] value.
  final String minOnProperty;

  /// [maxOnProperty] is the name of targeted property that user uses to provide maximal quantity of items of your array. This one has priority on [max] value.
  final String maxOnProperty;

  @override
  Future<bool> isValid(FormControl<List> control) async {
    int min = super.getValidatorParameter<int>(
      control,
      this.minOnProperty,
      this.min,
    );
    int max = super.getValidatorParameter<int>(
      control,
      this.maxOnProperty,
      this.max,
    );
    if (min.compareTo(max) > 0)
      throw new ValidationException('Min value is greater than max value.');
    bool isValid = this._validate(control.value.length, min, max);
    return isValid;
  }

  bool _validate(int quantity, int min, int max) =>
      (quantity >= min && quantity <= max);
}
