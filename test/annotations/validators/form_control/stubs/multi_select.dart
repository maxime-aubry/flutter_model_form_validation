import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../models/models.dart';
import '../../stubs.dart';

class _MultiSelectStub
    extends ValidatorStub<FormControl<List<EGender>>, MultiSelect> {
  List<SelectListItem<EGender>> items;

  _MultiSelectStub({
    List<EGender> value,
    List<SelectListItem<EGender>> items,
  }) {
    ListItemsProvider.clear();
    ListItemsProvider.register<EGender>('getItems', () async => items);

    this.items = items;
    super.control = new FormControl<List<EGender>>(
      value: value,
      validators: [],
    );
    super.validator = MultiSelect(
      serviceName: 'getItems',
      error: null,
    );
  }
}

/* Value is valid */
class MultiSelect_ItemsAreIntoListOfItems_Stub extends _MultiSelectStub {
  MultiSelect_ItemsAreIntoListOfItems_Stub()
      : super(
          value: [EGender.male, EGender.female],
          items: [
            new SelectListItem<EGender>(EGender.male, 'male'),
            new SelectListItem<EGender>(EGender.female, 'female'),
          ],
        );
}

class MultiSelect_ValueIsNull_Stub extends _MultiSelectStub {
  MultiSelect_ValueIsNull_Stub()
      : super(
          value: null,
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
          value: [EGender.other],
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
          value: [EGender.other],
          items: [
            new SelectListItem<EGender>(EGender.male, 'male'),
            new SelectListItem<EGender>(EGender.female, 'female'),
          ],
        );
}

/* Remote parameters are provided */

/* Exceptions */
class MultiSelect_ThrowsValidatorParameterExceptionOnItemsIsNull_Stub
    extends _MultiSelectStub {
  MultiSelect_ThrowsValidatorParameterExceptionOnItemsIsNull_Stub()
      : super(
          value: [EGender.other],
          items: null,
        );
}
