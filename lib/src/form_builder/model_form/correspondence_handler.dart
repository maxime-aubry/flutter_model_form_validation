import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

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
    ModelForm model,
    String property,
  ) {
    assert(model != null,
        'Cannot get the targetted form element if the model is not provided.');
    assert(T == ModelFormGroup || T == ModelFormArray || T == ModelFormControl,
        'Cannot get the targetted form element with type \'$T\'.');

    String fullname = model.getPropertyFullname(property);

    assert(this._correspondences.containsKey(fullname),
        'Cannot get an inexisting form element with type \'$T\'. Please check the target name.');
    assert(this._correspondences[fullname].abstractControl is T,
        'Targetted form element is not of type \'$T\'.');

    T control = this._correspondences[fullname].abstractControl as T;
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
