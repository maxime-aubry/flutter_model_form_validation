import 'package:flutter_model_form_validation/src/form/index.dart';

import '../stubs.dart';

class _FormValidatorAnnotationForFormControlStub<TProperty extends Comparable>
    extends FormAnnotationStub {
  _FormValidatorAnnotationForFormControlStub({
    String soughtParameterName,
    bool parameterIsDefined = true,
  }) {
    super.soughtParameterName = soughtParameterName;

    FormControl<String> _value = new FormControl<String>(
      value: null,
      validators: [],
    );
    FormControl<TProperty> _parameter = new FormControl<TProperty>(
      value: null,
      validators: [],
    );
    Map<String, AbstractControl> controls = {
      'value': _value,
    };
    if (parameterIsDefined) controls['parameter'] = _parameter;

    FormGroup _root = new FormGroup(
      controls: controls,
      validators: [],
    );

    _value.parentGroup = _root;
    _parameter.parentGroup = _root;

    this.control = _value;
    this.navigator = new NavigatorTester();
  }
}

class FormValidatorAnnotationWithFormControlParameter_FormControlParameterFound_Stub
    extends _FormValidatorAnnotationForFormControlStub<String> {
  FormValidatorAnnotationWithFormControlParameter_FormControlParameterFound_Stub()
      : super(soughtParameterName: 'parameter');
}

class FormValidatorAnnotationWithFormControlParameter_BadTargetType_Stub
    extends _FormValidatorAnnotationForFormControlStub<String> {
  FormValidatorAnnotationWithFormControlParameter_BadTargetType_Stub()
      : super(soughtParameterName: 'parameter');
}

class FormValidatorAnnotationWithFormControlParameter_TargetNotFound_Stub
    extends _FormValidatorAnnotationForFormControlStub<String> {
  FormValidatorAnnotationWithFormControlParameter_TargetNotFound_Stub()
      : super(soughtParameterName: 'parameter', parameterIsDefined: false);
}
