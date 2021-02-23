import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _ReactiveFormBuilderStub
    extends FormBuilderStub<ReactiveFormBuilder, ReactiveFormState> {
  _ReactiveFormBuilderStub({
    bool provideFormState = true,
  }) {
    ReactiveFormBuilder _formBuilder = new ReactiveFormBuilder(
      group: new FormGroup(
        controls: {
          'control1': new FormGroup(controls: {
            'control1_1': new FormControl<String>(value: null, validators: []),
          }, validators: []),
          'control2': new FormArray(groups: [
            new FormGroup(controls: {
              'control2_0_1': new FormControl<String>(
                value: null,
                validators: [],
              ),
            }, validators: []),
            new FormGroup(controls: {
              'control2_1_1': new FormControl<String>(
                value: null,
                validators: [],
              ),
            }, validators: []),
          ], validators: []),
          'control3': new FormControl<String>(value: null, validators: []),
        },
        validators: [],
      ),
    );
    ReactiveFormState _formState =
        provideFormState ? new ReactiveFormState() : null;

    super.formBuilder = _formBuilder;
    super.formState = _formState;
  }
}

class ReactiveFormBuilder_FormBuilderIsInitialized_Stub
    extends _ReactiveFormBuilderStub {
  ReactiveFormBuilder_FormBuilderIsInitialized_Stub() : super();
}

class ReactiveFormBuilder_ThrowsFormBuilderExceptionOnNullFormState_Stub
    extends _ReactiveFormBuilderStub {
  ReactiveFormBuilder_ThrowsFormBuilderExceptionOnNullFormState_Stub()
      : super(provideFormState: false);
}
