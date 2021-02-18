import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

mixin FormValidatorNavigator {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  FormGroup getFormGroup(
    /// [currentGroup] is the parent group of current [AbstractControl] provided to the validator.
    FormGroup currentGroup,

    /// [remoteParameterName] is a name of sought [FormGroup].
    String remoteParameterName,
  ) {
    if (!this.doesAbstractControlExist<FormGroup>(
      currentGroup,
      remoteParameterName,
    ))
      throw new ValidatorNavigationException(
          '$remoteParameterName is not defined.');

    FormGroup formGroup = currentGroup.getFormGroup(remoteParameterName);
    return formGroup;
  }

  FormArray getFormArray(
    /// [currentGroup] is the parent group of current [AbstractControl] provided to the validator.
    FormGroup currentGroup,

    /// [remoteParameterName] is a name of sought [FormArray].
    String remoteParameterName,
  ) {
    if (!this.doesAbstractControlExist<FormArray>(
      currentGroup,
      remoteParameterName,
    ))
      throw new ValidatorNavigationException(
          '$remoteParameterName is not defined.');

    FormArray formArray = currentGroup.getFormArray(remoteParameterName);
    return formArray;
  }

  FormControl<TProperty> getFormControl<TProperty>(
    /// [currentGroup] is the parent group of current [AbstractControl] provided to the validator.
    FormGroup currentGroup,

    /// [remoteParameterName] is a name of sought [FormControl].
    String remoteParameterName,
  ) {
    if (!this.doesAbstractControlExist<FormControl<TProperty>>(
      currentGroup,
      remoteParameterName,
    ))
      throw new ValidatorNavigationException(
          '$remoteParameterName is not defined.');

    FormControl<TProperty> formControl =
        currentGroup.getFormControl<TProperty>(remoteParameterName);
    return formControl;
  }

  bool doesAbstractControlExist<TAbstractControl extends AbstractControl>(
    /// [currentGroup] is the parent group of current [AbstractControl] provided to the validator.
    FormGroup currentGroup,

    /// [remoteParameterName] is a name of sought [AbstractControl].
    String remoteParameterName,
  ) {
    bool exists = currentGroup.controls.containsKey(remoteParameterName);

    if (!exists) return false;

    AbstractControl control = currentGroup.controls[remoteParameterName];

    if (control is! TAbstractControl)
      throw new ValidatorNavigationException(
          'AbstractControl exists but it is not of $TAbstractControl type.');

    return true;
  }

  TParameter getRemoteValidatorParameter<TParameter>({
    /// [defaultValue] is a constant, provided by developer inside the validator annotation.
    @required TParameter defaultValue,

    /// [localParameterName] is the name of constant that hosts the default value.
    @required String localParameterName,

    /// [remoteParameterName] is a name of [FormControl] that provides an overriding value of [defaultValue].
    @required String remoteParameterName,

    /// The [control] is a [FormGroup].
    /// It's the parent group provided [AbstractControl] for the current validator.
    @required FormGroup control,

    ///// [required] defines if a value is waited or not.
    ///// If nothing is returned, a [ValidatorParameterException] exception will be thrown.
    //bool required = false,
  }) {
    //#region locales methods
    TParameter getCastedDefaultValue() {
      if (defaultValue == null) return null;

      if (TParameter == DateTime) {
        if (defaultValue is! ConstantDateTime) {
          throw new ValidatorParameterException(
            '''Cannot get datetime from remote parameter.
            This one is not a ConstantDateTime object, its type is $TParameter.
            Please, provide a ConstantDateTime object, just like this :
            @Validator(parameter: ConstantDateTime('yyyy-MM-ddTHH:mm:ssZ'))''',
          );
        }
        defaultValue =
            (defaultValue as ConstantDateTime).toDateTime() as TParameter;
      }

      return defaultValue;
    }

    TParameter getRemoteParameter() {
      TParameter remoteParameter =
          this.getFormControl<TParameter>(control, remoteParameterName)?.value;
      return remoteParameter;
    }

    TParameter getParameter() {
      if (remoteParameterName == null || remoteParameterName.isEmpty)
        throw new ValidatorParameterException(
            'Remote parameter name is not defined.');

      bool isRemoteParameterDefined = (remoteParameterName != null);
      if (!isRemoteParameterDefined) return defaultValue;

      TParameter parameter = getRemoteParameter();
      return parameter;
    }
    //#endregion

    defaultValue = getCastedDefaultValue();
    TParameter parameter = getParameter();
    return parameter;
  }

  /* Protected methods */

  /* Private methods */
}
