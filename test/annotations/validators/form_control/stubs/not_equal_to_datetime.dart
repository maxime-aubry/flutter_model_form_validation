import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

abstract class _INotEqualToDateTimeStub
    extends IStub<FormControl<DateTime>, NotEqualToDateTime> {}

class NotEqualToDateTime_ValueNotEqualToValueToCompare_Stub
    extends _INotEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 1, 2),
      validators: [],
    );
    return value;
  }

  @override
  NotEqualToDateTime getValidator() => NotEqualToDateTime(
        valueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        error: 'value is not valid',
      );
}

class NotEqualToDateTime_WithExternalValueToCompare_Stub
    extends _INotEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> valueToCompare = new FormControl<DateTime>(
      value: new DateTime(2020, 01, 01),
      validators: [],
    );
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2020, 01, 02),
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
  NotEqualToDateTime getValidator() => NotEqualToDateTime(
        valueToCompare: const ConstantDateTime('2021-06-01T00:00:00'),
        valueToCompareOnProperty: 'valueToCompare',
        error: 'value is not valid',
      );
}

class NotEqualToDateTime_ValueEqualToValueToCompare_Stub
    extends _INotEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 01, 01),
      validators: [],
    );
    return value;
  }

  @override
  NotEqualToDateTime getValidator() => NotEqualToDateTime(
        valueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        error: 'value is not valid',
      );
}

class NotEqualToDateTime_WithMissingValueToCompare_Stub
    extends _INotEqualToDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2020, 06, 01),
      validators: [],
    );
    return value;
  }

  @override
  NotEqualToDateTime getValidator() => NotEqualToDateTime(
        valueToCompare: null,
        error: 'value is not valid',
      );
}
