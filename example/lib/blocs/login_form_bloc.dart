import 'package:bloc/bloc.dart';
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
}
