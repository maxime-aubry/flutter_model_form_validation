import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {});

  group('ReactiveFormState.', () {
    test(
        'ReactiveFormState cannot be initialized of FormBuilder is not provided.',
        () {
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

    test(
        'ReactiveFormState cannot be initialized of FormBuilder is not provided.',
        () {
      expect(() {
        ReactiveFormState formState = new ReactiveFormState(formBuilder: null);
        formState.initialize();
      }, throwsA(isInstanceOf<Exception>()));
    });
  });
}
