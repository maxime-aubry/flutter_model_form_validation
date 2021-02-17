import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../models/models.dart';
import '../../stubs.dart';

class _MultiSelectStub
    extends ValidatorStub<FormControl<List<EGender>>, MultiSelect> {
  _MultiSelectStub({
    List<EGender> fcValue,
    List<SelectListItem<EGender>> items,
  }) {
    ListItemsProvider.clear();

    if (items != null)
      ListItemsProvider.register<EGender>('getItems', () async => items);

    super.control = new FormControl<List<EGender>>(
      value: fcValue,
      validators: [],
    );
    super.validator = MultiSelect(
      serviceName: 'getItems',
      error: 'invalid items',
    );
  }
}

/* Value is valid */
class MultiSelect_ItemsAreIntoListOfItems_Stub extends _MultiSelectStub {
  MultiSelect_ItemsAreIntoListOfItems_Stub()
      : super(
          fcValue: [EGender.male, EGender.female],
          items: [
            new SelectListItem<EGender>(EGender.male, 'male'),
            new SelectListItem<EGender>(EGender.female, 'female'),
          ],
        );
}

class MultiSelect_ValueIsNull_Stub extends _MultiSelectStub {
  MultiSelect_ValueIsNull_Stub()
      : super(
          fcValue: null,
          items: [
            new SelectListItem<EGender>(EGender.male, 'male'),
            new SelectListItem<EGender>(EGender.female, 'female'),
          ],
        );
}

class MultiSelect_ValueIsEmpty_Stub extends _MultiSelectStub {
  MultiSelect_ValueIsEmpty_Stub()
      : super(
          fcValue: [],
          items: [
            new SelectListItem<EGender>(EGender.male, 'male'),
            new SelectListItem<EGender>(EGender.female, 'female'),
          ],
        );
}

class MultiSelect_AddItemsToServiceAfterInitialization_Stub
    extends _MultiSelectStub {
  MultiSelect_AddItemsToServiceAfterInitialization_Stub()
      : super(
          fcValue: [EGender.other],
          items: [
            new SelectListItem<EGender>(EGender.male, 'male'),
            new SelectListItem<EGender>(EGender.female, 'female'),
          ],
        );
}

/* Value is not valid */
class MultiSelect_ItemsAreNotIntoListOfItems_Stub extends _MultiSelectStub {
  MultiSelect_ItemsAreNotIntoListOfItems_Stub()
      : super(
          fcValue: [EGender.other],
          items: [
            new SelectListItem<EGender>(EGender.male, 'male'),
            new SelectListItem<EGender>(EGender.female, 'female'),
          ],
        );
}

/* Remote parameters are provided */

/* Exceptions on parameters */
