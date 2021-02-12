import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stub.dart';

abstract class _IRequiredStub<TAbstractControl extends AbstractControl>
    extends IStub<TAbstractControl, Required> {}

/* FormGroup */
class PopulatedFormGroupStub extends _IRequiredStub<FormGroup> {
  @override
  FormGroup getControl() {
    FormGroup formGroup = new FormGroup(
      controls: {
        'property': new FormControl<String>(value: null, validators: []),
      },
      validators: [],
    );
    return formGroup;
  }

  @override
  Required getValidator() {
    Required validator = Required(error: 'form group is required');
    return validator;
  }
}

class NullFormGroupStub extends _IRequiredStub<FormGroup> {
  @override
  FormGroup getControl() {
    FormGroup formGroup = new FormGroup(
      controls: null,
      validators: [],
    );
    return formGroup;
  }

  @override
  Required getValidator() => Required(error: 'form group is required');
}

class EmptyFormGroupStub extends _IRequiredStub<FormGroup> {
  @override
  FormGroup getControl() {
    FormGroup formGroup = new FormGroup(
      controls: {},
      validators: [],
    );
    return formGroup;
  }

  @override
  Required getValidator() => Required(error: 'form group is required');
}

/* FormArray */
abstract class IFormArrayStub {
  FormArray getFormArray();
}

class PopulatedFormArrayStub extends _IRequiredStub<FormArray> {
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
  Required getValidator() => Required(error: 'form array is required');
}

class NullFormArrayStub extends _IRequiredStub<FormArray> {
  @override
  FormArray getControl() {
    FormArray formArray = new FormArray(
      groups: null,
      validators: [],
    );
    return formArray;
  }

  @override
  Required getValidator() => Required(error: 'form array is required');
}

class EmptyFormArrayStub extends _IRequiredStub<FormArray> {
  @override
  FormArray getControl() {
    FormArray formArray = new FormArray(
      groups: [],
      validators: [],
    );
    return formArray;
  }

  @override
  Required getValidator() => Required(error: 'form array is required');
}

/* FormControl */
class PopulatedFormControlStub extends _IRequiredStub<FormControl> {
  @override
  FormControl<String> getControl() {
    FormControl<String> formControl = new FormControl<String>(
      value: 'azerty',
      validators: [],
    );
    return formControl;
  }

  @override
  Required getValidator() => Required(error: 'form control is required');
}

class NullFormControlStub extends _IRequiredStub<FormControl> {
  @override
  FormControl<String> getControl() {
    FormControl<String> formControl = new FormControl<String>(
      value: null,
      validators: [],
    );
    return formControl;
  }

  @override
  Required getValidator() => Required(error: 'form control is required');
}

class EmptyFormControlStub extends _IRequiredStub<FormControl> {
  @override
  FormControl<String> getControl() {
    FormControl<String> formControl = new FormControl<String>(
      value: '',
      validators: [],
    );
    return formControl;
  }

  @override
  Required getValidator() => Required(error: 'form control is required');
}
