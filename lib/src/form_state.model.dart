import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class ModelFormState<TModel extends ModelForm> extends FormStateBase {
  ModelFormState(TModel model) : super.modelFormState() {
    this.model = model;
    this._initialize();
  }

  TModel model;

  void _initialize() {
    super.formBuilder = new ModelFormBuilder<TModel>();
    super.formBuilder.initialize(this);
  }

  // @override
  // EAbstractControlStatus getStatus(String name) {
  //   ModelFormBuilder<TModel> modelFormBuilder =
  //       this.formBuilder as ModelFormBuilder<TModel>;

  //   String fullname = modelFormBuilder.correspondenceHandler
  //       .getAbstractControl(name)
  //       ?.fullname;

  //   if (fullname == null || fullname.isEmpty)
  //     throw new Exception('Cannot get correspondence for this object.');

  //   return super.getStatus(fullname);
  // }

  // @override
  // ValidationError getError(String name) {
  //   ModelFormBuilder<TModel> modelFormBuilder =
  //       this.formBuilder as ModelFormBuilder<TModel>;

  //   String fullname = modelFormBuilder.correspondenceHandler
  //       .getAbstractControl(name)
  //       ?.fullname;

  //   if (fullname == null || fullname.isEmpty)
  //     throw new Exception('Cannot get correspondence for this object.');

  //   return super.getError(fullname);
  // }

  // @override
  // String getErrorMessage(String name) {
  //   ValidationError error = this.getError(name);
  //   return error?.message;
  // }
}
