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
