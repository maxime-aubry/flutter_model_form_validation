import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  ListItemsProvider.register('getItems', () {
    List<SelectListItem<String>> items = [
      new SelectListItem<String>('lorem', 'lorem'),
      new SelectListItem<String>('ipsum', 'ipsum'),
      new SelectListItem<String>('dolor', 'dolor'),
    ];
    return items;
  });

  group('MultiSelectString.', () {
    group('Test the validation > success.', () {
      test('Select item is into the list.', () async {
        MultiSelectStringTest model = new MultiSelectStringTest(
          [
            'lorem',
            'ipsum',
          ],
        );
        ModelFormState formState = new ModelFormState(model: model);

        expect(await formState.validateForm(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('Select item is not into the list.', () async {
        MultiSelectStringTest model = new MultiSelectStringTest(
          [
            'amet',
            'consectetur',
          ],
        );
        ModelFormState formState = new ModelFormState(model: model);

        expect(await formState.validateForm(), false);
        expect(formState.status, EFormStatus.invalid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, MultiSelect);
        expect(error.message, 'error message here');
      });
    });
  });
}
