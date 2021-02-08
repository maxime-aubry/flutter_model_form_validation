import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class FormArray extends AbstractControl {
  /* Public properties */
  List<FormGroup> groups;

  /* Protected properties */

  /* Private properties */

  /* Getters */
  String get formPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.formPath}' : null;
    part += '.controls[\'${this.name}\']';
    return part;
  }

  String get modelPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.modelPath}' : null;
    part += '.${this.name}';
    return part;
  }

  /* Setters */

  /* Constructors */
  FormArray({
    @required List<FormGroup> groups,
    @required List<FormValidatorAnnotation> validators,
  }) : super(validators) {
    this.groups = groups ?? [];
  }

  /* Public methods */
  void initialize(
    String name,
    FormGroup parentGroup,
    ReactiveFormState formState,
  ) {
    if (name == null || name.isEmpty)
      throw new Exception(
          'Cannot initialize FormArray if its name is not provided.');

    if (this.isInitialized)
      throw new Exception(
          'Cannot initialize an already initialized FormArray.');

    super.name = name;
    super.parentGroup = parentGroup;
    super.formState = formState;
    super.index();
    this._initializeItems();
    super.isInitialized = true;
  }

  void addGroup(
    FormGroup formGroup, {
    bool notify = true,
  }) {
    assert(formGroup != null, 'Cannot add form group if this one is null.');
    assert(!this.groups.contains(formGroup),
        'Cannot add form group if this one is already added.');

    this.groups.add(formGroup);
    this._initializeItem(formGroup);
    if (notify) super.notifyListeners();
  }

  void removeGroup(
    FormGroup formGroup, {
    bool notify = true,
  }) {
    assert(formGroup != null, 'Cannot add form group if this one is null.');
    assert(this.groups.contains(formGroup),
        'Cannot remove form group if this one is not added.');

    this.groups.remove(formGroup);
    this.reindexFormArrayItems();
    if (notify) super.notifyListeners();
  }

  // FormArray clone(FormGroup clonedParent) {
  //   FormArray clone = new FormArray(
  //     groups: [],
  //     validators: this.validators,
  //   );

  //   clone.initialize(super.name, clonedParent);
  //   clone.error = super.error?.copyWith();
  //   this._cloneItems(clone);
  //   return clone;
  // }

  Future validate() async =>
      await super.validateControl(this.formPath, this.modelPath);

  /* Protected methods */
  @protected
  void reindexFormArrayItems({
    bool notify = true,
  }) {
    for (FormGroup group in this.groups)
      this._reindexFormArrayItem(group, notify: notify);
  }

  /* Private methods */
  String _getIndexedFormArrayItemName(FormGroup item) {
    int index = this.groups.indexOf(item);
    String indexedName = '${item.name}[$index]';
    return indexedName;
  }

  void _reindexFormArrayItem(
    FormGroup item, {
    bool notify = true,
  }) {
    item.name = this._getIndexedFormArrayItemName(item);
    if (notify) item.notifyListeners();
  }

  void _initializeItems() {
    for (FormGroup item in this.groups) this._initializeItem(item);
  }

  void _initializeItem(FormGroup item) {
    String indexedName = this._getIndexedFormArrayItemName(item);
    item.initialize(indexedName, this.parentGroup, true, this.formState);
  }

  // void _cloneItems(FormArray clone) {
  //   for (FormGroup formGroup in this.groups) {
  //     FormGroup clonedItem = formGroup.clone(clone.parentGroup);
  //     this._addItem(clonedItem);
  //   }
  // }
}
