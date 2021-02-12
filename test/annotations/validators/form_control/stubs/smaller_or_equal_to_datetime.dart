import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

abstract class _ISmallerOrEqualToDateTimeStub
    extends IStub<FormControl<DateTime>, SmallerOrEqualToDateTime> {}

class SmallerOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub
    extends _ISmallerOrEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2020, 12, 31),
      validators: [],
    );
    return value;
  }

  @override
  SmallerOrEqualToDateTime getValidator() => SmallerOrEqualToDateTime(
        valueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        error: 'value is not valid',
      );
}

class SmallerOrEqualToDateTime_ValueIsEqualToValueToCompare_Stub
    extends _ISmallerOrEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 1, 1),
      validators: [],
    );
    return value;
  }

  @override
  SmallerOrEqualToDateTime getValidator() => SmallerOrEqualToDateTime(
        valueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        error: 'value is not valid',
      );
}

class SmallerOrEqualToDateTime_ValueToCompareIsNull_Stub
    extends _ISmallerOrEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 1, 1),
      validators: [],
    );
    return value;
  }

  @override
  SmallerOrEqualToDateTime getValidator() => SmallerOrEqualToDateTime(
        valueToCompare: null,
        error: 'value is not valid',
      );
}

class SmallerOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub
    extends _ISmallerOrEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 1, 1),
      validators: [],
    );
    return value;
  }

  @override
  SmallerOrEqualToDateTime getValidator() => SmallerOrEqualToDateTime(
        valueToCompare: const ConstantDateTime('2020-12-31T00:00:00'),
        error: 'value is not valid',
      );
}
