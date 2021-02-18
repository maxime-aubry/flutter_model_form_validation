import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _FormValidatorNavigatorForFormControlStub<TProperty extends Comparable>
    extends FormAnnotationStub {
  _FormValidatorNavigatorForFormControlStub({
    String targetName = 'target',
    bool targetIsDefined = true,
    TProperty targetValue = null,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: null,
      validators: [],
    );
    FormControl<TProperty> _target = new FormControl<TProperty>(
      value: targetValue,
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

class FormValidatorNavigator_ForFormControl_TargetFound_Stub
    extends _FormValidatorNavigatorForFormControlStub<String> {
  FormValidatorNavigator_ForFormControl_TargetFound_Stub() : super();
}

class FormValidatorNavigator_ForFormControl_BadTargetType_Stub
    extends _FormValidatorNavigatorForFormControlStub<String> {
  FormValidatorNavigator_ForFormControl_BadTargetType_Stub() : super();
}

class FormValidatorNavigator_ForFormControl_TargetNotFound_Stub
    extends _FormValidatorNavigatorForFormControlStub<String> {
  FormValidatorNavigator_ForFormControl_TargetNotFound_Stub()
      : super(targetName: 'badTarget', targetIsDefined: false);
}

class FormValidatorNavigator_ForFormControl_ParameterIsOk_Stub
    extends _FormValidatorNavigatorForFormControlStub<DateTime> {
  FormValidatorNavigator_ForFormControl_ParameterIsOk_Stub()
      : super(targetValue: new DateTime(2021, 1, 2));
}

class FormValidatorNavigator_ForFormControl_DefaultValueHasBadType_Stub
    extends _FormValidatorNavigatorForFormControlStub<DateTime> {
  FormValidatorNavigator_ForFormControl_DefaultValueHasBadType_Stub()
      : super(targetValue: new DateTime(2021, 1, 2));
}

class FormValidatorNavigator_ForFormControl_ParameterNameIsNotDefined_Stub
    extends _FormValidatorNavigatorForFormControlStub<DateTime> {
  FormValidatorNavigator_ForFormControl_ParameterNameIsNotDefined_Stub()
      : super(targetIsDefined: false);
}
