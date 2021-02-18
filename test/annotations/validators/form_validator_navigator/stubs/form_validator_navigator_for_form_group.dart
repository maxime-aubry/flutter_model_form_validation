import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _FormValidatorNavigatorForFormGroupStub extends FormAnnotationStub {
  _FormValidatorNavigatorForFormGroupStub({
    String targetName = 'target',
    bool targetIsDefined = true,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: null,
      validators: [],
    );
    FormGroup _target = new FormGroup(
      controls: {},
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

class FormValidatorNavigator_ForFormGroup_TargetFound_Stub
    extends _FormValidatorNavigatorForFormGroupStub {
  FormValidatorNavigator_ForFormGroup_TargetFound_Stub() : super();
}

class FormValidatorNavigator_ForFormGroup_TargetNotFound_Stub
    extends _FormValidatorNavigatorForFormGroupStub {
  FormValidatorNavigator_ForFormGroup_TargetNotFound_Stub()
      : super(targetName: 'badTarget', targetIsDefined: false);
}
