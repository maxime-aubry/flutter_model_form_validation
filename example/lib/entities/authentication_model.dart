import 'package:dart_json_mapper/dart_json_mapper.dart' show jsonSerializable;
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

@flutterModelFormValidator
@jsonSerializable
class AuthenticationModel with PropertyChangeNotifier<String> {
  AuthenticationModel();

  // private properties
  String _email;
  String _password;

  // getters
  @Required(error: 'Email is required')
  @Email(error: 'Invalid email')
  String get email => this._email;

  @Required(error: 'Password is required')
  @MembershipPassword(
      minLength: 8,
      maxLength: 16,
      includesAlphabeticalCharacters: true,
      includesUppercaseCharacters: true,
      includesNumericalCharacters: true,
      includesSpecialCharacters: true,
      error: 'Invalid password')
  String get password => this._password;

  // setters
  set email(String value) {
    this._email = value;
    notifyListeners('email');
  }

  set password(String value) {
    this._password = value;
    notifyListeners('password');
  }
}
