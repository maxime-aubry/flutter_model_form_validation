import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _FormControlStub<TProperty extends Comparable>
    extends AbstractControlStub<FormControl<TProperty>> {
  _FormControlStub() {
    FormControl<TProperty> _control1 =
        new FormControl<TProperty>(value: null, validators: []);

    FormGroup _root = new FormGroup(
      controls: {'control1': _control1},
      validators: [],
    );

    ReactiveFormBuilder formBuilder = new ReactiveFormBuilder(group: _root);
    ReactiveFormState formState =
        new ReactiveFormState(formBuilder: formBuilder);
    formState.initialize();

    super.control = _control1;
  }
}

/* accessor: formPath */
class FormControl_FormPathWorks_Stub extends _FormControlStub<String> {
  String key = 'control1';
  String path = 'root.controls[\'control1\']';

  FormControl_FormPathWorks_Stub() : super();
}

/* accessor: modelPath */
class FormControl_ModelPathWorks_Stub extends _FormControlStub<String> {
  String key = 'control1';
  String path = 'root.control1';

  FormControl_ModelPathWorks_Stub() : super();
}

/* method: setValue */
class FormControl_SetValueWorks_Stub extends _FormControlStub<String> {
  String value = 'azerty';

  FormControl_SetValueWorks_Stub() : super();
}

class FormControl_SetValueEmptyStringBecomeNull_Stub
    extends _FormControlStub<String> {
  String value = '';

  FormControl_SetValueEmptyStringBecomeNull_Stub() : super();
}

class FormControl_SetValueDateTimeValueIsSaved_Stub
    extends _FormControlStub<DateTime> {
  DateTime value = DateTime.now();

  FormControl_SetValueDateTimeValueIsSaved_Stub() : super();
}
