import 'package:example/entities/authentication_model.dart';
import 'package:example/main.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class LoginFormState extends ModelFormState<AuthenticationModel> {
  const LoginFormState({
    AuthenticationModel viewmodel,
    bool isValid = false,
    Map<String, ValidationError> errors = const {},
  }) : super(viewmodel: viewmodel, isValid: isValid, errors: errors);

  LoginFormState updateUser({
    String email,
    String password,
  }) {
    initializeReflectable();
    AuthenticationModel copyOfViewmodel =
        ModelFormUtilities.getDeepCopy(this.viewmodel) ??
            new AuthenticationModel();
    copyOfViewmodel.email = email ?? this.viewmodel?.email ?? null;
    copyOfViewmodel.password = password ?? this.viewmodel?.password ?? null;

    return LoginFormState(
      viewmodel: copyOfViewmodel,
      //isValid: ModelState.isValid<AuthenticationModel>(copyOfViewmodel),
      //errors: ModelState.errors,
      isValid: true,
      errors: {},
    );
  }
}
