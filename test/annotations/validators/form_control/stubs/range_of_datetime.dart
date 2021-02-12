import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../main_stub.dart';

abstract class _IRangeOfDateTimeStub
    extends IStub<FormControl<DateTime>, RangeOfDateTime> {}

class RangeOfDateTime_ValueEqualToMin_Stub extends _IRangeOfDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 1, 1),
      validators: [],
    );
    return value;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: const ConstantDateTime('2021-12-31T23:59:59'),
        error: 'invalid datetime into range.',
      );
}

class RangeOfDateTime_ValueEqualToMax_Stub extends _IRangeOfDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 12, 31),
      validators: [],
    );
    return value;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: const ConstantDateTime('2021-12-31T23:59:59'),
        error: 'invalid datetime into range.',
      );
}

class RangeOfDateTime_ValueBetweenMinAndMax_Stub extends _IRangeOfDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2021, 06, 01),
      validators: [],
    );
    return value;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: const ConstantDateTime('2021-12-31T23:59:59'),
        error: 'invalid datetime into range.',
      );
}

class RangeOfDateTime_WithExternalMinMax_Stub extends _IRangeOfDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> min = new FormControl<DateTime>(
      value: new DateTime(2020, 01, 01),
      validators: [],
    );
    FormControl<DateTime> max = new FormControl<DateTime>(
      value: new DateTime(2020, 12, 31),
      validators: [],
    );
    FormControl<DateTime> value = new FormControl<DateTime>(
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

class RangeOfDateTime_ValueBeforeMin_Stub extends _IRangeOfDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2020, 12, 31),
      validators: [],
    );
    return value;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: const ConstantDateTime('2021-12-31T23:59:59'),
        error: 'invalid datetime into range.',
      );
}

class RangeOfDateTime_ValueAfterMax_Stub extends _IRangeOfDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: new DateTime(2022, 01, 01),
      validators: [],
    );
    return value;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: const ConstantDateTime('2021-12-31T23:59:59'),
        error: 'invalid datetime into range.',
      );
}

class RangeOfDateTime_WithMissingMin_Stub extends _IRangeOfDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: null,
      validators: [],
    );
    return value;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: null,
        max: const ConstantDateTime('2020-12-31T23:59:59'),
        error: 'invalid datetime into range.',
      );
}

class RangeOfDateTime_WithMissingMax_Stub extends _IRangeOfDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: null,
      validators: [],
    );
    return value;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: null,
        error: 'invalid datetime into range.',
      );
}

class RangeOfDateTime_MinGreatherThanMax_Stub extends _IRangeOfDateTimeStub {
  @override
  FormControl<DateTime> getControl() {
    FormControl<DateTime> value = new FormControl<DateTime>(
      value: null,
      validators: [],
    );
    return value;
  }

  @override
  RangeOfDateTime getValidator() => RangeOfDateTime(
        min: const ConstantDateTime('2021-01-01T00:00:00'),
        max: const ConstantDateTime('2020-12-31T23:59:59'),
        error: 'invalid datetime into range.',
      );
}
