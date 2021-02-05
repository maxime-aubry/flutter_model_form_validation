import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/model_form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
import 'package:queries/collections.dart';

class ModelFormArray extends FormArray with ReflectableForm {
  /* Public properties */
  FormArrayItems<ModelForm> items;

  /* Protected properties */

  /* Private properties */

  /* Getters */
  @override
  ModelFormState get formState => super.formState;

  @override
  ModelFormGroup get parentGroup => super.parentGroup;

  // String get modelPartuniqueName {
  //   if (this.name == null || this.name.isEmpty) return null;
  //   if (this.name == 'root' && this.parentGroup == null) return null;
  //   ModelFormGroup parentGroup2 = this.parentGroup as ModelFormGroup;
  //   return '${parentGroup2.model.hashCode}.${this.name}';
  // }

  /* Setters */

  /* Constructors */
  ModelFormArray({
    @required ModelFormState formState,
    @required FormArrayItems<ModelForm> items,
  }) : super(
          validators: [],
          groups: [],
          formState: formState,
        ) {
    this.items = items ?? new FormArrayItems<ModelForm>([]);
  }

  /* Public methods */
  @override
  void initialize(
    String name,
    FormGroup parentGroup,
    FormIndexer indexer,
  ) {
    if (name == null || name.isEmpty)
      throw new Exception(
          'Cannot initialize form array if its name is not provided.');

    if (this.isInitialized)
      throw new Exception(
          'Cannot initialize an already initialized form array.');

    super.name = name;
    super.parentGroup = parentGroup;
    super.indexer = indexer;
    super.index();
    super.validators = super.getValidators(this.parentGroup.model, this.name);
    this._listenModelAndUpdate();
    this._addGroups();
    super.isInitialized = true;
  }

  @override
  Future validate() async =>
      await super.validateControl(super.formPath, super.modelPath);

  /* Protected methods */

  /* Private methods */
  void _addGroups() {
    if (this.items == null) this.items = new FormArrayItems<ModelForm>([]);

    for (ModelForm model in this.items) {
      super.addGroup(
        new ModelFormGroup(
          formBuilder: null,
          formState: this.formState,
          model: model,
        ),
        notify: false,
      );
    }
  }

  void _replaceGroupsAfterItemsUpdate() {
    //#region locales methods
    List<ModelForm> getItemsToAdd() {
      List<ModelForm> alreadyAddedModels = Collection(this.groups)
          .select((arg1) => (arg1 as ModelFormGroup).model)
          .toList();
      List<ModelForm> itemsToAdd = Collection(this.items)
          .except(Collection(alreadyAddedModels))
          .toList();
      return itemsToAdd;
    }

    void addItemsToFormArray(List<ModelForm> modelsToAdd) {
      for (ModelForm model in modelsToAdd) {
        super.addGroup(
          new ModelFormGroup(
            formBuilder: null,
            formState: this.formState,
            model: model,
          ),
          notify: false,
        );
      }
    }

    List<FormGroup> getItemsToRemove() {
      List<FormGroup> itemsToRemove = Collection(this.groups)
          .where((arg1) => !this.items.contains((arg1 as ModelFormGroup).model))
          .toList();
      return itemsToRemove;
    }

    void removeItemsFromFormArray(List<FormGroup> groupsToRemove) {
      for (ModelFormGroup group in groupsToRemove)
        super.removeGroup(
          group,
          notify: false,
        );
    }

    void addMissingItems() {
      List<ModelForm> itemsToAdd = getItemsToAdd();
      addItemsToFormArray(itemsToAdd);
    }

    void removeUselessItems() {
      List<FormGroup> groupsToRemove = getItemsToRemove();
      removeItemsFromFormArray(groupsToRemove);
    }
    //#endregion

    if (this.items == null) this.items = new FormArrayItems<ModelForm>([]);
    addMissingItems();
    removeUselessItems();
    super.reindexFormArrayItems(notify: false);
    super.notifyListeners();
  }

  void _listenModelAndUpdate() {
    FormArrayElement<ModelForm> formElement =
        super.getModelPart<FormArrayElement<ModelForm>>(
      this.parentGroup.model,
      this.name,
    );
    formElement.addListener(() {
      this.items = formElement.value;
      this._replaceGroupsAfterItemsUpdate();
    });
  }
}
