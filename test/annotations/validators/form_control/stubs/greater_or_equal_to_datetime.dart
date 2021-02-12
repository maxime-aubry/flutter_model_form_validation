import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../main_stub.dart';

abstract class _IGreaterOrEqualToDateTimeStub
    extends IStub<FormControl<DateTime>, GreaterOrEqualToDateTime> {}

class GreaterOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub
    extends _IGreaterOrEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 1, 1),
      validators: [],
    );
    return value;
  }

  @override
  GreaterOrEqualToDateTime getValidator() => GreaterOrEqualToDateTime(
        valueToCompare: const ConstantDateTime('2021-01-02T00:00:00'),
        error: 'value is not valid',
      );
}

class GreaterOrEqualToDateTime_ValueIsEqualToValueToCompare_Stub
    extends _IGreaterOrEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 1, 1),
      validators: [],
    );
    return value;
  }

  @override
  GreaterOrEqualToDateTime getValidator() => GreaterOrEqualToDateTime(
        valueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        error: 'value is not valid',
      );
}

class GreaterOrEqualToDateTime_ValueToCompareIsNull_Stub
    extends _IGreaterOrEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 1, 1),
      validators: [],
    );
    return value;
  }

  @override
  GreaterOrEqualToDateTime getValidator() => GreaterOrEqualToDateTime(
        valueToCompare: null,
        error: 'value is not valid',
      );
}

class GreaterOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub
    extends _IGreaterOrEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2020, 12, 31),
      validators: [],
    );
    return value;
  }

  @override
  GreaterOrEqualToDateTime getValidator() => GreaterOrEqualToDateTime(
        valueToCompare: const ConstantDateTime('2021-01-02T00:00:00'),
        error: 'value is not valid',
      );
}
