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

    _value.parent = _root;
    _target.parent = _root;

    super.targetName = targetName;
    super.control = _value;
    super.navigator = new NavigatorTester();
  }
}

class FormValidatorNavigator_StringParameterIsFound_Stub
    extends _FormValidatorNavigatorStub<String> {
  FormValidatorNavigator_StringParameterIsFound_Stub()
      : super(
          targetName: 'target',
          targetValue: 'ytreza',
        );
}

class FormValidatorNavigator_DateTimeParameterIsFound_Stub
    extends _FormValidatorNavigatorStub<DateTime> {
  FormValidatorNavigator_DateTimeParameterIsFound_Stub()
      : super(
          targetName: 'target',
          targetValue: new DateTime(2021, 1, 2),
        );
}

class FormValidatorNavigator_ThrowsValidatorParameterExceptionOnDefaultValueIsNotConstantDateTime_Stub
    extends _FormValidatorNavigatorStub<DateTime> {
  FormValidatorNavigator_ThrowsValidatorParameterExceptionOnDefaultValueIsNotConstantDateTime_Stub()
      : super(
          targetName: 'target',
          targetValue: new DateTime(2021, 1, 2),
        );
}

class FormValidatorNavigator_ThrowsValidatorParameterExceptionOnRemoteParameterNameIsEmpty_Stub
    extends _FormValidatorNavigatorStub<String> {
  FormValidatorNavigator_ThrowsValidatorParameterExceptionOnRemoteParameterNameIsEmpty_Stub()
      : super(
          targetName: 'target',
          targetValue: 'ytreza',
        );
}
