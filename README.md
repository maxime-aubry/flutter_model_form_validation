# Flutter model form validation

Flutter model form validation provides many validators for Flutter, based on [Dart plugin Respectable][1].

## Get started

First, you need to add the following dependencies to your 'pubspec.yaml':
```yaml
dependencies:
  reflectable: any
  build_runner: any
  flutter_model_form_validation: any
```

## How to use validators and validate a model
Here is a simple usage example. Note that a lot of examples are available in unit test file `test/flutter_model_form_validation_test.dart`.

How to define a class model with validation:

```dart
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

@flutterModelFormValidator
class MyModel {
  MyModel(this.firstname, this.lastname, this.gender, this.birthday, this.dateOfDeath);
  
  @Required(error: 'Firstname is required')
  @StringLength(min: 3, max: 32, error: 'Firstname must have between 3 and 32 characters')
  final String firstname;
  
  @Required(error: 'Lastname is required')
  @StringLength(min: 3, max: 32, error: 'Lastname must have between 3 and 32 characters')
  final String lastname;

  @Required(error: 'Gender is required')
  @StringLength(min: 1, max: 1, error: 'Gender must have 1 character')
  final String gender;

  @Required(error: 'Birthday is requried')
  @DateTimeRange(min: '1900-01-01', max: null, error: 'Birthday must be betwwen 1900/01/01 and infinity')
  final DateTime birthday;

  @DateTimeRange(min: '1900-01-01', max: null, error: 'DateOfDeath must be betwwen 1900/01/01 and infinity')
  @GreaterOrEqualTo(propertyName: 'birthday', error: 'DateOfDeath must be greater than Birthday')
  final DateTime dateOfDeath;
}
```

Each time you add a validator and each time you update your model class, you must regenerate a mapping file of your models and validators.
If this file is not generated and update after any change, Flutter model form validation won't work !

Use this command line to get the file to get a new file named `*.reflectable.dart` into a flutter package project.

```console
> flutter packages pub run build_runner build
```

Use this command line to get the file to get a new file named `*.reflectable.dart` into a flutter application project.

```console
> flutter pub run build_runner build
```

How to validate a model:

- Import the generated mapping file.
- Call `initializeReflectable` funtion.

```dart
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:*.reflectable.dart';

initializeReflectable();

MyModel tester = new MyModel('Maxime', 'AUBRY', 'M', DateTime.parse('1986-12-22'), null);
bool isValid = ModelState.isValid<MyModel>(tester);

if (isValid) {
  // do stuff...
} else {
  print(ModelState.errors);
}
```

Practice usage for Flutter with Blocs:

Here is the authentication_form.dart file:
```dart
class AuthenticationForm extends StatefulWidget {
  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthenticationFormBloc _authenticationFormBloc;

  @override
  void initState() {
    super.initState();
    _authenticationFormBloc = BlocProvider.of<AuthenticationFormBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext pageContext) {
    return MultiBlocListener(
      listeners: [
        // ...
      ],
      child: BlocBuilder<AuthenticationFormBloc, AuthenticationFormState>(
        builder: (BuildContext context, AuthenticationFormState state) {
          return Form(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>
                  EmailInput(controller: _emailController),
                  PasswordInput(controller: _passwordController),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Events
  void _onEmailChanged() {
    _authenticationFormBloc
        .dispatch(EmailChangedEvent(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _authenticationFormBloc
        .dispatch(PasswordChangedEvent(password: _passwordController.text));
  }
}
```

Here is the email_input.dart:
```dart
class PasswordInput extends StatelessWidget {
  PasswordInput({
    @required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final AuthenticationFormBloc _authenticationFormBloc =
        BlocProvider.of<AuthenticationFormBloc>(context);

    return BlocBuilder<AuthenticationFormBloc, AuthenticationFormState>(
      bloc: _authenticationFormBloc,
      builder: (BuildContext context, AuthenticationFormState state) {
        return TextFormField(
          decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.grey,
              ),
            ),
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.grey),
          ),
          controller: controller,
          obscureText: true,
          autovalidate: true,
          autocorrect: false,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          validator: (String value) {
            if (state.errors.containsKey('password'))
              return state.errors['password'];
            return null;
          },
        );
      },
    );
  }
}
```

