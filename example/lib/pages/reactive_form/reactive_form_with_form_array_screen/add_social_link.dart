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
  Widget build(BuildContext context) {
    ReactiveFormState formState = context.readFormState();
    FormArray socialLinks = context.readFormArray();
    FormGroup root = socialLinks.parentGroup;
    FormGroup socialLink = new FormGroup(
      controls: {
        'social_network': new FormControl<ESocialNetwork>(value: null),
        'url': new FormControl<String>(value: null),
      },
    );
    socialLinks.addGroup(socialLink);

    return ReactiveForm(
      //context: new SubFormContext(formState: formState, formGroup: root),
      formBuilder: null,
      child: new WillPopScope(
        onWillPop: () async =>
            await this._deleteCurrent(socialLinks, socialLink),
        child: new Scaffold(
          appBar: new AppBar(title: Text("Add new social link")),
          body: new SingleChildScrollView(
            child: new Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: new Column(
                children: [
                  this._socialNetworkInput(
                      socialLink.controls['social_network']),
                  this._urlInput(socialLink.controls['url']),
                ],
              ),
            ),
          ),
          floatingActionButton: new FloatingActionButton(
            onPressed: () async {
              ReactiveFormState formState = context.readFormState();

              if (await formState.validate()) {
                Navigator.pop(context);
              }
            },
            child: Icon(Icons.done),
          ),
        ),
      ),
    );
  }

  Future<bool> _deleteCurrent(
    FormArray socialLinks,
    FormGroup socialLink,
  ) async {
    socialLinks.removeGroup(socialLink);
    return true;
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
