import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
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
    this.initialize(name, parentGroup);
  }

  FormArrayItems<ModelForm> items;

  String get modelPartfullname {
    if (this.controlName == null || this.controlName.isEmpty) return null;
    if (this.controlName == 'root' && this.parentGroup == null) return null;
    ModelFormGroup parentGroup2 = this.parentGroup as ModelFormGroup;
    return '${parentGroup2.current.hashCode}.${this.controlName}';
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
    assert(!super.isInitialized,
        'Cannot initialize form group if this one is already initialized.');

    super.controlName = name;
    super.parentGroup = parentGroup;

    ModelFormGroup parentGroup2 = parentGroup as ModelFormGroup;
    ModelFormBuilder formBuilder = super.getFormBuilder() as ModelFormBuilder;
    FormArrayElement<ModelForm> formElement =
        super.getModelPart<FormArrayElement<ModelForm>>(
      parentGroup2.current,
      this.controlName,
    );

    formBuilder.addCorrespondence(
      this.modelPartfullname,
      this,
    );

    super.validators = super.getValidators(
      parentGroup2.current,
      super.controlName,
    );

    formBuilder.formState.update(
      super.fullname,
      null,
      super.validation_status,
    );

    this._actualizeChildren();

    formElement.addListener(() {
      this.items = formElement.value;
      this._actualizeChildren();
    });

    super.isInitialized = true;
  }

  /// [_actualizeChildren] method actualize [items] and [groups] collections of form array.
  void _actualizeChildren() {
    if (this.items == null) this.items = new FormArrayItems<ModelForm>([]);

    // add new groups
    List<ModelForm> itemsToAdd = Collection(this.items)
        .except(Collection(this.groups)
            .select((arg1) => (arg1 as ModelFormGroup).current))
        .toList();

    for (ModelForm item in itemsToAdd)
      super.addGroup(new ModelFormGroup(
        name: '${super.controlName}[${super.groups.length}]',
        parentGroup: super.parentGroup,
        current: item,
        isArrayItem: true,
        formBuilder: null,
      ));

    // remove existing groups
    List<FormGroup> groupsToRemove = Collection(this.groups)
        .where((arg1) => !this.items.contains((arg1 as ModelFormGroup).current))
        .toList();

    if (groupsToRemove.length > 0) {
      for (ModelFormGroup group in groupsToRemove) super.removeGroup(group);

      // rename children's control names
      for (FormGroup group in this.groups) group.updateName();
    }

    itemsToAdd.clear();
    groupsToRemove.clear();
  }

  @override
  Future validate() async =>
      await super.validateControl(this.items, super.formPath, super.modelPath);
}
