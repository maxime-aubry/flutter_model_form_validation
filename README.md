# Flutter model form validation

Flutter model form validation provides many validators for Flutter, based on [Dart plugin Respectable][1].
This package replaces EasyValidation.

## Get started

First, you need to add the following dependencies to your 'pubspec.yaml':
```yaml
dependencies:
  reflectable: any
  build_runner: any
  flutter_model_form_validation: any
```

## Complete list of available validators

| Validator | Description | Progress |
| --- | --- | --- |
| `ContainsDateTime` | **ContainsDateTime** validator permits you to check that a datetime value is into an array. | **done** |
| `ContainsNumber` | **ContainsNumber** validator permits you to check that a number value is into an array. | **done** |
| `ContainsString` | **ContainsString** validator permits you to check that a string value is into an array. | **done** |
| `DateTimeRange` | **DateTimeRange** validator permits you to check that a datetime using by declared settings. | **done** |
| `Email` | **Email** validator permits you to check that a string value is a valid email. | **done** |
| `EqualToDateTime` | **EqualToDateTime** validator permits you to check that a value is equal to the value of another property. | **done** |
| `EqualToNumber` | **EqualToNumber** validator permits you to check that a value is equal to the value of another property. | **done** |
| `EqualToString` | **EqualToString** validator permits you to check that a value is equal to the value of another property. | **done** |
| `FileMimeType` | **FileMimeType** validator permits you to check that a string value is a valid mime type. | **done** |
| `FileSize` | **FileSize** validator permits you to check that a string value is a valid size. | **done** |
| `GreaterOrEqualToDateTime` | **GreaterOrEqualToDateTime** validator permits you to check that a value is greater or equal to the value of another property. | **done** |
| `GreaterOrEqualToNumber` | **GreaterOrEqualToNumber** validator permits you to check that a value is greater or equal to the value of another property. | **done** |
| `GreaterOrEqualToString` | **GreaterOrEqualToString** validator permits you to check that a value is greater or equal to the value of another property. | **done** |
| `GreaterThanDateTime` | **GreaterThanDateTime** validator permits you to check that a value is greater than the value of another property. | **done** |
| `GreaterThanNumber` | **GreaterThanNumber** validator permits you to check that a value is greater than the value of another property. | **done** |
| `GreaterThanString` | **GreaterThanString** validator permits you to check that a value is greater than the value of another property. | **done** |
| `ImageSize` | **ImageSize** validator permits you to check that a string value is a valid image size. | **done** |
| `InText` | **InText** validator permits you to check that a string value is into a text. | **done** |
| `MembershipPassword` | **MembershipPassword** validator permits you to check that a string value is accordance with declared settings. | **done** |
| `NotEqualToDateTime` | **NotEqualToDateTime** validator permits you to check that a value is not equal to the value of another property. | **done** |
| `NotEqualToNumber` | **NotEqualToNumber** validator permits you to check that a value is not equal to the value of another property. | **done** |
| `NotEqualToString` | **NotEqualToString** validator permits you to check that a value is not equal to the value of another property. | **done** |
| `NumberRange` | **NumberRange** validator permits you to check that a number using by declared settings. | **done** |
| `PhoneNumber` | **PhoneNumber** validator permits you to check that a string value is a valid phone number. | **work in progress**. I need documentation about phone number formats for each country in the world. |
| `RegularExpression` | **RegularExpression** validator permits you to check that a string value is accordance with provided regular expression. | **done** |
| `Required` | **Required** validator permits you to check that a value is provided. | **done** |
| `SmallerOrEqualToDateTime` | **SmallerOrEqualToDateTime** validator permits you to check that a value is smaller or equal to the value of another property. | **done** |
| `SmallerOrEqualToNumber` | **SmallerOrEqualToNumber** validator permits you to check that a value is smaller or equal to the value of another property. | **done** |
| `SmallerOrEqualToString` | **SmallerOrEqualToString** validator permits you to check that a value is smaller or equal to the value of another property. | **done** |
| `SmallerThanDateTime` | **SmallerThanDateTime** validator permits you to check that a value is smaller than the value of another property. | **done** |
| `SmallerThanNumber` | **SmallerThanNumber** validator permits you to check that a value is smaller than the value of another property. | **done** |
| `SmallerThanString` | **SmallerThanString** validator permits you to check that a value is smaller than the value of another property. | **done** |
| `StringLength` | **StringLength** validator permits you to check that a string value has a length between two values. | **done** |
| `StringRange` | **StringRange** validator permits you to check that a string using by declared settings. | **done** |
| `URL` | **URL** validator permits you to check that a string value is a valid URL. | **done** |

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
  @GreaterThanDateTime(valueToCompareOnProperty: 'birthday', error: 'DateOfDeath must be greater than Birthday')
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

