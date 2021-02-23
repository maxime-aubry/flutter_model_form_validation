import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _FormValidatorNavigatorStub<TProperty extends Comparable>
    extends FormAnnotationStub {
  _FormValidatorNavigatorStub({
    String targetName,
    bool targetsAreDefined = true,
    TProperty targetValue = null,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: null,
      validators: [],
    );
    FormGroup _target1 = new FormGroup(controls: {}, validators: []);
    FormArray _target2 = new FormArray(groups: [], validators: []);
    FormControl<TProperty> _target3 = new FormControl<TProperty>(
      value: targetValue,
      validators: [],
    );
    Map<String, AbstractControl> controls = {'value': _value};
    if (targetsAreDefined) {
      controls['target1'] = _target1;
      controls['target2'] = _target2;
      controls['target3'] = _target3;
    }

    FormGroup _root = new FormGroup(
      controls: controls,
      validators: [],
    );

    _value.parentGroup = _root;
    _target1.parentGroup = _root;
    _target2.parentGroup = _root;
    _target3.parentGroup = _root;

    super.targetName = targetName;
    super.control = _value;
    super.navigator = new NavigatorTester();
  }
}

/* FormGroup */
class FormValidatorNavigator_Target1IsFound_Stub
    extends _FormValidatorNavigatorStub<String> {
  FormValidatorNavigator_Target1IsFound_Stub()
      : super(
          targetName: 'target1',
        );
}

/* FormArray */
class FormValidatorNavigator_Target2IsFound_Stub
    extends _FormValidatorNavigatorStub<String> {
  FormValidatorNavigator_Target2IsFound_Stub()
      : super(
          targetName: 'target2',
        );
}

/* FormControl */
class FormValidatorNavigator_Target3IsFound_Stub
    extends _FormValidatorNavigatorStub<String> {
  FormValidatorNavigator_Target3IsFound_Stub()
      : super(
          targetName: 'target3',
        );
}

/*class FormValidatorNavigator_BadTargetType_Stub
    extends _FormValidatorNavigatorStub<String> {
  FormValidatorNavigator_BadTargetType_Stub() : super();
}

class FormValidatorNavigator_TargetNotFound_Stub
    extends _FormValidatorNavigatorStub<String> {
  FormValidatorNavigator_TargetNotFound_Stub()
      : super(
          targetName: 'badTarget',
          targetsAreDefined: false,
        );
}

class FormValidatorNavigator_ParameterIsOk_Stub
    extends _FormValidatorNavigatorStub<DateTime> {
  FormValidatorNavigator_ParameterIsOk_Stub()
      : super(
          targetValue: new DateTime(2021, 1, 2),
        );
}

class FormValidatorNavigator_DefaultValueHasBadType_Stub
    extends _FormValidatorNavigatorStub<DateTime> {
  FormValidatorNavigator_DefaultValueHasBadType_Stub()
      : super(
          targetValue: new DateTime(2021, 1, 2),
        );
}

class FormValidatorNavigator_ParameterNameIsEmpty_Stub
    extends _FormValidatorNavigatorStub<DateTime> {
  FormValidatorNavigator_ParameterNameIsEmpty_Stub()
      : super(
          targetName: '',
        );
}*/
