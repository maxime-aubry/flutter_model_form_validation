import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

class ModelFormArray<TModel extends ModelForm, TCurrentModel extends ModelForm>
    extends FormArray with ModelFormValidator {
  ModelFormArray(
    List items,
    String name,
    ModelFormGroup parentGroup,
  ) : super(
          validators: new List<FormValidatorAnnotation>(),
          groups: new List<FormGroup>(),
        ) {
    this.items = items ?? new List<TCurrentModel>();
    this.initialize(name, parentGroup);
  }

  List<TCurrentModel> items;

  @override
  @protected
  void initialize(
    String name,
    FormGroup parentGroup,
  ) {
    if (name == null || name.isEmpty)
      throw new Exception(
          'Cannot initialize form array if its name is not provided.');

    if (parentGroup == null)
      throw new Exception(
          'Cannot initialize form array if its parent form group is not provided.');

    if (super.isInitialized)
      throw new Exception(
          'Cannot initialize form group if this one is already initialized.');

    ModelFormState<TModel> formState =
        super.getFormState() as ModelFormState<TModel>;
    ModelFormGroup parentGroup2 = parentGroup as ModelFormGroup;

    super.controlName = name;
    super.parentGroup = parentGroup2;

    super.validators = super.getValidators(
      parentGroup2.current,
      super.controlName,
    );

    formState.update(
      super.fullname,
      null,
      super.status,
    );

    this._actualizeChildren(
      super.parentGroup as ModelFormGroup<TModel, TCurrentModel>,
    );

    super.isInitialized = true;
  }

  /// [_actualizeChildren] method actualize [items] and [groups] collections of form array.
  void _actualizeChildren(ModelFormGroup parentGroup) {
    InstanceMirror instanceMirror =
        super.getInstanceMirror(parentGroup.current);
    this.items = super.getSubObject(instanceMirror, super.controlName)
        as List<TCurrentModel>;

    for (TCurrentModel item in this.items) this.addItem(item);
  }

  void addItem(TCurrentModel item) {
    if (this.items == null)
      throw new Exception('Cannot add item to a null list.');

    if (this.items.contains(item))
      throw new Exception('Cannot add an item if this one is already added.');

    if (Collection(super.groups)
        .any((arg1) => (arg1 as ModelFormGroup).current == item))
      throw new Exception(
          'Cannot add an item if this one is already contained into a child form group.');

    this.items.add(item);
    super.addGroup(new ModelFormGroup(
      item,
      '${super.controlName}[${super.groups.length}]',
      super.parentGroup as ModelFormGroup,
      true,
    ));
  }

  void removeItem(TCurrentModel item) {
    if (this.items == null)
      throw new Exception('Cannot add item to a null list.');

    if (!this.items.contains(item))
      throw new Exception(
          'Cannot remove an item if this one is not already added.');

    if (!Collection(super.groups)
        .any((arg1) => (arg1 as ModelFormGroup).current == item))
      throw new Exception(
          'Cannot remove an item if this one is not already contained into a child form group.');

    ModelFormGroup formGroup = Collection(super.groups)
        .where((arg1) => (arg1 as ModelFormGroup).current == item)
        .single() as ModelFormGroup;

    this.items.remove(item);
    super.removeGroup(formGroup);
  }

  @override
  Future validate() async =>
      await super.validateControl(this.items, super.formPath, super.modelPath);
}
