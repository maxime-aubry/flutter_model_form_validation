import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FormDeclarers.', () {
    group('FormControlElement.', () {
      test('', (){
        FormControlElement formControl = new FormControlElement<String>(null, '');

        expect(formControl, isNotNull);
        expect(formControl.hasListeners, isTrue);
        // expect(formControl.)
      });
      
      test('', (){
        expect(() {
          new FormControlElement<String>(null, '');
        }, throwsA(isA<AssertionError>().having((error) => error.message, 'description', 'matcher')));
      });
    });
  });
}
