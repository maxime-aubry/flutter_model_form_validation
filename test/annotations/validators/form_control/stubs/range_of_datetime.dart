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
    // TODO: implement getControl
    throw UnimplementedError();
  }

  @override
  RangeOfDateTime getValidator() {
    // TODO: implement getValidator
    throw UnimplementedError();
  }
}

class RangeOfDateTimeBeforeStub extends _IRangeOfDateTimeStub {
  @override
  FormControl getControl() {
    // TODO: implement getControl
    throw UnimplementedError();
  }

  @override
  RangeOfDateTime getValidator() {
    // TODO: implement getValidator
    throw UnimplementedError();
  }
}

class RangeOfDateTimeAfterMaxStub extends _IRangeOfDateTimeStub {
  @override
  FormControl getControl() {
    // TODO: implement getControl
    throw UnimplementedError();
  }

  @override
  RangeOfDateTime getValidator() {
    // TODO: implement getValidator
    throw UnimplementedError();
  }
}

class RangeOfDateTimeWithExternalMinMaxStub extends _IRangeOfDateTimeStub {
  @override
  FormControl getControl() {
    // TODO: implement getControl
    throw UnimplementedError();
  }

  @override
  RangeOfDateTime getValidator() {
    // TODO: implement getValidator
    throw UnimplementedError();
  }
}

class RangeOfDateTimeWithInvalidMinMaxStub extends _IRangeOfDateTimeStub {
  @override
  FormControl getControl() {
    // TODO: implement getControl
    throw UnimplementedError();
  }

  @override
  RangeOfDateTime getValidator() {
    // TODO: implement getValidator
    throw UnimplementedError();
  }
}
