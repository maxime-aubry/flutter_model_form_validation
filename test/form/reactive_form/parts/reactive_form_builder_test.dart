import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {});

  group('ReactiveFormBuilder.', () {
    test('xxxxxxxxxxxxx.', () {
      ReactiveFormBuilder formBuilder = new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {},
          validators: [],
        ),
      );
      ReactiveFormState formState =
          new ReactiveFormState(formBuilder: formBuilder);
      formState.initialize();
    });
  });
}
