import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  ListItemsProvider.register('getItems', () {
    List<SelectListItem<DateTime>> items = [
      new SelectListItem<DateTime>(new DateTime(2020, 01, 01), '2020-01-01'),
      new SelectListItem<DateTime>(new DateTime(2020, 01, 02), '2020-01-02'),
      new SelectListItem<DateTime>(new DateTime(2020, 01, 03), '2020-01-03'),
    ];
    return items;
  });

  group('MultiSelectDateTime.', () {
    group('Test the validation > success.', () {
      test('Select item is into the list.', () async {
        MultiSelectDatetimeTest model = new MultiSelectDatetimeTest(
          [
            new DateTime(2020, 01, 01),
            new DateTime(2020, 01, 02),
          ],
        );
        ModelFormState formState = new ModelFormState(model: model);

        expect(await formState.validate(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('Select item is not into the list.', () async {
        MultiSelectDatetimeTest model = new MultiSelectDatetimeTest(
          [
            new DateTime(2020, 01, 04),
            new DateTime(2020, 01, 05),
          ],
        );
        ModelFormState formState = new ModelFormState(model: model);

        expect(await formState.validate(), false);
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