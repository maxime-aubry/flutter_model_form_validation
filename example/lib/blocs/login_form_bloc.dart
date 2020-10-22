/*import 'package:bloc/bloc.dart';
import 'package:example/blocs/login_form_event.dart';
import 'package:example/blocs/login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(const LoginFormState());

  @override
  Stream<LoginFormState> mapEventToState(LoginFormEvent event) async* {
    if (event is LoginFormEmailChanged)
      yield _mapUsernameChangedToState(event, state);
    else if (event is LoginFormPasswordChanged)
      yield _mapPasswordChangedToState(event, state);
  }

  LoginFormState _mapUsernameChangedToState(
    LoginFormEmailChanged event,
    LoginFormState state,
  ) {
    return state.updateUser(email: event.email);
  }

  LoginFormState _mapPasswordChangedToState(
    LoginFormPasswordChanged event,
    LoginFormState state,
  ) {
    return state.updateUser(password: event.password);
  }
}*/

import 'package:bloc/bloc.dart';
import 'package:example/blocs/login_form_event.dart';
import 'package:example/entities/authentication_model.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class LoginFormBloc
    extends Bloc<LoginFormEvent, ModelState<AuthenticationModel>> {
  LoginFormBloc()
      : super(new ModelState<AuthenticationModel>(new AuthenticationModel()));

  @override
  Stream<ModelState<AuthenticationModel>> mapEventToState(
      LoginFormEvent event) async* {
    if (event is LoginFormEmailChanged)
      yield _mapUsernameChangedToState(event, state);
  }

  ModelState<AuthenticationModel> _mapUsernameChangedToState(
    LoginFormEmailChanged event,
    ModelState<AuthenticationModel> state,
  ) {
    state.model.email = event.email;
    return state;
  }

  ModelState<AuthenticationModel> _mapPasswordChangedToState(
    LoginFormPasswordChanged event,
    ModelState<AuthenticationModel> state,
  ) {
    state.model.password = event.password;
    return state;
  }
}
