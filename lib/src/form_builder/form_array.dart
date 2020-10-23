import 'package:flutter_model_form_validation/src/form_builder/abstract_control.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_group.dart';
import 'package:flutter_model_form_validation/src/model_state.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

class FormArray<TModel extends PropertyChangeNotifier<String>,
        TCurrentModel extends PropertyChangeNotifier<String>>
    extends AbstractControl {
  FormArray(
    ModelState<TModel> modelState,
    List items,
    AbstractControl parent,
  )   : assert(modelState != null),
        assert(items != null),
        super() {
    this.modelState = modelState;
    this.items = items as List<TCurrentModel>;
    this.groups = new List<FormGroup>();
    this._parent = parent;
    this._init();
  }

  // private properties
  FormGroup _parent;

  // public properties
  ModelState<TModel> modelState;
  List<TCurrentModel> items;
  List<FormGroup> groups;

  void _init() {
    for (TCurrentModel item in items)
      this.groups.add(new FormGroup(this.modelState, item, this._parent));
  }
}
