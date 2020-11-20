import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';

class ModelCorrespondenceHandler {
  ModelCorrespondenceHandler() {
    this._correspondences = new Map<String, ModelCorrespondence>();
  }

  Map<String, ModelCorrespondence> _correspondences;

  void add(
    String fpFullname,
    AbstractControl abstractControl,
  ) {
    assert(!this._correspondences.containsKey(fpFullname),
        'Cannot add an already added correspondence.');

    if (this._correspondences == null)
      this._correspondences = new Map<String, ModelCorrespondence>();

    this._correspondences[fpFullname] = new ModelCorrespondence(
      fpFullname,
      abstractControl,
    );
  }

  void remove(
    String fpFullname,
  ) {
    assert(this._correspondences.containsKey(fpFullname),
        'Cannot remove an inexisting correspondence.');

    this._correspondences.remove(fpFullname);
  }

  T getFormElement<T extends AbstractControl>(
    String fpFullname,
  ) {
    assert(T == ModelFormGroup || T == ModelFormArray || T == ModelFormControl,
        'Cannot get the targetted abstract control with type \'${T}\'.');
    assert(this._correspondences.containsKey(fpFullname),
        'Cannot get an inexisting form control. Please check the target name.');
    assert(
        this._correspondences[fpFullname].abstractControl is ModelFormControl,
        'Targetted abstract control is not a form control.');

    T control = this._correspondences[fpFullname].abstractControl as T;
    return control;
  }
}

class ModelCorrespondence {
  ModelCorrespondence(
    this.fpFullname,
    this.abstractControl,
  );

  String fpFullname;
  AbstractControl abstractControl;
}
