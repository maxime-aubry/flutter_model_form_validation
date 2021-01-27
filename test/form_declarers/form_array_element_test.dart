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
      
      test('FormArrayElement object with Book type is safely instanciated. Add an item into FormArrayItems object. Listener updates the copy.', () {
        Book copy;
        FormArrayElement<Book> formArray = new FormArrayElement<Book>(null);

        formArray.addListener(() {
          copy = formArray.value[0];
        });

        expect(formArray, isNotNull);
        expect(formArray.value, []);
        formArray.value.add(new Book(
          'Voyage au centre de la terre',
          8.9,
          new DateTime(2020, 04, 08),
        ));
        expect(formArray.value, isNot([]));
        expect(formArray.value[0], copy);
      });
      
      test('FormArrayElement object with Book type is safely instanciated. Remove an item from FormArrayItems object. Listener updates the orignal object.', () {
        Book originalBook = new Book(
          'Voyage au centre de la terre',
          8.9,
          new DateTime(2020, 04, 08),
        );
        FormArrayElement<Book> formArray = new FormArrayElement<Book>([originalBook]);

        formArray.addListener(() {
          if (formArray.value == null || formArray.value == [])
            originalBook = null;
        });

        expect(formArray, isNotNull);
        expect(formArray.value, [originalBook]);
        formArray.value = null;
        expect(formArray.value, []);
      });
    });
  });
}
