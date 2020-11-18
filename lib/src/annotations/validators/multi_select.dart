import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';
import 'package:queries/collections.dart';

/// [MultiSelect] validator permits you to check that items are into an array of DateTime, Number or String values.
/// {@category Metadata}
/// {@subCategory Validators}
class MultiSelect<TValue> extends FormValidatorAnnotation {
  const MultiSelect({
    @required this.serviceName,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [serviceName] is the service name that provides items for validators.
  final String serviceName;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid(
    FormBuilder fb,
    FormGroup fg,
    Object value,
    String formPath,
    String modelFormPath,
  ) async {
    try {
      if (value == null) return true;

      if (this.serviceName == null || this.serviceName.isEmpty)
        throw new Exception('Service name is not provided');

      if (value is! List<DateTime> &&
          value is! List<num> &&
          value is! List<int> &&
          value is! List<double> &&
          value is! List<String>)
        throw new Exception(
            'field type must be a datetime, a number or a string');

      Function f = ListItemsProvider.get(this.serviceName);
      List<SelectListItem> items = await f() as List<SelectListItem>;

      if (items is! List<SelectListItem<DateTime>> &&
          items is! List<SelectListItem<num>> &&
          items is! List<SelectListItem<int>> &&
          items is! List<SelectListItem<double>> &&
          items is! List<SelectListItem<String>>)
        throw new Exception(
            'items type must be a list of datetime, number or string');

      if (value is List<DateTime> && items is List<SelectListItem<DateTime>>) {
        bool isValid = this._validate<DateTime>(
          values: value,
          items: items,
        );
        return isValid;
      }

      if (value is List<num> && items is List<SelectListItem<num>>) {
        bool isValid = this._validate<num>(
          values: value,
          items: items,
        );
        return isValid;
      }

      if (value is List<int> && items is List<SelectListItem<int>>) {
        bool isValid = this._validate<int>(
          values: value,
          items: items,
        );
        return isValid;
      }

      if (value is List<double> && items is List<SelectListItem<double>>) {
        bool isValid = this._validate<double>(
          values: value,
          items: items,
        );
        return isValid;
      }

      if (value is List<String> && items is List<SelectListItem<String>>) {
        bool isValid = this._validate<String>(
          values: value,
          items: items,
        );
        return isValid;
      }

      throw Exception('Value type and items type are different');
    } on RemotePropertyException catch (e) {
      throw e;
    } catch (e) {
      throw new ValidationException(
          'An error occured with validator on form element with validator of type');
    }
  }

  bool _validate<TValue extends Comparable>({
    @required List<TValue> values,
    @required List<SelectListItem<TValue>> items,
  }) {
    List<TValue> itemValues =
        Collection(items).select((arg1) => arg1.value).toList();
    List<TValue> remaining =
        Collection(values).except(Collection(itemValues)).toList();
    bool isValid = !Collection(remaining).any();
    return isValid;
  }
}
