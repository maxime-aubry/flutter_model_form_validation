import 'package:dart_json_mapper/dart_json_mapper.dart' show jsonSerializable;
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

@flutterModelFormValidator
@jsonSerializable
class AuthenticationModel {
  AuthenticationModel({
    this.email,
    this.password,
  });

  @Required(error: 'Email is required')
  @Email(error: 'Invalid email')
  String email;

  @Required(error: 'Password is required')
  @MembershipPassword(
      minLength: 8,
      maxLength: 16,
      includesAlphabeticalCharacters: true,
      includesUppercaseCharacters: true,
      includesNumericalCharacters: true,
      includesSpecialCharacters: true,
      error: 'Invalid password')
  String password;
}
