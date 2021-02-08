// import 'package:flutter/foundation.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:queries/collections.dart';

// class MultiSelect<TProperty> extends FormControlValidatorAnnotation<TProperty> {
//   const MultiSelect({
//     @required this.serviceName,
//     @required String error,
//   }) : super(error: error);

//   /// [serviceName] is the service name that provides items for validators.
//   final String serviceName;

//   @override
//   Future<bool> isValid(FormControl<TProperty> control, String property) async {
//     Function service = ListItemsProvider.provide<TProperty>(this.serviceName);
//     List<SelectListItem> items = await service() as List<SelectListItem>;
//   }

//   bool _validate(
//       List<TProperty> values, List<SelectListItem<TProperty>> items) {
//     List<TProperty> itemValues =
//         Collection(items).select((arg1) => arg1.value).toList();
//     List<TProperty> remaining =
//         Collection(values).except(Collection(itemValues)).toList();
//     bool isValid = !Collection(remaining).any();
//     return isValid;
//   }
// }
