import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';
import 'package:queries/collections.dart';

typedef DropdownMenuItem<T> ApplyTemplateForDropdownMenuItem<T>(
    T value, String text);

extension SelectListItemsParsing on List<SelectListItem> {
  List<DropdownMenuItem<T>> toDropdownMenuItems<T extends Comparable>(
    ApplyTemplateForDropdownMenuItem<T> template,
  ) {
    try {
      if (T != DateTime && T != num && T != int && T != double && T != String)
        throw new Exception(
            'field type must be a datetime, a number or a string');
      if (this == null) return null;
      if (template == null) throw new Exception('Template is required');

      List<DropdownMenuItem<T>> items = Collection(this)
          .select((arg1) => template(arg1.value, arg1.text))
          .toList();
      return items;
    } on Exception catch (e) {
      throw new Exception('toDropdownMenuItems method failed. ${e}');
    }
  }
}
