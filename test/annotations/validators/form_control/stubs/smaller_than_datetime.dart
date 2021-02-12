import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

abstract class _ISmallerThanDateTimeStub
    extends IStub<FormControl<DateTime>, SmallerThanDateTime> {}

class SmallerThanDateTime_ValueIsSmallerThanValueToCompare_Stub
    extends _ISmallerThanDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2020, 12, 31),
      validators: [],
    );
    return value;
  }

  @override
  SmallerThanDateTime getValidator() => SmallerThanDateTime(
        valueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        error: 'value is not valid',
      );
}

class SmallerThanDateTime_ValueToCompareIsNull_Stub
    extends _ISmallerThanDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 1, 1),
      validators: [],
    );
    return value;
  }

  @override
  SmallerThanDateTime getValidator() => SmallerThanDateTime(
        valueToCompare: null,
        error: 'value is not valid',
      );
}

class SmallerThanDateTime_ValueIsGreaterThanValueToCompare_Stub
    extends _ISmallerThanDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 1, 1),
      validators: [],
    );
    return value;
  }

  @override
  SmallerThanDateTime getValidator() => SmallerThanDateTime(
        valueToCompare: const ConstantDateTime('2020-12-31T00:00:00'),
        error: 'value is not valid',
      );
}
