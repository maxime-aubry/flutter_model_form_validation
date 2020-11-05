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
    this.items = items as List<TCurrentModel>;
    this._initializeFormArray(formState);
  }

  List<TCurrentModel> items;

  String get name => this.controlName;

  void _initializeFormArray(ModelFormState<TModel> formState) {
    assert(formState != null, '');

    this.initialize(
        this.controlName, this.parentGroup as ModelFormGroup, formState,
        () async {
      await this._setValue(this.parentGroup as ModelFormGroup);
    });

    // create sub-object if it is not null
    this._actualizeChildren(this.parentGroup as ModelFormGroup);
  }

  /// [_setValue] method set this form control with the new value from form.
  /// Next, this value is validated, and the model state too.
  Future _setValue(ModelFormGroup parentGroup) async {
    assert(parentGroup != null);

    this._actualizeChildren(parentGroup);
    await this.validate();
  }

  /// [_actualizeChildren] method actualize [items] and [groups] collections of form array.
  void _actualizeChildren(ModelFormGroup parentGroup) {
    InstanceMirror instanceMirror = this.getInstanceMirror(parentGroup.current);
    this.items = this.getSubObject(instanceMirror, this.controlName);

    if (this.items == null) this.items = new List<TCurrentModel>();
    if (this.groups == null) this.initializeGroups();

    // add new items
    for (TCurrentModel item in this.items) {
      bool isInGroup = Collection(this.groups)
          .where((arg1) => (arg1 as ModelFormGroup).current == item)
          .any();
      if (!isInGroup)
        this.addGroup(new ModelFormGroup(
          this.formState,
          item,
          this.controlName,
          this.parentGroup,
          true,
        ));
    }

    // remove lost items
    List<ModelFormGroup> groupsToRemove = new List<ModelFormGroup>();
    for (ModelFormGroup group in this.groups) {
      bool isInItems =
          Collection(this.items).where((arg1) => arg1 == group.current).any();
      if (!isInItems) groupsToRemove.add(group);
    }
    for (ModelFormGroup group in groupsToRemove) this.removeGroup(group);
  }

  Future validate() async => await super.validate$1(
        this.parentGroup as ModelFormGroup,
        this.controlName,
        this.items,
        this.formPath,
        this.modelPath,
      );
}
