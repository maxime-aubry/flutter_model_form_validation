import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';
import '../initializer/initializer.dart';

class _FormArrayStub extends AbstractControlStub<FormArray> {
  FormGroup groupToAdd;
  FormGroup groupToRemove;

  _FormArrayStub({
    List<FormGroup> groups,
  }) {
    FormArray _control1 = new FormArray(groups: groups ?? [], validators: []);

    FormGroup _root = new FormGroup(
      controls: {'control1': _control1},
      validators: [],
    );

    initializeFormGroup(_root, 'root', null, false);
    initializeFormArray(_control1, 'control1', _root);

    for (FormGroup group in groups)
      initializeFormGroup(
        group,
        '${_control1.name}[${groups.indexOf(group)}]',
        _root,
        true,
      );

    super.control = _control1;
  }
}

/* accessor: formPath */
class FormArray_FormPathWorks_Stub extends _FormArrayStub {
  String key = 'control1';
  String path = 'root.controls[\'control1\']';

  FormArray_FormPathWorks_Stub() : super(groups: []);
}

/* accessor: ModelPath */
class FormArray_ModelPathWorks_Stub extends _FormArrayStub {
  String key = 'control1';
  String path = 'root.control1';

  FormArray_ModelPathWorks_Stub() : super(groups: []);
}

/* after initialization */
class FormArray_FormArrayIsInitialized_Stub extends _FormArrayStub {
  FormArray_FormArrayIsInitialized_Stub()
      : super(
          groups: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
        ) {}
}

/* method: addGroup */
class FormArray_AddGroupWorks_Stub extends _FormArrayStub {
  FormArray_AddGroupWorks_Stub()
      : super(
          groups: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
        ) {
    super.groupToAdd = new FormGroup(controls: {}, validators: []);
  }
}

class FormArray_AddGroupThrowsFormBuilderExceptionOnNullGroup_Stub
    extends _FormArrayStub {
  FormArray_AddGroupThrowsFormBuilderExceptionOnNullGroup_Stub()
      : super(
          groups: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
        ) {
    super.groupToAdd = null;
  }
}

class FormArray_AddGroupThrowsFormBuilderExceptionOnExistingGroup_Stub
    extends _FormArrayStub {
  FormArray_AddGroupThrowsFormBuilderExceptionOnExistingGroup_Stub()
      : super(
          groups: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
        ) {
    super.groupToAdd = super.control.groups[1];
  }
}

/* method: removeGroup */
class FormArray_RemoveFirstGroupWorks_Stub extends _FormArrayStub {
  FormArray_RemoveFirstGroupWorks_Stub()
      : super(
          groups: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
        ) {
    super.groupToRemove = super.control.groups[0];
  }
}

class FormArray_RemoveSecondGroupWorks_Stub extends _FormArrayStub {
  FormArray_RemoveSecondGroupWorks_Stub()
      : super(
          groups: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
        ) {
    super.groupToRemove = super.control.groups[1];
  }
}

class FormArray_RemoveThirdGroupWorks_Stub extends _FormArrayStub {
  FormArray_RemoveThirdGroupWorks_Stub()
      : super(
          groups: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
        ) {
    super.groupToRemove = super.control.groups[2];
  }
}

class FormArray_RemoveGroupThrowsFormBuilderExceptionOnNullGroup_Stub
    extends _FormArrayStub {
  FormArray_RemoveGroupThrowsFormBuilderExceptionOnNullGroup_Stub()
      : super(
          groups: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
        ) {
    super.groupToRemove = null;
  }
}

class FormArray_RemoveGroupThrowsFormBuilderExceptionOnNotRegisteredGroup_Stub
    extends _FormArrayStub {
  FormArray_RemoveGroupThrowsFormBuilderExceptionOnNotRegisteredGroup_Stub()
      : super(
          groups: [
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
            new FormGroup(controls: {}, validators: []),
          ],
        ) {
    super.groupToRemove = new FormGroup(controls: {}, validators: []);
  }
}
