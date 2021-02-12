import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../main_stub.dart';

abstract class _IEqualToDateTimeStub
    extends IStub<FormControl<DateTime>, EqualToDateTime> {}

class EqualToDateTime_ValueEqualToValueToCompare_Stub
    extends _IEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 1, 1),
      validators: [],
    );
    return value;
  }

  @override
  EqualToDateTime getValidator() => EqualToDateTime(
        valueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        error: 'value is not valid',
      );
}

class EqualToDateTime_WithExternalValueToCompare_Stub
    extends _IEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> valueToCompare = new FormControl<DateTime>(
      value: new DateTime(2020, 01, 01),
      validators: [],
    );
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2020, 01, 01),
      validators: [],
    );
    FormGroup root = new FormGroup(
      controls: {
        'valueToCompare': valueToCompare,
        'value': value,
      },
      validators: [],
    );

    valueToCompare.parentGroup = root;
    value.parentGroup = root;

    return value;
  }

  @override
  EqualToDateTime getValidator() => EqualToDateTime(
        valueToCompare: const ConstantDateTime('2021-06-01T00:00:00'),
        valueToCompareOnProperty: 'valueToCompare',
        error: 'value is not valid',
      );
}

class EqualToDateTime_ValueNotEqualToValueToCompare_Stub
    extends _IEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2020, 06, 01),
      validators: [],
    );
    return value;
  }

  @override
  EqualToDateTime getValidator() => EqualToDateTime(
        valueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        error: 'value is not valid',
      );
}

class EqualToDateTime_WithMissingValueToCompare_Stub
    extends _IEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2020, 06, 01),
      validators: [],
    );
    return value;
  }

  @override
  EqualToDateTime getValidator() => EqualToDateTime(
        valueToCompare: null,
        error: 'value is not valid',
      );
}
