import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

class FormArray<TModel extends ModelForm, TCurrentModel extends ModelForm>
    extends AbstractControl<TModel> {
  FormArray(
    ModelState<TModel> modelState,
    List items,
    String name,
    FormGroup parentGroup,
  )   : assert(modelState != null),
        assert(name != null),
        assert(parentGroup != null),
        super(name, parentGroup) {
    this.modelState = modelState;
    this.items = (items == null) ? null : items as List<TCurrentModel>;
    this.groups = (items == null) ? null : new List<FormGroup>();
    this._init();
  }

  // public properties
  ModelState<TModel> modelState;
  List<TCurrentModel> items;
  List<FormGroup> groups;

  void _init() {
    this._actualize();

    // add validators
    if (this.parentGroup != null) {
      InstanceMirror instanceMirror =
          this.getInstanceMirror(this.parentGroup.current);
      MethodMirror methodMirror =
          instanceMirror.type.declarations[this.name] as MethodMirror;
      this.validators = this.getValidators(methodMirror);

      // add empty error record to model state
      this.modelState.actualizeAbstractControlState(
            super.getListenerName(),
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
    this.parentGroup.current.addListener(
      () async {
        await _setValue();
      },
      [super.getListenerName()],
    );
  }

  /// [_setValue] method set this form control with the new value from form.
  /// Next, this value is validated, and the model state too.
  Future _setValue() async {
    this._actualize();
    await this.validate(this.modelState, this.name, this.items);
  }

  /// [_actualize] method actualize [items] and [groups] collections of form array.
  void _actualize() {
    InstanceMirror instanceMirror =
        this.getInstanceMirror(this.parentGroup.current);
    this.items = instanceMirror.invokeGetter(this.name);

    if (this.items == null) this.items = new List<TCurrentModel>();
    if (this.groups == null) this.groups = new List<FormGroup>();

    // add new items
    for (TCurrentModel item in this.items) {
      bool isInGroup =
          Collection(this.groups).where((arg1) => arg1.current == item).any();
      if (!isInGroup)
        this.groups.add(new FormGroup(
              this.modelState,
              item,
              this.name,
              this.parentGroup,
            ));
    }

    // remove lost items
    List<FormGroup> groupsToRemove = new List<FormGroup>();
    for (FormGroup group in this.groups) {
      bool isInItems =
          Collection(this.items).where((arg1) => arg1 == group.current).any();
      if (!isInItems) groupsToRemove.add(group);
    }
    for (FormGroup group in groupsToRemove) this.groups.remove(group);
  }
}
