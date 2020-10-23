import 'package:flutter_model_form_validation/src/form_builder/abstract_control.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_group.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

class FormArray<TModel extends PropertyChangeNotifier<String>,
        TCurrentModel extends PropertyChangeNotifier<String>>
    extends AbstractControl {
  FormArray(
    TModel model,
    List items,
    AbstractControl parent,
  )   : assert(model != null),
        assert(items != null),
        super() {
    this.model = model;
    this.items = items as List<TCurrentModel>;
    this.groups = new List<FormGroup>();
    this._parent = parent;
    this._init();
  }

  // private properties
  FormGroup _parent;

  // public properties
  TModel model;
  List<TCurrentModel> items;
  List<FormGroup> groups;

  void _init() {
    for (TCurrentModel item in items)
      this.groups.add(new FormGroup(this.model, item, this._parent));
  }
}
