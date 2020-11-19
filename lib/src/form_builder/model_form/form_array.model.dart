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
    String name,
    ModelFormGroup parentGroup,
    List items,
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
    assert(name != null && !name.isEmpty,
        'Cannot initialize form array if its name is not provided.');
    assert(parentGroup != null,
        'Cannot initialize form array if its parent form group is not provided.');
    assert(!super.isInitialized,
        'Cannot initialize form group if this one is already initialized.');

    super.controlName = name;
    super.parentGroup = parentGroup;

    ModelFormState<TModel> formState =
        super.getFormState() as ModelFormState<TModel>;
    ModelFormGroup parentGroup2 = parentGroup as ModelFormGroup;

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

    if (this.items == null) this.items = new List<TCurrentModel>();

    for (TCurrentModel item in this.items) this.addItem(item);
  }

  void addItem(TCurrentModel item) {
    assert(this.items != null, 'Cannot add item to a null list.');
    assert(!this.items.contains(item),
        'Cannot add an item if this one is already added.');
    assert(
        !Collection(super.groups)
            .any((arg1) => (arg1 as ModelFormGroup).current == item),
        'Cannot add an item if this one is already contained into a child form group.');

    this.items.add(item);
    super.addGroup(new ModelFormGroup(
      '${super.controlName}[${super.groups.length}]',
      super.parentGroup as ModelFormGroup,
      true,
    ));
  }

  void removeItem(TCurrentModel item) {
    assert(this.items != null, 'Cannot add item to a null list.');
    assert(this.items.contains(item),
        'Cannot remove an item if this one is not already added.');
    assert(
        Collection(super.groups)
            .any((arg1) => (arg1 as ModelFormGroup).current == item),
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
