// import 'package:flutter/foundation.dart';
// import 'package:flutter_model_form_validation/src/exceptions/index.dart';
// import 'package:flutter_model_form_validation/src/form/index.dart';
// import 'package:flutter_model_form_validation/src/form/model_form/index.dart';
// import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
// import 'package:reflectable/reflectable.dart';

// enum EFormDeclarer {
//   FormGroup,
//   FormArray,
//   FormControl,
// }

// class ModelFormGroup extends FormGroup
//     with ReflectableForm, ReflectableFormGroup {
//   /* Public properties */
//   ModelForm model;

//   /* Protected properties */

//   /* Private properties */

//   /* Getters */
//   @override
//   ModelFormState get formState => super.formState;

//   @override
//   ModelFormGroup get parent => super.parent;

//   bool get isRoot => (super.name != 'root' && super.parent != null);

//   // String get modelPartuniqueName {
//   //   if (this.name == null || this.name.isEmpty) return null;
//   //   if (this.name == 'root' && this.parentGroup == null) return null;
//   //   ModelFormGroup parentGroup2 = this.parentGroup as ModelFormGroup;
//   //   return '${parentGroup2.current.hashCode}.${this.name}';
//   // }

//   /* Setters */

//   /* Constructors */
//   ModelFormGroup({
//     @required ModelFormState formState,
//     @required ModelForm model,
//   }) : super(
//           controls: {},
//           validators: [],
//         ) {
//     this.model = model;
//   }

//   /* Public methods */
//   @override
//   void initialize(
//     String name,
//     FormGroup parentGroup,
//     bool isArrayItem,
//     ReactiveFormState formState,
//   ) {
//     if (name == null || name.isEmpty)
//       throw new FormBuilderException(
//           'Cannot initialize ModelFormGroup if its name is not provided.');

//     if (this.isInitialized)
//       throw new FormBuilderException(
//           'Cannot initialize an already initialized ModelFormGroup.');

//     if (formState is! ModelFormState)
//       throw new FormBuilderException(
//           'Cannot initialize ModelFormGroup with a non-ModelFormState.');

//     super.name = name;
//     super.parent = parentGroup;
//     super.formState = formState;
//     super.index();
//     super.isArrayItem = isArrayItem;
//     // root form group does not have validators. It's not necessary to listen it, it's impossible to set it to null.
//     // form array items does not have validators.
//     if (!this.isRoot && !this.isArrayItem) {
//       super.validators = super.getValidators(this.parent.model, this.name);
//       this._listenModelAndUpdate();
//     }
//     this._addControls();
//     super.isInitialized = true;
//   }

//   @override
//   Future validate() async => await super.validateControl();

//   /* Protected methods */

//   /* Private methods */
//   void _addControls() {
//     InstanceMirror instanceMirror = this.getInstanceMirror(this.model);

//     for (MapEntry<String, FormElementNotifier> formElement
//         in super.getControls(model, instanceMirror)) {
//       if (formElement.value is FormGroupElement)
//         this._addChildFormGroup(formElement.key);
//       if (formElement.value is FormArrayElement)
//         this._addChildFormArray(formElement.key);
//       if (formElement.value is FormControlElement)
//         this._addChildFormControl(formElement.key, formElement.value);
//       continue;
//     }

//     super.notifyListeners();
//   }

//   void _replaceControlsAfterModelUpdate() {
//     if (super.controls != null) super.clearControls();
//     if (this.model == null) {
//       super.notifyListeners();
//       return;
//     }
//     this._addControls();
//   }

//   void _listenModelAndUpdate() {
//     FormGroupElement<ModelForm> formElement =
//         super.getModelPart<FormGroupElement<ModelForm>>(
//       this.parent.model,
//       this.name,
//     );
//     formElement.addListener(() {
//       this.model = formElement.value;
//       this._replaceControlsAfterModelUpdate();
//     });
//   }

//   void _addChildFormGroup(String property) {
//     ModelForm model = super
//         .getModelPart<FormGroupElement<ModelForm>>(this.model, property)
//         .value;

//     super.addControl(
//       property,
//       new ModelFormGroup(
//         formState: this.formState,
//         model: model,
//       ),
//     );
//   }

//   void _addChildFormArray(String property) {
//     List<ModelForm> model = super
//         .getModelPart<FormArrayElement<ModelForm>>(this.model, property)
//         .value;

//     super.addControl(
//       property,
//       new ModelFormArray(
//         formState: this.formState,
//         items: model,
//       ),
//     );
//   }

//   void _addChildFormControl(
//     String property,
//     FormControlElement formElement,
//   ) {
//     Object value =
//         super.getModelPart<FormControlElement>(this.model, property).value;

//     super.addControl(
//       property,
//       new ModelFormControl(
//         formState: this.formState,
//         value: value,
//       ),
//     );
//   }
// }
