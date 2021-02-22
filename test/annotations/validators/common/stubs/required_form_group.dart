import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _RequiredFormGroupStub extends ValidatorStub<FormGroup, Required> {
  _RequiredFormGroupStub({
    Map<String, AbstractControl> controls,
  }) {
    this.control = new FormGroup(
      controls: controls,
      validators: [],
    );
    this.validator = Required(error: '');
  }
}

/* Value is valid */
class RequiredFormGroup_FormGroupControlsArePopulated_Stub
    extends _RequiredFormGroupStub {
  RequiredFormGroup_FormGroupControlsArePopulated_Stub()
      : super(
          controls: {
            'field': new FormControl<String>(value: null, validators: []),
          },
        );
}

/* Value is not valid */
class RequiredFormGroup_FormGroupControlsAreNull_Stub
    extends _RequiredFormGroupStub {
  RequiredFormGroup_FormGroupControlsAreNull_Stub() : super(controls: null);
}

class RequiredFormGroup_FormGroupControlsAreEmpty_Stub
    extends _RequiredFormGroupStub {
  RequiredFormGroup_FormGroupControlsAreEmpty_Stub() : super(controls: {});
}

/* Remote parameters are provided */

/* Exceptions */
