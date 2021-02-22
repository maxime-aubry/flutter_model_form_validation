import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _FormValidatorNavigatorStub<TProperty extends Comparable>
    extends FormAnnotationStub {
  _FormValidatorNavigatorStub({
    String targetName,
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
    Map<String, AbstractControl> controls = {'value': _value};
    if (targetIsDefined) controls['target'] = _target;

    FormGroup _root = new FormGroup(
      controls: controls,
      validators: [],
    );

    _value.parentGroup = _root;
    _target.parentGroup = _root;

    super.targetName = targetName;
    super.control = _value;
    super.navigator = new NavigatorTester();
  }
}

class FormValidatorNavigator_TargetFound_Stub
    extends _FormValidatorNavigatorStub<String> {
  FormValidatorNavigator_TargetFound_Stub() : super();
}

class FormValidatorNavigator_BadTargetType_Stub
    extends _FormValidatorNavigatorStub<String> {
  FormValidatorNavigator_BadTargetType_Stub() : super();
}

class FormValidatorNavigator_TargetNotFound_Stub
    extends _FormValidatorNavigatorStub<String> {
  FormValidatorNavigator_TargetNotFound_Stub()
      : super(targetName: 'badTarget', targetIsDefined: false);
}

class FormValidatorNavigator_ParameterIsOk_Stub
    extends _FormValidatorNavigatorStub<DateTime> {
  FormValidatorNavigator_ParameterIsOk_Stub()
      : super(targetValue: new DateTime(2021, 1, 2));
}

class FormValidatorNavigator_DefaultValueHasBadType_Stub
    extends _FormValidatorNavigatorStub<DateTime> {
  FormValidatorNavigator_DefaultValueHasBadType_Stub()
      : super(targetValue: new DateTime(2021, 1, 2));
}

class FormValidatorNavigator_ParameterNameIsNotDefined_Stub
    extends _FormValidatorNavigatorStub<DateTime> {
  FormValidatorNavigator_ParameterNameIsNotDefined_Stub()
      : super(targetIsDefined: false);
}
