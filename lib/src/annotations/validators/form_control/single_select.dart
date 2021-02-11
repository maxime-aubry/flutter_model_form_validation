import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:queries/collections.dart';

class SingleSelect<TProperty>
    extends FormControlValidatorAnnotation<TProperty> {
  const SingleSelect({
    @required this.serviceName,
    @required String error,
  }) : super(error: error);

  /// [serviceName] is the service name that provides items for validators.
  final String serviceName;

  @override
  Future<bool> isValid(FormControl<TProperty> control) async {
    Future<List<SelectListItem<TProperty>>> Function() service =
        ListItemsProvider.provide<TProperty>(this.serviceName);
    List<SelectListItem> items = await service();
    bool isValid = this._validate(control.value, items);
    return isValid;
  }

  bool _validate(
    TProperty value,
    List<SelectListItem<TProperty>> items,
  ) {
    List<TProperty> itemValues =
        Collection(items).select((arg1) => arg1.value).toList();

    // is value into the provided list of items ?
    if (itemValues.contains(value)) return true;

    return true;
  }
}
