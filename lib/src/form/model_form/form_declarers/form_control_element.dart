import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/model_form/index.dart';

class FormControlElement<TProperty> extends FormElementNotifier<TProperty>
/*with FormControlFilter*/ {
  FormControlElement(TProperty value)
      : assert(FormControlFilter.isAllowedFormControlType<TProperty>(),
            'Cannot instanciate a FormControlElement with a not allowed type. Allowed types are : DateTime, num, int, double, Uint8, Uint16, Uint32, Uint64, Int8, Int16, Int32, Int64, String, bool, enums, List<DateTime>, List<num>, List<int>, List<double>, Uint8List, Uint16List, Uint32List, Uint64List, Int8List, Int16List, Int32List, Int64List, List<String>, List<bool> and a list of enum.'),
        super(value);

  TProperty get value => super.value;

  @override
  set value(TProperty value) {
    super.value = value;
  }
}
