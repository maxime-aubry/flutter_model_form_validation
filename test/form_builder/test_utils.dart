import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_test/flutter_test.dart';

void checkFormGroup({
  @required FormGroup fg,
  @required FormStateBase formState,
  @required String name,
  @required String fullname,
  @required EAbstractControlStatus status,
  @required ValidationError error,
  @required bool areControlsNull,
}) {
  // name
  if (name == null)
    expect(fg.name, isNull);
  else
    expect(fg.name, name);

  // fullname
  if (fullname == null)
    expect(fg.fullname, fullname);
  else
    expect(fg.fullname, fullname);

  // controls
  if (areControlsNull)
    expect(fg.controls, {});
  else
    expect(fg.controls, isNotNull);

  if (!fg.isArrayItem) {
    // status
    expect(formState.getStatus(fullname), status);

    // error
    if (error == null) {
      expect(formState.getError(fullname), isNull);
    } else {
      ValidationError fgError = formState.getError(fullname);
      expect(fgError, isNotNull);
      expect(fgError.message, error.message);
      expect(fgError.propertyName, error.propertyName);
      expect(fgError.validatorType, error.validatorType);
    }
  }
}

void checkFormArray({
  @required FormArray fa,
  @required FormStateBase formState,
  @required String name,
  @required String fullname,
  @required EAbstractControlStatus status,
  @required ValidationError error,
  @required int nbItems,
}) {
  // name
  if (name == null)
    expect(fa.name, isNull);
  else
    expect(fa.name, name);

  // fullname
  if (fullname == null)
    expect(fa.fullname, fullname);
  else
    expect(fa.fullname, fullname);

  // nbItems
  if (nbItems == null)
    expect(fa.groups, []);
  else
    expect(fa.groups.length, nbItems);

  // status
  expect(formState.getStatus(fullname), status);

  // error
  if (error == null) {
    expect(formState.getError(fullname), isNull);
  } else {
    ValidationError faError = formState.getError(fullname);
    expect(faError, isNotNull);
    expect(faError.message, error.message);
    expect(faError.propertyName, error.propertyName);
    expect(faError.validatorType, error.validatorType);
  }
}

void checkFormControl<T>({
  @required FormControl<T> fc,
  @required FormStateBase formState,
  @required String name,
  @required String fullname,
  @required EAbstractControlStatus status,
  @required ValidationError error,
  @required Object value,
}) {
  // name
  if (name == null)
    expect(fc.name, isNull);
  else
    expect(fc.name, name);

  // fullname
  if (fullname == null)
    expect(fc.fullname, fullname);
  else
    expect(fc.fullname, fullname);

  // value
  if (value == null)
    expect(fc.getValue(), isNull);
  else
    expect(fc.getValue(), value);

  // // status
  // expect(formState.getStatus(fullname), status);

  // // error
  // if (error != null) {
  //   ValidationError fcError = formState.getError(fullname);
  //   expect(fcError, isNull);
  // } else {
  //   ValidationError fcError = formState.getError(fullname);
  //   expect(fcError, isNotNull);
  //   expect(fcError.message, error.message);
  //   expect(fcError.propertyName, error.propertyName);
  //   expect(fcError.validatorType, error.validatorType);
  // }
}

void checkModelFormGroup({
  @required ModelFormGroup fg,
  @required ModelFormState formState,
  @required String name,
  @required String fullname,
  @required EAbstractControlStatus status,
  @required ValidationError error,
  @required bool areControlsNull,
}) {
  // name
  if (name == null)
    expect(fg.name, isNull);
  else
    expect(fg.name, name);

  // fullname
  if (fullname == null)
    expect(fg.fullname, fullname);
  else
    expect(fg.fullname, fullname);

  // controls
  if (areControlsNull)
    expect(fg.controls, {});
  else
    expect(fg.controls, isNotNull);

  // if (!fg.isArrayItem) {
  //   // status
  //   expect(formState.getStatus(fullname), status);

  //   // error
  //   if (error == null) {
  //     expect(formState.getError(fullname), isNull);
  //   } else {
  //     ValidationError fgError = formState.getError(fullname);
  //     expect(fgError, isNotNull);
  //     expect(fgError.message, error.message);
  //     expect(fgError.propertyName, error.propertyName);
  //     expect(fgError.validatorType, error.validatorType);
  //   }
  // }
}

void checkModelFormArray({
  @required ModelFormArray fa,
  @required ModelFormState formState,
  @required String name,
  @required String fullname,
  @required EAbstractControlStatus status,
  @required ValidationError error,
  @required int nbItems,
}) {
  // name
  if (name == null)
    expect(fa.name, isNull);
  else
    expect(fa.name, name);

  // fullname
  if (fullname == null)
    expect(fa.fullname, fullname);
  else
    expect(fa.fullname, fullname);

  // nbItems
  if (nbItems == null)
    expect(fa.groups, []);
  else
    expect(fa.groups.length, nbItems);

  // // status
  // expect(formState.getStatus(fullname), status);

  // // error
  // if (error == null) {
  //   expect(formState.getError(fullname), isNull);
  // } else {
  //   ValidationError faError = formState.getError(fullname);
  //   expect(faError, isNotNull);
  //   expect(faError.message, error.message);
  //   expect(faError.propertyName, error.propertyName);
  //   expect(faError.validatorType, error.validatorType);
  // }
}

void checkModelFormControl<TModel extends ModelForm>({
  @required ModelFormControl fc,
  @required TModel model,
  @required ModelFormState formState,
  @required String name,
  @required String fullname,
  @required EAbstractControlStatus status,
  @required ValidationError error,
  @required Object value,
}) {
  // name
  if (name == null)
    expect(fc.name, isNull);
  else
    expect(fc.name, name);

  // fullname
  if (fullname == null)
    expect(fc.fullname, fullname);
  else
    expect(fc.fullname, fullname);

  // value
  if (value == null)
    expect(fc.getValue(), isNull);
  else
    expect(fc.getValue(), value);

  // status
  expect(formState.getStatus(fullname), status);

  // error
  if (error == null) {
    expect(formState.getError(fullname), isNull);
  } else {
    ValidationError fcError = formState.getError(fullname);
    expect(fcError, isNotNull);
    expect(fcError.message, error.message);
    expect(fcError.propertyName, error.propertyName);
    expect(fcError.validatorType, error.validatorType);
  }
}
