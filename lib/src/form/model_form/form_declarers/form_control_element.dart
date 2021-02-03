import 'package:flutter_model_form_validation/src/form/form_control_filter/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/model_form/index.dart';

class FormControlElement<TProperty> extends FormElementNotifier<TProperty> {
  FormControlElement(TProperty value) : super(value) {
    // check if TProperty is an alloew type
    // throw an exception if not
    FormControlFilter<TProperty> filter = new FormControlFilter<TProperty>();

    if (!filter.isAllowedFormControlType())
      throw new Exception(
        'Cannot instanciate a FormControlElement with a not allowed type $TProperty. Allowed types are : DateTime, num, int, double, Uint8, Uint16, Uint32, Uint64, Int8, Int16, Int32, Int64, String, bool, enums, List<DateTime>, List<num>, List<int>, List<double>, Uint8List, Uint16List, Uint32List, Uint64List, Int8List, Int16List, Int32List, Int64List, List<String>, List<bool> and a list of enum.',
      );
  }

  TProperty get value => super.value;

  @override
  set value(TProperty value) {
    super.value = value;
  }
}
