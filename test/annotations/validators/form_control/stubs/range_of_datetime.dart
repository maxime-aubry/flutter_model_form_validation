import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../main_stub.dart';

abstract class _IRangeOfDateTimeStub
    extends IStub<FormControl, RangeOfDateTime> {}

class RangeOfDateTimeEqualToMinStub extends _IRangeOfDateTimeStub {
  @override
  FormControl getControl() {
    FormControl formControl = new FormControl<DateTime>(
      value: new DateTime(2021, 1, 1),
      validators: [],
    );
    return formControl;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: const ConstantDateTime('2021-12-31T23:59:59'),
        error: 'invalid datetime into range.',
      );
}

class RangeOfDateTimeEqualToMaxStub extends _IRangeOfDateTimeStub {
  @override
  FormControl getControl() {
    FormControl formControl = new FormControl<DateTime>(
      value: new DateTime(2021, 12, 31),
      validators: [],
    );
    return formControl;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: const ConstantDateTime('2021-12-31T23:59:59'),
        error: 'invalid datetime into range.',
      );
}

class RangeOfDateTimeBetweenMinAndMaxStub extends _IRangeOfDateTimeStub {
  @override
  FormControl getControl() {
    FormControl formControl = new FormControl<DateTime>(
      value: new DateTime(2021, 06, 01),
      validators: [],
    );
    return formControl;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: const ConstantDateTime('2021-12-31T23:59:59'),
        error: 'invalid datetime into range.',
      );
}

class RangeOfDateTimeWithExternalMinMaxStub extends _IRangeOfDateTimeStub {
  @override
  FormControl getControl() {
    FormControl min = new FormControl<DateTime>(
      value: new DateTime(2020, 01, 01),
      validators: [],
    );
    FormControl max = new FormControl<DateTime>(
      value: new DateTime(2020, 12, 31),
      validators: [],
    );
    FormControl value = new FormControl<DateTime>(
      value: new DateTime(2020, 06, 01),
      validators: [],
    );
    FormGroup root = new FormGroup(
      controls: {
        'min': min,
        'max': max,
        'value': value,
      },
      validators: [],
    );

    min.parentGroup = root;
    max.parentGroup = root;
    value.parentGroup = root;

    return value;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: const ConstantDateTime('2021-12-31T23:59:59'),
        minOnProperty: 'min',
        maxOnProperty: 'max',
        error: 'invalid datetime into range.',
      );
}

class RangeOfDateTimeBeforeMinStub extends _IRangeOfDateTimeStub {
  @override
  FormControl getControl() {
    FormControl formControl = new FormControl<DateTime>(
      value: new DateTime(2020, 12, 31),
      validators: [],
    );
    return formControl;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: const ConstantDateTime('2021-12-31T23:59:59'),
        error: 'invalid datetime into range.',
      );
}

class RangeOfDateTimeAfterMaxStub extends _IRangeOfDateTimeStub {
  @override
  FormControl getControl() {
    FormControl formControl = new FormControl<DateTime>(
      value: new DateTime(2022, 01, 01),
      validators: [],
    );
    return formControl;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: const ConstantDateTime('2021-12-31T23:59:59'),
        error: 'invalid datetime into range.',
      );
}

class RangeOfDateTimeWithInvalidMinMaxStub extends _IRangeOfDateTimeStub {
  @override
  FormControl getControl() {
    FormControl formControl = new FormControl<DateTime>(
      value: null,
      validators: [],
    );
    return formControl;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: const ConstantDateTime('2020-12-31T23:59:59'),
        error: 'invalid datetime into range.',
      );
}
