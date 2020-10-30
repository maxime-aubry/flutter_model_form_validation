import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

class ModelFormArray<TModel extends ModelForm, TCurrentModel extends ModelForm>
    extends FormArray with ModelFormValidator {
  ModelFormArray(
    ModelFormState<TModel> modelState,
    List items,
    String name,
    ModelFormGroup parentGroup,
  ) : super(name, parentGroup) {
    this.modelState = modelState;
    this.items = (items == null) ? null : items as List<TCurrentModel>;
    this.status = EAbstractControlStatus.pure;
    this._init();
  }

  // public properties
  ModelFormState<TModel> modelState;
  List<TCurrentModel> items;

  void _init() {
    this._actualize();

    // add validators
    if (this.parentGroup != null && this.parentGroup is ModelFormGroup) {
      ModelFormGroup modelFormGroup = this.parentGroup as ModelFormGroup;
      InstanceMirror instanceMirror =
          this.getInstanceMirror(modelFormGroup.current);
      MethodMirror methodMirror =
          instanceMirror.type.declarations[this.name] as MethodMirror;
      this.validators = this.getModelFormValidators(methodMirror);

      // add empty error record to model state
      String listenerName = this.getListenerName(
        this.parentGroup as ModelFormGroup,
        this.name,
      );
      this.modelState.actualizeAbstractControlState(
            listenerName,
            null,
            this.status,
          );

      // add listener, triggered when an item is added or removed, or the list is erased by form user
      this._addListener();
    }
  }

  /// [_addListener] method adds a listener on this form array.
  /// Each time an item will be added or removed, this one will be notified here.
  void _addListener() {
    if (this.parentGroup != null && this.parentGroup is ModelFormGroup) {
      ModelFormGroup modelFormGroup = this.parentGroup as ModelFormGroup;
      String listenerName = this.getListenerName(
        this.parentGroup as ModelFormGroup,
        this.name,
      );
      modelFormGroup.current.addListener(
        () async {
          await _setValue();
        },
        [listenerName],
      );
    }
  }

  /// [_setValue] method set this form control with the new value from form.
  /// Next, this value is validated, and the model state too.
  Future _setValue() async {
    if (this.parentGroup != null && this.parentGroup is ModelFormGroup) {
      ModelFormGroup modelFormGroup = this.parentGroup as ModelFormGroup;
      this._actualize();
      await this.validateModelForm(
        this.modelState,
        modelFormGroup,
        this.name,
        this.items,
      );
    }
  }

  /// [_actualize] method actualize [items] and [groups] collections of form array.
  void _actualize() {
    if (this.parentGroup != null && this.parentGroup is ModelFormGroup) {
      ModelFormGroup modelFormGroup = this.parentGroup as ModelFormGroup;
      InstanceMirror instanceMirror =
          this.getInstanceMirror(modelFormGroup.current);
      this.items = instanceMirror.invokeGetter(this.name);

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
              ));
        }
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
