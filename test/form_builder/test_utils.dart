import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_test/flutter_test.dart';

void checkFormGroup({
  @required FormGroup fg,
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
    expect(fg.status, status);

    // error
    if (error == null) {
      expect(fg.error, isNull);
    } else {
      expect(fg.error, isNotNull);
      expect(fg.error.message, error.message);
      expect(fg.error.propertyName, error.propertyName);
      expect(fg.error.validatorType, error.validatorType);
    }
  }
}

void checkFormArray({
  @required FormArray fa,
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
  expect(fa.status, status);

  // error
  if (error == null) {
    expect(fa.error, isNull);
  } else {
    expect(fa.error, isNotNull);
    expect(fa.error.message, error.message);
    expect(fa.error.propertyName, error.propertyName);
    expect(fa.error.validatorType, error.validatorType);
  }
}

void checkFormControl<T>({
  @required FormControl<T> fc,
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
  expect(fc.status, status);

  // error
  if (error == null) {
    expect(fc.error, isNull);
  } else {
    expect(fc.error, isNotNull);
    expect(fc.error.message, error.message);
    expect(fc.error.propertyName, error.propertyName);
    expect(fc.error.validatorType, error.validatorType);
  }
}

void checkModelFormGroup({
  @required ModelFormGroup fg,
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
    expect(fg.status, status);

    // error
    if (error == null) {
      expect(fg.error, isNull);
    } else {
      expect(fg.error, isNotNull);
      expect(fg.error.message, error.message);
      expect(fg.error.propertyName, error.propertyName);
      expect(fg.error.validatorType, error.validatorType);
    }
  }
}

void checkModelFormArray({
  @required ModelFormArray fa,
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
  expect(fa.status, status);

  // error
  if (error == null) {
    expect(fa.error, isNull);
  } else {
    expect(fa.error, isNotNull);
    expect(fa.error.message, error.message);
    expect(fa.error.propertyName, error.propertyName);
    expect(fa.error.validatorType, error.validatorType);
  }
}

void checkModelFormControl<TModel extends ModelForm>({
  @required ModelFormControl fc,
  @required TModel model,
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
  expect(fc.status, status);

  // error
  if (error == null) {
    expect(fc.error, isNull);
  } else {
    expect(fc.error, isNotNull);
    expect(fc.error.message, error.message);
    expect(fc.error.propertyName, error.propertyName);
    expect(fc.error.validatorType, error.validatorType);
  }
}
