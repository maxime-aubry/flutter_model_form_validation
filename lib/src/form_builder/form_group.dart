import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/model_state.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:reflectable/reflectable.dart';

class FormGroup<TModel extends PropertyChangeNotifier<String>,
        TCurrentModel extends PropertyChangeNotifier<String>>
    extends AbstractControl<TModel> {
  FormGroup(
    ModelState<TModel> modelState,
    Object current,
    String name,
    FormGroup parentGroup,
  )   : assert(modelState != null),
        super(name, parentGroup) {
    this.modelState = modelState;
    this.current = current as TCurrentModel;
    this.name = name;
    this.controls = (current == null) ? null : {};
    this._init();
  }

  // public properties
  ModelState<TModel> modelState;
  TCurrentModel current;
  Map<String, AbstractControl> controls;

  void _init() {
    // create sub-object if it is not null
    if (this.current != null) this._actualize();

    // add validators
    if (this.parentGroup != null) {
      InstanceMirror instanceMirror =
          this.getInstanceMirror(this.parentGroup.current);
      MethodMirror methodMirror =
          instanceMirror.type.declarations[this.name] as MethodMirror;
      this.validators = this.getValidators(methodMirror);

      // add empty error record to model state
      this.modelState.actualizeAbstractControlState(
            '${this.parentGroup.current.hashCode}.${this.name}',
            null,
            this.status,
          );

      // add listener, triggered when a sub-object is added or removed by form user
      this._addListener();
    }
  }

  EFormDeclarer _getFormDeclarer(MethodMirror childDeclaration) {
    if (childDeclaration.dynamicReflectedReturnType == DateTime ||
        childDeclaration.dynamicReflectedReturnType == bool ||
        childDeclaration.dynamicReflectedReturnType == num ||
        childDeclaration.dynamicReflectedReturnType == String)
      return EFormDeclarer.FormControl;

    if (childDeclaration.dynamicReflectedReturnType == List)
      return EFormDeclarer.FormArray;

    return EFormDeclarer.FormGroup;
  }

  Object _getSubObject(InstanceMirror instanceMirror, String propertyName) {
    Object child = instanceMirror.invokeGetter(propertyName);
    return child;
  }

  void _addChildFormGroup(InstanceMirror instanceMirror, String propertyName) {
    Object child = this._getSubObject(instanceMirror, propertyName);
    this.controls[propertyName] = new FormGroup(
      this.modelState,
      child,
      propertyName,
      this,
    );
  }

  void _addChildFormArray(InstanceMirror instanceMirror, String propertyName) {
    List children = this._getSubObject(instanceMirror, propertyName);
    this.controls[propertyName] = new FormArray(
      this.modelState,
      children,
      propertyName,
      this,
    );
  }

  void _addChildFormControl(
      InstanceMirror instanceMirror, String propertyName) {
    Object child = this._getSubObject(instanceMirror, propertyName);
    this.controls[propertyName] = new FormControl(
      this.modelState,
      child,
      propertyName,
      this,
    );
  }

  /// [_addListener] method adds a listener on this form array.
  /// Each time an item will be added or removed, this one will be notified here.
  void _addListener() {
    this.parentGroup.current.addListener(
      () async {
        await _setValue();
      },
      ['${this.parentGroup.current.hashCode}.${this.name}'],
    );
  }

  /// [_setValue] method set this form control with the new value from form.
  /// Next, this value is validated, and the model state too.
  Future _setValue() async {
    // set new sub-object
    InstanceMirror instanceMirror =
        this.getInstanceMirror(this.parentGroup.current);
    this.current = this._getSubObject(instanceMirror, this.name);

    if (this.current != null) {
      // actualize children
      this._actualize();
      // validate current value
      await this.validate(this.modelState, this.name, this.current);
    }
  }

  void _actualize() {
    InstanceMirror instanceMirror = this.getInstanceMirror(this.current);
    Iterable<MapEntry<String, DeclarationMirror>> formControls = instanceMirror
        .type.declarations.entries
        .where((element) =>
            !element.key.endsWith('=') &&
            (element.value as MethodMirror).isGetter)
        .toList();
    this.controls = new Map<String, AbstractControl>();

    for (MapEntry<String, DeclarationMirror> formControl in formControls) {
      EFormDeclarer formDeclarer =
          this._getFormDeclarer(formControl.value as MethodMirror);

      if (formDeclarer == EFormDeclarer.FormGroup)
        this._addChildFormGroup(instanceMirror, formControl.key);

      if (formDeclarer == EFormDeclarer.FormArray)
        this._addChildFormArray(instanceMirror, formControl.key);

      if (formDeclarer == EFormDeclarer.FormControl)
        this._addChildFormControl(instanceMirror, formControl.key);
    }
  }
}

enum EFormDeclarer {
  FormGroup,
  FormArray,
  FormControl,
}
