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

  group('SingleSelectString.', () {
    group('Test the validation > success.', () {
      test('Select item is into the list.', () async {
        SingleSelectStringTest model = new SingleSelectStringTest('ipsum');
        ModelFormState<SingleSelectStringTest> modelState =
            new ModelFormState<SingleSelectStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('Select item is not into the list.', () async {
        SingleSelectStringTest model = new SingleSelectStringTest('amet');
        ModelFormState<SingleSelectStringTest> modelState =
            new ModelFormState<SingleSelectStringTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SingleSelect);
        expect(error.message, 'error message here');
      });
    });
  });
}
