import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:queries/collections.dart';

class MultiSelect<TProperty>
    extends FormControlValidatorAnnotation<List<TProperty>> {
  const MultiSelect({
    @required String serviceName,
    @required String error,
  }) : super(serviceName: serviceName, error: error);

  @override
  Future<bool> isValid(FormControl<List<TProperty>> control) async {
    Future<List<SelectListItem<TProperty>>> Function() service =
        ListItemsProvider.provide<TProperty>(super.serviceName);
    List<SelectListItem> items = await service();
    bool isValid = this._validate(control.value, items);
    return isValid;
  }

  bool _validate(
    List<TProperty> values,
    List<SelectListItem<TProperty>> items,
  ) {
    List<TProperty> itemValues =
        Collection(items).select((arg1) => arg1.value).toList();

    // are each value into the provided list of items ?
    IEnumerable<TProperty> unknownValues =
        Collection(values).except(Collection(itemValues));
    if (unknownValues.any()) return false;

    return true;
  }
}
