import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';


void main() {
  initializeReflectable();
  
  group('FormDeclarers.', () {
    group('FormArrayElement.', () {
      test('FormArrayElement object with Book type is safely instanciated. FormArrayItems object is not null but empty.', () {
        FormArrayElement<Book> formArray = new FormArrayElement<Book>(null);

        expect(formArray, isNotNull);
        expect(formArray.value, []);
      });
      
      test('FormArrayElement object with Book type is safely instanciated. Add an item into FormArrayItems object.', () {
        FormArrayElement<Book> formArray = new FormArrayElement<Book>(null);

        expect(formArray, isNotNull);
        expect(formArray.value, []);
      });
    });
  });
}
