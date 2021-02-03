import 'package:flutter_model_form_validation/src/form/form_control_filter/index.dart';

class FormControlFilter<TProperty> {
  final List<ICheckFilter> _filters = [
    new CheckPrimitives<TProperty>(),
    new CheckListOfPrimitive<TProperty, DateTime>(),
    new CheckListOfPrimitive<TProperty, num>(),
    new CheckListOfPrimitive<TProperty, int>(),
    new CheckListOfPrimitive<TProperty, double>(),
    new CheckListOfPrimitive<TProperty, String>(),
    new CheckListOfPrimitive<TProperty, bool>(),
    new CheckEnum<TProperty>(),
    new CheckListOfEnum<TProperty>(),
  ];

  bool isAllowedFormControlType() {
    for (ICheckFilter filter in this._filters) {
      if (filter.checkFilter()) {
        return true;
      }
    }
    return false;
  }
}
