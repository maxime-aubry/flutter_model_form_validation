import 'package:equatable/equatable.dart';

abstract class LoginFormEvent extends Equatable {
  const LoginFormEvent();

  @override
  List<Object> get props => [];
}

class LoginFormEmailChanged extends LoginFormEvent {
  const LoginFormEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class LoginFormPasswordChanged extends LoginFormEvent {
  const LoginFormPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}
