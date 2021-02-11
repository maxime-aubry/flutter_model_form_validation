import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../main_stub.dart';

abstract class _IRangeOfStringStub
    extends IStub<FormControl, RangeOfString> {}

class RangeOfStringEqualToMinStub extends _IRangeOfStringStub {
  @override
  FormControl getControl() {
    FormControl formControl = new FormControl<String>(
      value: 'd',
      validators: [],
    );
    return formControl;
  }

  @override
  RangeOfString getValidator() => RangeOfString(
        min: 'd',
        max: 'g',
        error: 'invalid string into range.',
      );
}

class RangeOfStringEqualToMaxStub extends _IRangeOfStringStub {
  @override
  FormControl getControl() {
    FormControl formControl = new FormControl<String>(
      value: 'g',
      validators: [],
    );
    return formControl;
  }

  @override
  RangeOfString getValidator() => RangeOfString(
        min: 'd',
        max: 'g',
        error: 'invalid string into range.',
      );
}

class RangeOfStringBetweenMinAndMaxStub extends _IRangeOfStringStub {
  @override
  FormControl getControl() {
    FormControl formControl = new FormControl<String>(
      value: 'e',
      validators: [],
    );
    return formControl;
  }

  @override
  RangeOfString getValidator() => RangeOfString(
        min: 'd',
        max: 'g',
        error: 'invalid string into range.',
      );
}

class RangeOfStringWithExternalMinMaxStub extends _IRangeOfStringStub {
  @override
  FormControl getControl() {
    FormControl min = new FormControl<String>(
      value: 'a',
      validators: [],
    );
    FormControl max = new FormControl<String>(
      value: 'c',
      validators: [],
    );
    FormControl value = new FormControl<String>(
      value: 'b',
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
  RangeOfString getValidator() => RangeOfString(
        min: 'd',
        max: 'g',
        minOnProperty: 'min',
        maxOnProperty: 'max',
        error: 'invalid string into range.',
      );
}

class RangeOfStringBeforeMinStub extends _IRangeOfStringStub {
  @override
  FormControl getControl() {
    FormControl formControl = new FormControl<String>(
      value: 'c',
      validators: [],
    );
    return formControl;
  }

  @override
  RangeOfString getValidator() => RangeOfString(
        min: 'd',
        max: 'g',
        error: 'invalid string into range.',
      );
}

class RangeOfStringAfterMaxStub extends _IRangeOfStringStub {
  @override
  FormControl getControl() {
    FormControl formControl = new FormControl<String>(
      value: 'h',
      validators: [],
    );
    return formControl;
  }

  @override
  RangeOfString getValidator() => RangeOfString(
        min: 'd',
        max: 'g',
        error: 'invalid string into range.',
      );
}

class RangeOfStringWithInvalidMinMaxStub extends _IRangeOfStringStub {
  @override
  FormControl getControl() {
    FormControl formControl = new FormControl<String>(
      value: null,
      validators: [],
    );
    return formControl;
  }

  @override
  RangeOfString getValidator() => RangeOfString(
        min: 'h',
        max: 'g',
        error: 'invalid string into range.',
      );
}
