import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _NbValuesStub extends ValidatorStub<FormControl<List<String>>, NbValues> {
  _NbValuesStub({
    List<String> value,
    int remoteMin,
    int remoteMax,
    String remoteMinName,
    String remoteMaxName,
    int localMin,
    int localMax,
  }) {
    FormControl<List<String>> _value = new FormControl<List<String>>(
      value: value,
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
    super.validator = NbValues(
      min: localMin,
      max: localMax,
      remoteMin: remoteMinName,
      remoteMax: remoteMaxName,
      error: null,
    );
  }
}

/* Value is valid */
class NbValues_NumberOfValuesIsEqualToMin_Stub extends _NbValuesStub {
  NbValues_NumberOfValuesIsEqualToMin_Stub()
      : super(
          value: ['a'],
          localMin: 1,
          localMax: 3,
        ) {}
}

class NbValues_NumberOfValuesIsEqualToMax_Stub extends _NbValuesStub {
  NbValues_NumberOfValuesIsEqualToMax_Stub()
      : super(
          value: ['a', 'b', 'c'],
          localMin: 1,
          localMax: 3,
        ) {}
}

class NbValues_NumberOfValuesIsBetweenMinAndMax_Stub extends _NbValuesStub {
  NbValues_NumberOfValuesIsBetweenMinAndMax_Stub()
      : super(
          value: ['a', 'b'],
          localMin: 1,
          localMax: 3,
        ) {}
}

class NbValues_ValueIsNull_Stub extends _NbValuesStub {
  NbValues_ValueIsNull_Stub()
      : super(
          value: null,
          localMin: 1,
          localMax: 3,
        ) {}
}

class NbValues_EmptyValue_Stub extends _NbValuesStub {
  NbValues_EmptyValue_Stub()
      : super(
          value: [],
          localMin: 1,
          localMax: 3,
        ) {}
}

/* Value is not valid */
class NbValues_NumberOfValuesIsSmallerThanMin_Stub extends _NbValuesStub {
  NbValues_NumberOfValuesIsSmallerThanMin_Stub()
      : super(
          value: ['a'],
          localMin: 2,
          localMax: 3,
        ) {}
}

class NbValues_NumberOfValuesIsGreaterThanMax_Stub extends _NbValuesStub {
  NbValues_NumberOfValuesIsGreaterThanMax_Stub()
      : super(
          value: ['a', 'b', 'c', 'd'],
          localMin: 2,
          localMax: 3,
        ) {}
}

/* Remote parameters are provided */
class NbValues_remoteMinIsProvided_Stub extends _NbValuesStub {
  NbValues_remoteMinIsProvided_Stub()
      : super(
          value: ['a'],
          remoteMin: 1,
          remoteMinName: 'min',
          localMin: 2,
          localMax: 3,
        ) {}
}

class NbValues_remoteMaxIsProvided_Stub extends _NbValuesStub {
  NbValues_remoteMaxIsProvided_Stub()
      : super(
          value: ['a', 'b', 'c', 'd'],
          remoteMax: 4,
          remoteMaxName: 'max',
          localMin: 1,
          localMax: 3,
        ) {}
}

/* Exceptions on parameters */
class NbValues_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _NbValuesStub {
  NbValues_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          value: ['a'],
          localMax: 3,
        ) {}
}

class NbValues_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _NbValuesStub {
  NbValues_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          value: ['a'],
          localMin: 1,
        ) {}
}

class NbValues_ThrowsValidatorParameterExceptionOnMinGreaterThanMax_Stub
    extends _NbValuesStub {
  NbValues_ThrowsValidatorParameterExceptionOnMinGreaterThanMax_Stub()
      : super(
          value: ['a'],
          localMin: 3,
          localMax: 1,
        ) {}
}
