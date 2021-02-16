import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stub.dart';

class _RequiredFormArrayStub extends IStub<FormArray, Required> {
  _RequiredFormArrayStub({
    List<FormGroup> groups,
  }) {
    this.control = new FormArray(
      groups: groups,
      validators: [],
    );
    this.validator = Required(error: '');
  }
}

/* Value is valid */
class RequiredFormArray_FormArrayGroupsArePopulated_Stub
    extends _RequiredFormArrayStub {
  RequiredFormArray_FormArrayGroupsArePopulated_Stub()
      : super(
          groups: [
            new FormGroup(controls: {}, validators: []),
          ],
        );
}

/* Value is not valid */
class RequiredFormArray_FormArrayGroupsAreNull_Stub
    extends _RequiredFormArrayStub {
  RequiredFormArray_FormArrayGroupsAreNull_Stub() : super(groups: null);
}

class RequiredFormArray_FormArrayGroupsAreEmpty_Stub
    extends _RequiredFormArrayStub {
  RequiredFormArray_FormArrayGroupsAreEmpty_Stub() : super(groups: []);
}

/* Remote parameters are provided */

/* Exceptions on parameters */
