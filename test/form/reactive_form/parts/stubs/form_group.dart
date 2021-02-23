import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';
import '../initializer/initializer.dart';

class _FormGroupStub extends AbstractControlStub<FormGroup> {
  _FormGroupStub() {
    FormGroup _control1 = new FormGroup(controls: {}, validators: []);
    FormArray _control2 = new FormArray(groups: [], validators: []);
    FormControl<String> _control3 =
        new FormControl<String>(value: 'azerty', validators: []);
    FormControl<int> _control4 = new FormControl<int>(value: 1, validators: []);

    FormGroup _root = new FormGroup(
      controls: {
        'control1': _control1,
        'control2': _control2,
        'control3': _control3,
        'control4': _control4,
      },
      validators: [],
    );

    initializeFormGroup(_root, 'root', null, false);
    initializeFormGroup(_control1, 'control1', _root, false);
    initializeFormArray(_control2, 'control2', _root);
    initializeFormControl(_control3, 'control3', _root);
    initializeFormControl(_control4, 'control4', _root);

    super.control = _root;
  }
}

/* accessor: formPath */
class FormGroup_FormPathWorks_Stub extends _FormGroupStub {
  String key = 'control1';
  String path = 'root.controls[\'control1\']';

  FormGroup_FormPathWorks_Stub() : super();
}

/* accessor: modelPath */
class FormGroup_ModelPathWorks_Stub extends _FormGroupStub {
  String key = 'control1';
  String path = 'root.control1';

  FormGroup_ModelPathWorks_Stub() : super();
}

/* method: containsControl */
class FormGroup_ContainsControlFindControlByKey_Stub extends _FormGroupStub {
  String key = 'control1';

  FormGroup_ContainsControlFindControlByKey_Stub() : super();
}

class FormGroup_ContainsControlDoesNotFindControlByKey_Stub
    extends _FormGroupStub {
  String key = 'control5';

  FormGroup_ContainsControlDoesNotFindControlByKey_Stub() : super();
}

class FormGroup_ContainsControlThrowsFormBuilderExceptionOnNullName_Stub
    extends _FormGroupStub {
  String key = null;

  FormGroup_ContainsControlThrowsFormBuilderExceptionOnNullName_Stub()
      : super();
}

class FormGroup_ContainsControlThrowsFormBuilderExceptionOnEmptyName_Stub
    extends _FormGroupStub {
  String key = '';

  FormGroup_ContainsControlThrowsFormBuilderExceptionOnEmptyName_Stub()
      : super();
}

/* method: addControl */
class FormGroup_AddControlWorks_Stub extends _FormGroupStub {
  String key = 'control5';
  FormGroup controlToAdd = new FormGroup(controls: {}, validators: []);

  FormGroup_AddControlWorks_Stub() : super();
}

class FormGroup_AddControlThrowsFormBuilderExceptionOnNullName_Stub
    extends _FormGroupStub {
  String key = null;
  FormGroup controlToAdd = new FormGroup(controls: {}, validators: []);

  FormGroup_AddControlThrowsFormBuilderExceptionOnNullName_Stub() : super();
}

class FormGroup_AddControlThrowsFormBuilderExceptionOnEmptyName_Stub
    extends _FormGroupStub {
  String key = '';
  FormGroup controlToAdd = new FormGroup(controls: {}, validators: []);

  FormGroup_AddControlThrowsFormBuilderExceptionOnEmptyName_Stub() : super();
}

class FormGroup_AddControlThrowsFormBuilderExceptionOnNullControl_Stub
    extends _FormGroupStub {
  String key = 'control5';
  FormGroup controlToAdd = null;

  FormGroup_AddControlThrowsFormBuilderExceptionOnNullControl_Stub() : super();
}

class FormGroup_AddControlFormBuilderExceptionOnExistingKey_Stub
    extends _FormGroupStub {
  String key = 'control4';
  FormGroup controlToAdd = new FormGroup(controls: {}, validators: []);

  FormGroup_AddControlFormBuilderExceptionOnExistingKey_Stub() : super();
}

/* method: removeControl */
class FormGroup_RemoveControlWorks_Stub extends _FormGroupStub {
  String key = 'control4';

  FormGroup_RemoveControlWorks_Stub() : super();
}

class FormGroup_RemoveControlThrowsFormBuilderExceptionOnNullName_Stub
    extends _FormGroupStub {
  String key = null;

  FormGroup_RemoveControlThrowsFormBuilderExceptionOnNullName_Stub() : super();
}

class FormGroup_RemoveControlThrowsFormBuilderExceptionOnEmptyName_Stub
    extends _FormGroupStub {
  String key = '';

  FormGroup_RemoveControlThrowsFormBuilderExceptionOnEmptyName_Stub() : super();
}

class FormGroup_RemoveControlThrowsFormBuilderExceptionOnNotRegisteredControl_Stub
    extends _FormGroupStub {
  String key = 'control5';

  FormGroup_RemoveControlThrowsFormBuilderExceptionOnNotRegisteredControl_Stub()
      : super();
}

/* method: getFormGroup */
class FormGroup_GetFormGroupWorks_Stub extends _FormGroupStub {
  String key = 'control1';

  FormGroup_GetFormGroupWorks_Stub() : super();
}

class FormGroup_GetFormGroupThrowsFormBuilderExceptionOnControlNotFound_Stub
    extends _FormGroupStub {
  String key = 'control5';

  FormGroup_GetFormGroupThrowsFormBuilderExceptionOnControlNotFound_Stub()
      : super();
}

class FormGroup_GetFormGroupThrowsFormBuilderExceptionOnBadType_Stub
    extends _FormGroupStub {
  String key = 'control3';

  FormGroup_GetFormGroupThrowsFormBuilderExceptionOnBadType_Stub() : super();
}

/* method: getFormArray */
class FormGroup_GetFormArrayWorks_Stub extends _FormGroupStub {
  String key = 'control2';

  FormGroup_GetFormArrayWorks_Stub() : super();
}

class FormGroup_GetFormArrayThrowsFormBuilderExceptionOnControlNotFound_Stub
    extends _FormGroupStub {
  String key = 'control5';

  FormGroup_GetFormArrayThrowsFormBuilderExceptionOnControlNotFound_Stub()
      : super();
}

class FormGroup_GetFormArrayThrowsFormBuilderExceptionOnBadType_Stub
    extends _FormGroupStub {
  String key = 'control1';

  FormGroup_GetFormArrayThrowsFormBuilderExceptionOnBadType_Stub() : super();
}

/* method: getFormControl */
class FormGroup_GetFormControlWorks_Stub extends _FormGroupStub {
  String key = 'control3';

  FormGroup_GetFormControlWorks_Stub() : super();
}

class FormGroup_GetFormControlThrowsFormBuilderExceptionOnControlNotFound_Stub
    extends _FormGroupStub {
  String key = 'control5';

  FormGroup_GetFormControlThrowsFormBuilderExceptionOnControlNotFound_Stub()
      : super();
}

class FormGroup_GetFormControlThrowsFormBuilderExceptionOnBadType_Stub
    extends _FormGroupStub {
  String key = 'control3';

  FormGroup_GetFormControlThrowsFormBuilderExceptionOnBadType_Stub() : super();
}
