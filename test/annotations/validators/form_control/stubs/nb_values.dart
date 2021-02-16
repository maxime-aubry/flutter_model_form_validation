import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _NbValuesStub extends IStub<FormControl<List<String>>, NbValues> {
  _NbValuesStub({
    List<String> fcValue,
    int fcMin,
    int fcMax,
    int validatorMin,
    int validatorMax,
  }) {
    FormControl<List<String>> _value = new FormControl<List<String>>(
      value: fcValue,
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
    super.validator = NbValues(
      min: validatorMin,
      max: validatorMax,
      minOnProperty: (fcMin != null) ? 'min' : null,
      maxOnProperty: (fcMax != null) ? 'max' : null,
      error: 'invalid number of values',
    );
  }
}

/* Value is valid */
class NbValues_NumberOfValuesIsEqualToMin_Stub extends _NbValuesStub {
  NbValues_NumberOfValuesIsEqualToMin_Stub()
      : super(
          fcValue: ['a'],
          validatorMin: 1,
          validatorMax: 3,
        ) {}
}

class NbValues_NumberOfValuesIsEqualToMax_Stub extends _NbValuesStub {
  NbValues_NumberOfValuesIsEqualToMax_Stub()
      : super(
          fcValue: ['a', 'b', 'c'],
          validatorMin: 1,
          validatorMax: 3,
        ) {}
}

class NbValues_NumberOfValuesIsBetweenMinAndMax_Stub extends _NbValuesStub {
  NbValues_NumberOfValuesIsBetweenMinAndMax_Stub()
      : super(
          fcValue: ['a', 'b'],
          validatorMin: 1,
          validatorMax: 3,
        ) {}
}

class NbValues_ValueIsNull_Stub extends _NbValuesStub {
  NbValues_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorMin: 1,
          validatorMax: 3,
        ) {}
}

class NbValues_EmptyValue_Stub extends _NbValuesStub {
  NbValues_EmptyValue_Stub()
      : super(
          fcValue: [],
          validatorMin: 1,
          validatorMax: 3,
        ) {}
}

/* Value is not valid */
class NbValues_UnallowedNumberOfValues_Stub extends _NbValuesStub {
  NbValues_UnallowedNumberOfValues_Stub()
      : super(
          fcValue: ['a', 'b', 'c', 'd'],
          validatorMin: 1,
          validatorMax: 3,
        ) {}
}

/* Remote parameters are provided */
class NbValues_MinOnPropertyIsProvided_Stub extends _NbValuesStub {
  NbValues_MinOnPropertyIsProvided_Stub()
      : super(
          fcValue: ['a'],
          fcMin: 1,
          validatorMin: 2,
          validatorMax: 3,
        ) {}
}

class NbValues_MaxOnPropertyIsProvided_Stub extends _NbValuesStub {
  NbValues_MaxOnPropertyIsProvided_Stub()
      : super(
          fcValue: ['a', 'b', 'c', 'd'],
          fcMax: 4,
          validatorMin: 1,
          validatorMax: 3,
        ) {}
}

/* Exceptions on parameters */
class NbValues_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _NbValuesStub {
  NbValues_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(fcValue: []) {}
}

class NbValues_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _NbValuesStub {
  NbValues_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(fcValue: []) {}
}
