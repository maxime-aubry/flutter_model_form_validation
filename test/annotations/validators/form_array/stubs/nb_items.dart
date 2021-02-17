import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stubs.dart';

class _NbItemsStub extends ValidatorStub<FormArray, NbItems> {
  _NbItemsStub({
    List<FormGroup> fcValue,
    int fcMin,
    int fcMax,
    int validatorMin,
    int validatorMax,
  }) {
    FormArray _value = new FormArray(
      groups: fcValue,
      validators: [],
    );
    FormControl<int> _min = new FormControl<int>(
      value: fcMin,
      validators: [],
    );
    FormControl<int> _max = new FormControl<int>(
      value: fcMax,
      validators: [],
    );
    FormGroup _root = new FormGroup(
      controls: {
        'value': _value,
        'min': _min,
        'max': _max,
      },
      validators: [],
    );

    _value.parentGroup = _root;
    _min.parentGroup = _root;
    _max.parentGroup = _root;

    super.control = _value;
    super.validator = NbItems(
      min: validatorMin,
      max: validatorMax,
      remoteMin: (fcMin != null) ? 'min' : null,
      remoteMax: (fcMax != null) ? 'max' : null,
      error: '',
    );
  }
}

/* Value is valid */
class NbItems_ArraySizeIsEqualToMin_Stub extends _NbItemsStub {
  NbItems_ArraySizeIsEqualToMin_Stub()
      : super(
          fcValue: [
            new FormGroup(controls: {}, validators: []),
          ],
          validatorMin: 1,
          validatorMax: 3,
        );
}

class NbItems_ArraySizeIsEqualToMax_Stub extends _NbItemsStub {
  NbItems_ArraySizeIsEqualToMax_Stub()
      : super(
          fcValue: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
          validatorMin: 1,
          validatorMax: 3,
        );
}

class NbItems_ArraySizeIsBetweenMinAndMax_Stub extends _NbItemsStub {
  NbItems_ArraySizeIsBetweenMinAndMax_Stub()
      : super(
          fcValue: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
          validatorMin: 1,
          validatorMax: 3,
        );
}

class NbItems_ArrayIsNull_Stub extends _NbItemsStub {
  NbItems_ArrayIsNull_Stub()
      : super(
          fcValue: null,
          validatorMin: 1,
          validatorMax: 3,
        );
}

class NbItems_ArrayIsEmpty_Stub extends _NbItemsStub {
  NbItems_ArrayIsEmpty_Stub()
      : super(
          fcValue: [],
          validatorMin: 1,
          validatorMax: 3,
        );
}

/* Value is not valid */
class NbItems_ArraySizeIsSmallerThanMin_Stub extends _NbItemsStub {
  NbItems_ArraySizeIsSmallerThanMin_Stub()
      : super(
          fcValue: [
            new FormGroup(controls: {}, validators: []),
          ],
          validatorMin: 2,
          validatorMax: 3,
        );
}

class NbItems_ArraySizeIsGreaterThanMax_Stub extends _NbItemsStub {
  NbItems_ArraySizeIsGreaterThanMax_Stub()
      : super(
          fcValue: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
          validatorMin: 2,
          validatorMax: 3,
        );
}

/* Remote parameters are provided */
class NbItems_MinOnProrpertyIsProvided_Stub extends _NbItemsStub {
  NbItems_MinOnProrpertyIsProvided_Stub()
      : super(
          fcValue: [
            new FormGroup(controls: {}, validators: []),
          ],
          fcMin: 1,
          validatorMin: 2,
          validatorMax: 3,
        );
}

class NbItems_MaxOnProrpertyIsProvided_Stub extends _NbItemsStub {
  NbItems_MaxOnProrpertyIsProvided_Stub()
      : super(
          fcValue: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
          fcMax: 4,
          validatorMin: 2,
          validatorMax: 3,
        );
}

/* Exceptions on parameters */
class NbItems_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _NbItemsStub {
  NbItems_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          fcValue: [],
          validatorMax: 3,
        );
}

class NbItems_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _NbItemsStub {
  NbItems_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          fcValue: [],
          validatorMin: 1,
        );
}

class NbItems_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub
    extends _NbItemsStub {
  NbItems_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub()
      : super(
          fcValue: [],
          validatorMin: 3,
          validatorMax: 1,
        );
}
