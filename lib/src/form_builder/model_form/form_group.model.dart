import 'package:flutter_model_form_validation/src/annotations/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

enum EFormDeclarer {
  FormGroup,
  FormArray,
  FormControl,
}

class ModelFormGroup<TModel extends ModelForm, TCurrentModel extends ModelForm>
    extends FormGroupBase with ModelFormValidator {
  ModelFormGroup(
    ModelFormState<TModel> modelState,
    Object current,
    String name,
    FormGroupBase parentGroup,
  )   : assert(modelState != null),
        super(name, parentGroup, null) {
    this.modelState = modelState;
    this.current = current as TCurrentModel;
    this.controls = (current == null) ? null : {};
    this.status = EAbstractControlStatus.pure;
    this._init();
  }

  // public properties
  ModelFormState<TModel> modelState;
  TCurrentModel current;

  void _init() {
    // create sub-object if it is not null
    if (this.current != null) this._actualize();

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

      // add listener, triggered when a sub-object is added or removed by form user
      this._addListener();
    }
  }

  // EFormDeclarer _getFormDeclarer(Object value) {
  //   if (value is DateTime || value is bool || value is num || value is String)
  //     return EFormDeclarer.FormControl;

  //   if (value is List<DateTime> ||
  //       value is List<bool> ||
  //       value is List<num> ||
  //       value is List<String>) return EFormDeclarer.FormControl;

  //   if (value is List) return EFormDeclarer.FormArray;

  //   return EFormDeclarer.FormGroup;
  // }

  EFormDeclarer _getFormDeclarer(MethodMirror declarationMirror) {
    bool isFormGroup = Collection(declarationMirror.metadata)
        .any((arg1) => arg1 is FormGroupDeclarer);
    bool isFormArray = Collection(declarationMirror.metadata)
        .any((arg1) => arg1 is FormArrayDeclarer);
    bool isFormControl = Collection(declarationMirror.metadata)
        .any((arg1) => arg1 is FormControlDeclarer);

    int nbPropertyTypes = Collection([isFormGroup, isFormArray, isFormControl])
        .count((arg1) => arg1 == true);

    if (nbPropertyTypes > 1)
      throw new Exception(
          'More than one property type has been declared on this class member.');
    if (isFormGroup) return EFormDeclarer.FormGroup;
    if (isFormArray) return EFormDeclarer.FormArray;
    if (isFormControl) return EFormDeclarer.FormControl;

    // In the case of a collection item, there is not @FormInput annotation
    // so, let's return Input response
    return EFormDeclarer.FormControl;
  }

  Object _getSubObject(InstanceMirror instanceMirror, String propertyName) {
    Object child = instanceMirror.invokeGetter(propertyName);
    return child;
  }

  void _addChildFormGroup(InstanceMirror instanceMirror, String propertyName) {
    Object child = this._getSubObject(instanceMirror, propertyName);
    this.controls[propertyName] = new ModelFormGroup(
      this.modelState,
      child,
      propertyName,
      this,
    );
  }

  void _addChildFormArray(InstanceMirror instanceMirror, String propertyName) {
    List children = this._getSubObject(instanceMirror, propertyName);
    this.controls[propertyName] = new ModelFormArray(
      this.modelState,
      children,
      propertyName,
      this,
    );
  }

  void _addChildFormControl(
      InstanceMirror instanceMirror, String propertyName) {
    Object child = this._getSubObject(instanceMirror, propertyName);
    this.controls[propertyName] = new ModelFormControl(
      this.modelState,
      child,
      propertyName,
      this,
    );
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
    // set new sub-object
    if (this.parentGroup != null && this.parentGroup is ModelFormGroup) {
      ModelFormGroup modelFormGroup = this.parentGroup as ModelFormGroup;
      InstanceMirror instanceMirror =
          this.getInstanceMirror(modelFormGroup.current);
      this.current = this._getSubObject(instanceMirror, this.name);

      if (this.current != null) {
        // actualize children
        this._actualize();
        // validate current value
        await this.validateModelForm(
          this.modelState,
          this.parentGroup,
          this.name,
          this.current,
        );
      }
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
      EFormDeclarer formDeclarer = this._getFormDeclarer(
        formControl.value as MethodMirror,
      );

      if (formDeclarer == EFormDeclarer.FormGroup)
        this._addChildFormGroup(instanceMirror, formControl.key);

      if (formDeclarer == EFormDeclarer.FormArray)
        this._addChildFormArray(instanceMirror, formControl.key);

      if (formDeclarer == EFormDeclarer.FormControl)
        this._addChildFormControl(instanceMirror, formControl.key);
    }
  }
}
