import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../models/models.dart';
import '../../stubs.dart';

class _SingleSelectStub
    extends ValidatorStub<FormControl<EGender>, SingleSelect> {
  _SingleSelectStub({
    EGender fcValue,
    List<SelectListItem<EGender>> items,
  }) {
    ListItemsProvider.clear();

    if (items != null)
      ListItemsProvider.register<EGender>('getItems', () async => items);

    super.control = new FormControl<EGender>(
      value: fcValue,
      validators: [],
    );
    super.validator = SingleSelect(
      serviceName: 'getItems',
      error: 'invalid items',
    );
  }
}

/* Value is valid */
class SingleSelect_ItemIsIntoListOfItems_Stub extends _SingleSelectStub {
  SingleSelect_ItemIsIntoListOfItems_Stub()
      : super(
          fcValue: EGender.male,
          items: [
            new SelectListItem<EGender>(EGender.male, 'male'),
            new SelectListItem<EGender>(EGender.female, 'female'),
          ],
        );
}

class SingleSelect_ValueIsNull_Stub extends _SingleSelectStub {
  SingleSelect_ValueIsNull_Stub()
      : super(
          fcValue: null,
          items: [
            new SelectListItem<EGender>(EGender.male, 'male'),
            new SelectListItem<EGender>(EGender.female, 'female'),
          ],
        );
}

class SingleSelect_AddItemsToServiceAfterInitialization_Stub
    extends _SingleSelectStub {
  SingleSelect_AddItemsToServiceAfterInitialization_Stub()
      : super(
          fcValue: EGender.other,
          items: [
            new SelectListItem<EGender>(EGender.male, 'male'),
            new SelectListItem<EGender>(EGender.female, 'female'),
          ],
        );
}

/* Value is not valid */
class SingleSelect_ItemIsNotIntoListOfItems_Stub extends _SingleSelectStub {
  SingleSelect_ItemIsNotIntoListOfItems_Stub()
      : super(
          fcValue: EGender.other,
          items: [
            new SelectListItem<EGender>(EGender.male, 'male'),
            new SelectListItem<EGender>(EGender.female, 'female'),
          ],
        );
}

/* Remote parameters are provided */

/* Exceptions on parameters */
