import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class NbItems extends FormArrayValidatorAnnotation {
  const NbItems({
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
  Future<bool> isValid(FormArray control, String property) async {
    int min =
        control.parentGroup.getFormControl<int>(this.minOnProperty).value ??
            this.min;
    int max =
        control.parentGroup.getFormControl<int>(this.maxOnProperty).value ??
            this.max;
    bool isValid = this._validate(control.groups.length, min, max);
    return isValid;
  }

  bool _validate(int quantity, int min, int max) =>
      (quantity >= min && quantity <= max);
}
