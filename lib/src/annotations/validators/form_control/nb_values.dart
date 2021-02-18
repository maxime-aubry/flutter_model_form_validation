import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class NbValues extends FormControlValidatorAnnotation<List> {
  const NbValues({
    this.min,
    this.max,
    this.remoteMin,
    this.remoteMax,
    @required String error,
  }) : super(error: error);

  /// [min] is minimal quantity of items.
  final int min;

  /// [max] is maximal quantity of items.
  final int max;

  /// [remoteMin] is the name of targeted property that user uses to provide minimal quantity of items of your array. This one has priority on [min] value.
  final String remoteMin;

  /// [remoteMax] is the name of targeted property that user uses to provide maximal quantity of items of your array. This one has priority on [max] value.
  final String remoteMax;

  @override
  Future<bool> isValid(FormControl<List> control) async {
    int min = super.getRemoteValidatorParameter<int>(
      defaultValue: this.min,
      localParameterName: 'min',
      remoteParameterName: this.remoteMin,
      control: control.parentGroup,
    );
    int max = super.getRemoteValidatorParameter<int>(
      defaultValue: this.max,
      localParameterName: 'max',
      remoteParameterName: this.remoteMax,
      control: control.parentGroup,
    );

    this._validateParameters(min, max);
    bool isValid = this._validate(control.value.length, min, max);
    return isValid;
  }

  void _validateParameters(int min, int max) {
    if (min == null)
      throw new ValidatorParameterException('Min is not defined.');

    if (max == null)
      throw new ValidatorParameterException('Max is not defined.');

    if (min.compareTo(max) > 0)
      throw new ValidationException('Min value is greater than max value.');
  }

  bool _validate(int quantity, int min, int max) =>
      (quantity >= min && quantity <= max);
}
