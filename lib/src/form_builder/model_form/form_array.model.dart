import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

class ModelFormArray<TModel extends ModelForm, TCurrentModel extends ModelForm>
    extends FormArrayBase with ModelFormValidator {
  ModelFormArray(
    ModelFormState<TModel> formState,
    List items,
    String name,
    ModelFormGroup parentGroup,
  ) : super(name, parentGroup, null) {
    this.formState = formState;
    this.items = items as List<TCurrentModel>;
    this.status = EAbstractControlStatus.pure;
    this._initialize();
  }

  // public properties
  List<TCurrentModel> items;

  // getters
  String get listenerName => super.listenerName;
  EAbstractControlStatus get status => super.status;

  // private methods
  void _initialize() {
    if (this.parentGroup != null && this.parentGroup is ModelFormGroup) {
      super.initialize(parentGroup as ModelFormGroup, name, () async {
        this._setValue(parentGroup as ModelFormGroup);
      });
      this._actualizeChildren(this.parentGroup as ModelFormGroup);
    }
  }

  /// [_setValue] method set this form control with the new value from form.
  /// Next, this value is validated, and the model state too.
  Future _setValue(ModelFormGroup parentGroup) async {
    assert(parentGroup != null);

    this._actualizeChildren(parentGroup);
    await super.validate(
      this.formState,
      parentGroup,
      this.name,
      this.items,
      this.formPath,
      this.modelPath,
    );
  }

  /// [_actualizeChildren] method actualize [items] and [groups] collections of form array.
  void _actualizeChildren(ModelFormGroup parentGroup) {
    assert(parentGroup != null);

    InstanceMirror instanceMirror = this.getInstanceMirror(parentGroup.current);
    this.items = this.getSubObject(instanceMirror, this.name);

    if (this.items == null) this.items = new List<TCurrentModel>();
    if (this.groups == null) this.groups = new List<ModelFormGroup>();

    // add new items
    for (TCurrentModel item in this.items) {
      bool isInGroup = Collection(this.groups)
          .where((arg1) => (arg1 as ModelFormGroup).current == item)
          .any();
      if (!isInGroup) {
        this.groups.add(new ModelFormGroup(
              this.formState,
              item,
              this.name,
              this.parentGroup,
              true,
            ));
      }
    }

    // remove lost items
    List<ModelFormGroup> groupsToRemove = new List<ModelFormGroup>();
    for (ModelFormGroup group in this.groups) {
      bool isInItems =
          Collection(this.items).where((arg1) => arg1 == group.current).any();
      if (!isInItems) groupsToRemove.add(group);
    }
    for (ModelFormGroup group in groupsToRemove) this.groups.remove(group);
  }
}