Here is the authentication_model.dart file:
```dart
@flutterModelFormValidator
class AuthenticationModel {
  AuthenticationModel(
    this.email,
    this.password,
  );

  @Required(error: 'Email is required')
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
```

Here is the authentication_form_bloc.dart:
```dart
class AuthenticationFormBloc
    extends Bloc<AuthenticationFormEvent, AuthenticationFormState> {
  @override
  AuthenticationFormState get initialState => AuthenticationFormState.initial();

  @override
  Stream<AuthenticationFormState> mapEventToState(
    AuthenticationFormEvent event,
  ) async* {
    if (event is PasswordChangedEvent)
      yield* _onPasswordChanged(event.password);
  }

  Stream<AuthenticationFormState> _onPasswordChanged(String password) async* {
    yield currentState.copyWith(password: password);
  }
}
```

Here is the authentication_form_event.dart file:
```dart
@immutable
abstract class AuthenticationFormEvent extends Equatable {
  AuthenticationFormEvent([List props = const []]) : super(props);
}

class PasswordChangedEvent extends AuthenticationFormEvent {
  final String password;

  PasswordChangedEvent({@required this.password}) : super([password]);

  @override
  String toString() => 'PasswordChangedEvent { password: $password }';
}
```

Here is the authentication_form_state.dart file:
```dart
import 'dart:convert';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:equatable/equatable.dart';
import 'package:greenworld/main.reflectable.dart';
import 'package:greenworld/models/authentication_model.dart';
import 'package:meta/meta.dart';

@immutable
class AuthenticationFormState extends Equatable {
  final String email;
  final String password;
  final Map<String, ValidationError> errors = Map<String, ValidationError>();
  final bool isFormValid;

  AuthenticationFormState({
    @required this.email,
    @required this.password,
    Map<String, ValidationError> errors,
    @required this.isFormValid,
  }) : super([
          email,
          password,
          isFormValid,
        ]) {
    this.errors.addAll(errors);
  }

  bool _validate(AuthenticationModel model, Map<String, ValidationError> _errors) {
    initializeReflectable();
    bool _isFormValid = ModelState.isValid<AuthenticationModel>(model);

    if (_isFormValid) {
      print('form is valid');
      print(json.encode(model));
      _errors.clear();
    } else {
      print('Form is not valid');
      print(json.encode(model));
      _errors.addAll(ModelState.errors ?? Map<String, ValidationError>());
    }

    return _isFormValid;
  }

  factory AuthenticationFormState.initial() {
    return AuthenticationFormState(
      email: '',
      password: '',
      errors: Map<String, ValidationError>(),
      isFormValid: false,
    );
  }

  AuthenticationFormState copyWith({
    String email,
    String password,
    String retypePassword,
  }) {
    AuthenticationModel model = AuthenticationModel(
      email ?? this.email,
      password ?? this.password,
    );
    Map<String, ValidationError> _errors = Map<String, ValidationError>();
    bool _isFormValid = _validate(model, _errors);

    return AuthenticationFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      errors: _errors,
      isFormValid: _isFormValid,
    );
  }

  @override
  String toString() {
    return '''AuthenticationFormState {
      email: $email,
      password: $password,
      errors: $errors,
      isFormValid: $isFormValid,
    }''';
  }
}
```

## Feature requests and bug reports

Please file feature requests and bugs using the [github issue tracker for this repository][2].

[1]: https://github.com/dart-lang/reflectable
[2]: https://github.com/maxime-aubry/flutter_model_form_validation/issues
