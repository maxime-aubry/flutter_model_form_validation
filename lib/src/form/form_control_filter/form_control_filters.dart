import 'package:flutter_model_form_validation/src/form/form_control_filter/index.dart';

mixin FormControlFilter<TProperty> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */
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

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  void checkAllowedFormControlType() {
    bool isAllowed = false;

    for (ICheckFilter filter in this._filters) {
      if (filter.checkFilter()) {
        isAllowed = true;
        break;
      }
    }

    if (!isAllowed) {
      throw new Exception(
        '''Cannot instanciate a FormControlElement with a not allowed type $TProperty.
        Allowed types are : DateTime, num, int, double, Uint8, Uint16, Uint32, Uint64, Int8, Int16, Int32, Int64, String, bool, enums, List<DateTime>, List<num>, List<int>, List<double>, Uint8List, Uint16List, Uint32List, Uint64List, Int8List, Int16List, Int32List, Int64List, List<String>, List<bool> and a list of enum.''',
      );
    }
  }

  /* Protected methods */

  /* Private methods */
}