MyModel model = new MyModel('Maxime', 'AUBRY', 'M', DateTime.parse('1986-12-22'), null);
bool isValid = ModelState.isValid<MyModel>(tester);

if (isValid) {
  // do stuff...
} else {
  print(ModelState.errors);
}
```

Practice usage for Flutter with Blocs:

Here is the login_form.dart file:
```dart
import 'package:example/blocs/login_form_bloc.dart';
import 'package:example/blocs/login_form_event.dart';
import 'package:example/blocs/login_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class LoginForm extends StatelessWidget {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginFormBloc, LoginFormState>(
      listener: (BuildContext context, LoginFormState state) {},
      child: Material(
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                EmailInput(),
                PasswordInput(focusNode: this._focusNode),
                SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (LoginFormState previous, LoginFormState current) =>
          ModelFormUtilities.refreshWhen(previous, current),
      builder: (BuildContext context, LoginFormState state) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
          ),
          autofocus: true,
          autovalidate: true,
          autocorrect: false,
          keyboardType: TextInputType.text,
          onChanged: (String value) =>
              context.bloc<LoginFormBloc>().add(LoginFormEmailChanged(value)),
          validator: (String value) =>
              ModelFormUtilities.getErrorMessage(state, 'email'),
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  PasswordInput({Key key, @required this.focusNode}) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (LoginFormState previous, LoginFormState current) =>
          ModelFormUtilities.refreshWhen(previous, current),
      builder: (BuildContext context, LoginFormState state) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.grey,
              ),
              onPressed: () {
                alertDialogPasswordValidation(context, controller.text);
              },
            ),
          ),
          focusNode: this.focusNode,
          controller: controller,
          autovalidate: true,
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          onChanged: (String value) => context
              .bloc<LoginFormBloc>()
              .add(LoginFormPasswordChanged(value)),
          validator: (String value) =>
              ModelFormUtilities.getErrorMessage(state, 'password'),
        );
      },
    );
  }
}

Future<void> alertDialogPasswordValidation(
    BuildContext context, String password) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Map<String, bool> rules = MembershipPassword.getErrorDetails(
          password, 8, 16, true, true, true, true);
      Map<String, String> labels = {
        'minLength': 'Min length of 8',
        'maxLength': 'Max length of 16',
        'includesAlphabeticalCharacters': 'At least one alphabetical character',
        'includesUppercaseCharacters': 'At least one uppercase character',
        'includesNumericalCharacters': 'At least one numeric character',
        'includesSpecialCharacters': 'At least one special character',
      };

      return AlertDialog(
        title: Text('Validation rules'),
        content: Container(
          width: double.maxFinite,
          child: ListView(children: <Widget>[
            for (String key in labels.keys)
              ListTile(
                leading: Icon(
                  rules[key] ? Icons.done : Icons.error,
                  color: rules[key] ? Colors.greenAccent : Colors.redAccent,
                ),
                title: Text(labels[key]),
              )
          ]),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (LoginFormState previous, LoginFormState current) =>
          ModelFormUtilities.refreshWhen(
              previous, current, (p, c) => p.isValid != c.isValid),
      builder: (BuildContext context, LoginFormState state) {
        return RaisedButton(
          onPressed: (state.isValid ? () {} : null),
          child: Text('Submit form'),
        );
      },
    );
  }
}
```

Here is the authentication_model.dart file:
```dart
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
```

Here is the authentication_form_bloc.dart:
```dart
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
```

Here is the authentication_form_event.dart file:
```dart
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
```

Here is the authentication_form_state.dart file:
```dart
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
      isValid: ModelState.isValid<AuthenticationModel>(copyOfViewmodel),
      errors: ModelState.errors,
    );
  }
}
```

## Feature requests and bug reports

Please file feature requests and bugs using the [github issue tracker for this repository][2].

[1]: https://github.com/dart-lang/reflectable
[2]: https://github.com/maxime-aubry/flutter_model_form_validation/issues
