import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _FormValidatorNavigatorForFormArrayStub<TProperty extends Comparable>
    extends FormAnnotationStub {
  _FormValidatorNavigatorForFormArrayStub({
    String targetName = 'target',
    bool targetIsDefined = true,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: null,
      validators: [],
    );
    FormArray _target = new FormArray(
      groups: [],
      validators: [],
    );
    Map<String, AbstractControl> controls = {
      'value': _value,
    };
    if (targetIsDefined) controls[targetName] = _target;

    FormGroup _root = new FormGroup(
      controls: controls,
      validators: [],
    );

    _value.parentGroup = _root;
    _target.parentGroup = _root;

    this.control = _value;
    this.navigator = new NavigatorTester();
  }
}

class FormValidatorNavigator_ForFormArray_TargetFound_Stub
    extends _FormValidatorNavigatorForFormArrayStub<String> {
  FormValidatorNavigator_ForFormArray_TargetFound_Stub() : super();
}

class FormValidatorNavigator_ForFormArray_TargetNotFound_Stub
    extends _FormValidatorNavigatorForFormArrayStub<String> {
  FormValidatorNavigator_ForFormArray_TargetNotFound_Stub()
      : super(targetName: 'badTarget', targetIsDefined: false);
}
