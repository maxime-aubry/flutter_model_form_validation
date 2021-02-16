import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stub.dart';

class _INbItemsStub extends IStub<FormArray, NbItems> {
  _INbItemsStub({
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
      minOnProperty: (fcMin != null) ? 'min' : null,
      maxOnProperty: (fcMax != null) ? 'max' : null,
      error: '',
    );
  }
}

/* Value is valid */
class INbItems_ArraySizeIsEqualToMin_Stub extends _INbItemsStub {
  INbItems_ArraySizeIsEqualToMin_Stub() : super(
    fcValue: [
      new FormGroup(controls: {}, validators: []),
    ],
    validatorMin: 1,
    validatorMax: 3,
  );
}

class INbItems_ArraySizeIsEqualToMax_Stub extends _INbItemsStub {
  INbItems_ArraySizeIsEqualToMax_Stub() : super(
    fcValue: [
      new FormGroup(controls: {}, validators: []),
      new FormGroup(controls: {}, validators: []),
      new FormGroup(controls: {}, validators: []),
    ],
    validatorMin: 1,
    validatorMax: 3,
  );
}

class INbItems_ArraySizeIsBetweenMinAndMax_Stub extends _INbItemsStub {
  INbItems_ArraySizeIsBetweenMinAndMax_Stub() : super(
    fcValue: [
      new FormGroup(controls: {}, validators: []),
      new FormGroup(controls: {}, validators: []),
    ],
    validatorMin: 1,
    validatorMax: 3,
  );
}

class INbItems_ArrayIsNull_Stub extends _INbItemsStub {
  INbItems_ArrayIsNull_Stub() : super(
    fcValue: null,
    validatorMin: 1,
    validatorMax: 3,
  );
}

class INbItems_ArrayIsEmpty_Stub extends _INbItemsStub {
  INbItems_ArrayIsEmpty_Stub() : super(
    fcValue: [],
    validatorMin: 1,
    validatorMax: 3,
  );
}

/* Value is not valid */
class INbItems_ArraySizeIsSmallerThanMin_Stub extends _INbItemsStub {
  INbItems_ArraySizeIsSmallerThanMin_Stub() : super(
    fcValue: [
      new FormGroup(controls: {}, validators: []),
    ],
    validatorMin: 2,
    validatorMax: 3,
  );
}

class INbItems_ArraySizeIsGreaterThanMax_Stub extends _INbItemsStub {
  INbItems_ArraySizeIsGreaterThanMax_Stub() : super(
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
class INbItems_MinOnProrpertyIsProvided_Stub extends _INbItemsStub {
  INbItems_MinOnProrpertyIsProvided_Stub() : super(
    fcValue: [
      new FormGroup(controls: {}, validators: []),
    ],
    fcMin: 1,
    validatorMin: 2,
    validatorMax: 3,
  );
}

class INbItems_MaxOnProrpertyIsProvided_Stub extends _INbItemsStub {
  INbItems_MaxOnProrpertyIsProvided_Stub() : super(
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

/* None parameter is provided */
class INbItems_ThrowsValidatorParameterExceptionOnNullMin_Stub extends _INbItemsStub {
  INbItems_ThrowsValidatorParameterExceptionOnNullMin_Stub() : super(
    fcValue: [],
    validatorMax: 3,
  );
}

class INbItems_ThrowsValidatorParameterExceptionOnNullMax_Stub extends _INbItemsStub {
  INbItems_ThrowsValidatorParameterExceptionOnNullMax_Stub() : super(
    fcValue: [],
    validatorMin: 1,
  );
}
