import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form/model_form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
import 'package:queries/collections.dart';

class ModelFormArray extends FormArray with ModelFormValidator {
  ModelFormArray({
    @required String name,
    @required ModelFormGroup parentGroup,
    @required FormArrayItems<ModelForm> items,
  }) : super(
          validators: [],
          groups: [],
        ) {
    this.items = items ?? new FormArrayItems<ModelForm>([]);
  }

  FormArrayItems<ModelForm> items;

  String get modelPartfullname {
    if (this.name == null || this.name.isEmpty) return null;
    if (this.name == 'root' && this.parentGroup == null) return null;
    ModelFormGroup parentGroup2 = this.parentGroup as ModelFormGroup;
    return '${parentGroup2.current.hashCode}.${this.name}';
  }

  @override
  @protected
  void initialize(
    String name,
    FormGroup parentGroup,
  ) {
    assert(name != null && !name.isEmpty,
        'Cannot initialize form array if its name is not provided.');
    assert(parentGroup != null,
        'Cannot initialize form array if its parent form group is not provided.');
    // assert(!super.isInitialized,
    //     'Cannot initialize form group if this one is already initialized.');

    super.name = name;
    super.parentGroup = parentGroup;
    super.getValidators(super.parentGroup, super.name);
    this._actualizeChildren();
    this._updateValueOnModelChange(super.parentGroup);
    // super.isInitialized = true;
  }

  /// [_actualizeChildren] method actualize [items] and [groups] collections of form array.
  void _actualizeChildren() {
    if (this.items == null) this.items = new FormArrayItems<ModelForm>([]);

    List<ModelForm> itemsToAdd = this._getItemsToAdd();
    this._addItemsToFormArray(itemsToAdd);

    List<FormGroup> groupsToRemove = this._getItemsToRemove();
    this._removeItemsFromFormArray(groupsToRemove);
    super.reindexFormArrayItems();
  }

  @override
  Future validate() async =>
      await super.validateControl(this.items, super.formPath, super.modelPath);

  /* Private methods */
  void _updateValueOnModelChange(ModelFormGroup parentGroup) {
    FormArrayElement<ModelForm> formElement =
        super.getModelPart<FormArrayElement<ModelForm>>(
      parentGroup.current,
      this.name,
    );
    formElement.addListener(() {
      this.items = formElement.value;
      this._actualizeChildren();
    });
  }

  List<ModelForm> _getItemsToAdd() {
    List<ModelForm> items = Collection(this.items)
        .except(Collection(this.groups)
            .select((arg1) => (arg1 as ModelFormGroup).current))
        .toList();
    return items;
  }

  List<FormGroup> _getItemsToRemove() {
    List<FormGroup> items = Collection(this.groups)
        .where((arg1) => !this.items.contains((arg1 as ModelFormGroup).current))
        .toList();
    return items;
  }

  void _addItemsToFormArray(List<ModelForm> modelsToAdd) {
    for (ModelForm model in modelsToAdd) {
      super.addGroup(new ModelFormGroup(
        name: '${super.name}[${super.groups.length}]',
        parentGroup: super.parentGroup,
        current: model,
        isArrayItem: true,
        formBuilder: null,
      ));
    }
  }

  void _removeItemsFromFormArray(List<FormGroup> groupsToRemove) {
    for (ModelFormGroup group in groupsToRemove) super.removeGroup(group);
  }
}
