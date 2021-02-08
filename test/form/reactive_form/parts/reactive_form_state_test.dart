import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ReactiveFormBuilder _formBuilder;
  ReactiveFormState _formState;

  setUpAll(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  setUp(() {
    _formBuilder = new ReactiveFormBuilder(
      group: new FormGroup(
        controls: {},
        validators: [],
      ),
    );
    _formState = new ReactiveFormState(formBuilder: _formBuilder);
  });

  group('ReactiveFormState.', () {
    test(
        'ReactiveFormState and ReactiveFormBuilder are initialized.',
        () {
      _formState.initialize();
    });

    test(
        'ReactiveFormState cannot be initialized of ReactiveFormBuilder is not provided.',
        () {
      _formBuilder = null;
      _formState = new ReactiveFormState(formBuilder: null);

      expect(
        () {
          _formState.initialize();
        },
        throwsA(
          isA<FormBuilderException>().having(
              (error) => error.message,
              'description',
              'Cannot initialize ReactiveFormState if ReactiveFormBuilder is not provided.'),
        ),
      );
    });
  });
}
