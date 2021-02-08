import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class GreaterOrEqualTo<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  const GreaterOrEqualTo({
    this.valueToCompare,
    this.valueToCompareOnProperty,
    @required String error,
  }) : super(error: error);

  /// [valueToCompare] is default value to compare.
  final TProperty valueToCompare;

  /// [valueToCompareOnProperty] is the name of targeted property that user uses to provide value to compare. This one has priority on [valueToCompare].
  final String valueToCompareOnProperty;

  @override
  Future<bool> isValid(FormControl<TProperty> control, String property) async {
    TProperty remoteValue =
        control.parentGroup.getFormControl<TProperty>(property).value;
    bool isValid = this._validate(control.value, remoteValue);
    return isValid;
  }

  bool _validate(TProperty value, TProperty valueToCompare) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    int comparison = value.compareTo(valueToCompare);
    bool isValid = (comparison >= 0);
    return isValid;
  }
}
