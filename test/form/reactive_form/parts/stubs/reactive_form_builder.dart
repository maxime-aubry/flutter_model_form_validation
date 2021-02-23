import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _ReactiveFormBuilderStub extends FormBuilderStub<ReactiveFormBuilder> {
  _ReactiveFormBuilderStub() {
    ReactiveFormBuilder formBuilder = new ReactiveFormBuilder(
      group: new FormGroup(
        controls: {
          'control1': new FormGroup(controls: {}, validators: []),
          'control2': new FormArray(groups: [], validators: []),
          'control3': new FormControl<String>(value: 'azerty', validators: []),
          'control4': new FormControl<int>(value: 1, validators: []),
        },
        validators: [],
      ),
    );
    ReactiveFormState formState =
        new ReactiveFormState(formBuilder: formBuilder);
    formState.initialize();

    super.formBuilder = formBuilder;
  }
}
