import 'package:example/models.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class AddSocialLink extends StatefulWidget {
  @override
  _AddSocialLinkState createState() => _AddSocialLinkState();
}

class _AddSocialLinkState extends State<AddSocialLink> {
  List<SelectListItem<ESocialNetwork>> socialNetworks = [
    new SelectListItem<ESocialNetwork>(ESocialNetwork.facebook, 'Facebook'),
    new SelectListItem<ESocialNetwork>(ESocialNetwork.github, 'Github'),
    new SelectListItem<ESocialNetwork>(ESocialNetwork.pub, 'Pub.dev'),
    new SelectListItem<ESocialNetwork>(ESocialNetwork.twitter, 'Twitter'),
  ];

  @override
  void initState() {
    ListItemsProvider.register<ESocialNetwork>(
      'getListOfSocialNetwork',
      () async => socialNetworks,
    );

    super.initState();
  }

  @override
  void dispose() {
    ListItemsProvider.close('getListOfSocialNetwork');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FormArray socialLinks = context.readFormArray();

    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      child: new Scaffold(
        appBar: new AppBar(title: Text("Add social link")),
        body: new Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: new FormGroupConsumer(
            builder: (_, root, __) => new Column(
              children: [
                this._socialNetworkInput(
                  root.getFormControl<ESocialNetwork>('social_network'),
                ),
                this._urlInput(root.getFormControl<String>('url')),
              ],
            ),
          ),
        ),
        floatingActionButton: new FormStateConsumer(
          builder: (context, formState, _) => new FloatingActionButton(
            child: Icon(Icons.done),
            onPressed: () async {
              if (await formState.validate()) {
                FormGroup socialLinkToAdd = context.readFormGroup();
                this._saveForm(socialLinks, socialLinkToAdd);
              }
            },
          ),
        ),
      ),
    );
  }

  ReactiveFormBuilder _getFormBuilder() => new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'social_network': new FormControl<ESocialNetwork>(
              value: null,
              validators: [
                Required(error: 'social network is required.'),
                SingleSelect(
                  serviceName: 'getListOfSocialNetwork',
                  error: 'unknown social network.',
                )
              ],
            ),
            'url': new FormControl<String>(
              value: null,
              validators: [
                Required(error: 'url is required.'),
                Url(
                  protocols: [EUrlProtocol.http, EUrlProtocol.https],
                  error: 'invalid URL.',
                ),
              ],
            ),
          },
          validators: [],
        ),
      );

  Future<void> _saveForm(
    FormArray socialLinks,
    FormGroup socialLinkToAdd,
  ) async {
    socialLinks.addGroup(socialLinkToAdd);
    Navigator.of(context).pop();
  }

  Widget _socialNetworkInput(FormControl<ESocialNetwork> formControl) =>
      new CustomSingleDropdown<ESocialNetwork>(
        label: 'social network',
        dataSource: this.socialNetworks,
        formControl: formControl,
      );

  Widget _urlInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'url', formControl: formControl);
}
