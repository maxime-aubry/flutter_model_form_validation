import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:queries/collections.dart';

class MultiSelect<TProperty>
    extends FormControlValidatorAnnotation<List<TProperty>> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const MultiSelect({
    @required String serviceName,
    @required String error,
  }) : super(serviceName: serviceName, error: error);

  /* Public methods */
  @override
  Future<bool> isValid(FormControl<List<TProperty>> control) async {
    Future<List<SelectListItem<TProperty>>> Function() service =
        ListItemsProvider.provide<TProperty>(super.serviceName);
    List<SelectListItem> items = await service();

    this._validateParameters(items);
    bool isValid = this._validate(control.value, items);
    return isValid;
  }

  void _validateParameters(List<SelectListItem> items) {
    if (items == null || items.isEmpty)
      throw new ValidatorParameterException('items is not defined.');
  }

  /* Protected methods */

  /* Private methods */
  bool _validate(
    List<TProperty> values,
    List<SelectListItem<TProperty>> items,
  ) {
    if (values == null || values.isEmpty) return true;

    List<TProperty> itemValues =
        Collection(items).select((arg1) => arg1.value).toList();

    // are each value into the provided list of items ?
    IEnumerable<TProperty> unknownValues =
        Collection(values).except(Collection(itemValues));
    if (unknownValues.any()) return false;

    return true;
  }
}
