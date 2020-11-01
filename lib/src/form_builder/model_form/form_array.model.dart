import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

class ModelFormArray<TModel extends ModelForm, TCurrentModel extends ModelForm>
    extends FormArrayBase with ModelFormValidator {
  ModelFormArray(
    ModelFormState<TModel> modelState,
    List items,
    String name,
    ModelFormGroup parentGroup,
  ) : super(name, parentGroup, null) {
    this.modelState = modelState;
    this.items = (items == null) ? null : items as List<TCurrentModel>;
    this.status = EAbstractControlStatus.pure;
    this._init();
  }

  // public properties
  ModelFormState<TModel> modelState;
  List<TCurrentModel> items;

  void _init() {
    if (this.parentGroup != null && this.parentGroup is ModelFormGroup) {
      this._actualizeChildren(this.parentGroup as ModelFormGroup);

      // set listener name
      this.listenerName = this.getListenerName(
        this.parentGroup as ModelFormGroup,
        this.name,
      );

      // set validators
      this.validators = this.getModelFormValidators(
        this.parentGroup as ModelFormGroup,
        this.name,
      );

      // add empty error record to model state
      this.modelState.actualizeAbstractControlState(
            this.listenerName,
            null,
            this.status,
          );

      // add listener, triggered when an item is added or removed, or the list is erased by form user
      this._addListener(this.parentGroup as ModelFormGroup);
    }
  }

  /// [_addListener] method adds a listener on this form array.
  /// Each time an item will be added or removed, this one will be notified here.
  void _addListener(ModelFormGroup parentGroup) {
    assert(parentGroup != null);

    parentGroup.current.addListener(
      () async {
        await _setValue(parentGroup);
      },
      [this.listenerName],
    );
  }

  /// [_setValue] method set this form control with the new value from form.
  /// Next, this value is validated, and the model state too.
  Future _setValue(ModelFormGroup parentGroup) async {
    assert(parentGroup != null);

    this._actualizeChildren(parentGroup);
    await this.validateModelForm(
      this.modelState,
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
              this.modelState,
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
