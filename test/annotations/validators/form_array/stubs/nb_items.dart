import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stubs.dart';

class _NbItemsStub extends ValidatorStub<FormArray, NbItems> {
  _NbItemsStub({
    List<FormGroup> value,
    int remoteMin,
    int remoteMax,
    String remoteMinName,
    String remoteMaxName,
    int localMin,
    int localMax,
  }) {
    FormArray _value = new FormArray(
      groups: value,
      validators: [],
    );
    FormControl<int> _min = new FormControl<int>(
      value: remoteMin,
      validators: [],
    );
    FormControl<int> _max = new FormControl<int>(
      value: remoteMax,
      validators: [],
    );

    Map<String, AbstractControl> controls = {'value': _value};
    if (remoteMinName != null) controls[remoteMinName] = _min;
    if (remoteMaxName != null) controls[remoteMaxName] = _max;

    FormGroup _root = new FormGroup(
      controls: controls,
      validators: [],
    );

    _value.parentGroup = _root;
    _min.parentGroup = _root;
    _max.parentGroup = _root;

    super.control = _value;
    super.validator = NbItems(
      min: localMin,
      max: localMax,
      remoteMin: remoteMinName,
      remoteMax: remoteMaxName,
      error: null,
    );
  }
}

/* Value is valid */
class NbItems_ArraySizeIsEqualToMin_Stub extends _NbItemsStub {
  NbItems_ArraySizeIsEqualToMin_Stub()
      : super(
          value: [
            new FormGroup(controls: {}, validators: []),
          ],
          localMin: 1,
          localMax: 3,
        );
}

class NbItems_ArraySizeIsEqualToMax_Stub extends _NbItemsStub {
  NbItems_ArraySizeIsEqualToMax_Stub()
      : super(
          value: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
          localMin: 1,
          localMax: 3,
        );
}

class NbItems_ArraySizeIsBetweenMinAndMax_Stub extends _NbItemsStub {
  NbItems_ArraySizeIsBetweenMinAndMax_Stub()
      : super(
          value: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
          localMin: 1,
          localMax: 3,
        );
}

/* Value is not valid */
class NbItems_ArrayIsNull_Stub extends _NbItemsStub {
  NbItems_ArrayIsNull_Stub()
      : super(
          value: null,
          localMin: 1,
          localMax: 3,
        );
}

class NbItems_ArraySizeIsSmallerThanMin_Stub extends _NbItemsStub {
  NbItems_ArraySizeIsSmallerThanMin_Stub()
      : super(
          value: [
            new FormGroup(controls: {}, validators: []),
          ],
          localMin: 2,
          localMax: 3,
        );
}

class NbItems_ArraySizeIsGreaterThanMax_Stub extends _NbItemsStub {
  NbItems_ArraySizeIsGreaterThanMax_Stub()
      : super(
          value: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
          localMin: 2,
          localMax: 3,
        );
}

/* Remote parameters are provided */
class NbItems_MinOnProrpertyIsProvided_Stub extends _NbItemsStub {
  NbItems_MinOnProrpertyIsProvided_Stub()
      : super(
          value: [
            new FormGroup(controls: {}, validators: []),
          ],
          remoteMin: 1,
          remoteMinName: 'min',
          localMin: 2,
          localMax: 3,
        );
}

class NbItems_MaxOnProrpertyIsProvided_Stub extends _NbItemsStub {
  NbItems_MaxOnProrpertyIsProvided_Stub()
      : super(
          value: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
          remoteMax: 4,
          remoteMaxName: 'max',
          localMin: 2,
          localMax: 3,
        );
}

/* Exceptions on parameters */
class NbItems_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _NbItemsStub {
  NbItems_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          value: [],
          localMax: 3,
        );
}

class NbItems_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _NbItemsStub {
  NbItems_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          value: [],
          localMin: 1,
        );
}

class NbItems_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub
    extends _NbItemsStub {
  NbItems_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub()
      : super(
          value: [],
          localMin: 3,
          localMax: 1,
        );
}
