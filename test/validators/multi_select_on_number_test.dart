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

  group('MultiSelectNumber.', () {
    group('Test the validation > success.', () {
      test('Select item is into the list.', () async {
        MultiSelectNumberTest model = new MultiSelectNumberTest([1, 2]);
        ModelFormState<MultiSelectNumberTest> formState =
            new ModelFormState<MultiSelectNumberTest>(model);

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
        MultiSelectNumberTest model = new MultiSelectNumberTest([4, 5]);
        ModelFormState<MultiSelectNumberTest> formState =
            new ModelFormState<MultiSelectNumberTest>(model);

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
