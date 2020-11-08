import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  ListItemsProvider.register('getItems', () {
    List<SelectListItem<num>> items = [
      new SelectListItem<num>(1, 'Number 1'),
      new SelectListItem<num>(2, 'Number 2'),
      new SelectListItem<num>(3, 'Number 3'),
    ];
    return items;
  });

  group('SingleSelectNumber.', () {
    group('Test the validation > success.', () {
      test('Select item is into the list.', () async {
        SingleSelectNumberTest model = new SingleSelectNumberTest(2);
        ModelFormState<SingleSelectNumberTest> modelState =
            new ModelFormState<SingleSelectNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('Select item is not into the list.', () async {
        SingleSelectNumberTest model = new SingleSelectNumberTest(4);
        ModelFormState<SingleSelectNumberTest> modelState =
            new ModelFormState<SingleSelectNumberTest>(model);

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
