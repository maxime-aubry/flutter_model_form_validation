import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stub.dart';

abstract class _INbItemsStub extends IStub<FormArray, NbItems> {}

class FilledArrayStub extends _INbItemsStub {
  @override
  FormArray getControl() {
    FormArray formArray = new FormArray(
      groups: [
        new FormGroup(controls: {}, validators: []),
      ],
      validators: [],
    );
    return formArray;
  }

  @override
  NbItems getValidator() => NbItems(
        min: 1,
        max: 3,
        error: 'FormArray must have between 1 and 3 items.',
      );
}

class FilledArrayWithExternalMinMaxStub extends _INbItemsStub {
  @override
  FormArray getControl() {
    FormControl<int> min = new FormControl<int>(value: 2, validators: []);
    FormControl<int> max = new FormControl<int>(value: 2, validators: []);
    FormArray array = new FormArray(
      groups: [
        new FormGroup(controls: {}, validators: []),
        new FormGroup(controls: {}, validators: []),
      ],
      validators: [],
    );

    FormGroup root = new FormGroup(
      controls: {
        'min': min,
        'max': max,
        'array': array,
      },
      validators: [],
    );

    min.parentGroup = root;
    max.parentGroup = root;
    array.parentGroup = root;

    return array;
  }

  @override
  NbItems getValidator() => NbItems(
        min: 1,
        max: 3,
        minOnProperty: 'min',
        maxOnProperty: 'max',
        error: 'FormArray must have between 1 and 3 items.',
      );
}

class FilledArrayWithInvalidlMinMaxStub extends _INbItemsStub {
  @override
  FormArray getControl() {
    FormArray formArray = new FormArray(
      groups: [
        new FormGroup(controls: {}, validators: []),
      ],
      validators: [],
    );
    return formArray;
  }

  @override
  NbItems getValidator() => NbItems(
        min: 3,
        max: 2,
        error: 'FormArray must have between 1 and 3 items.',
      );
}

class NullArrayStub extends _INbItemsStub {
  @override
  FormArray getControl() {
    FormArray formArray = new FormArray(
      groups: null,
      validators: [],
    );
    return formArray;
  }

  @override
  NbItems getValidator() => NbItems(
        min: 1,
        max: 3,
        error: 'FormArray must have between 1 and 3 items.',
      );
}

class EmptyArrayStub extends _INbItemsStub {
  @override
  FormArray getControl() {
    FormArray formArray = new FormArray(
      groups: [],
      validators: [],
    );
    return formArray;
  }

  @override
  NbItems getValidator() => NbItems(
        min: 1,
        max: 3,
        error: 'FormArray must have between 1 and 3 items.',
      );
}
