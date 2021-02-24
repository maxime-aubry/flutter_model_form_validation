import 'package:example/models.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:queries/collections.dart';

class EditSocialLink extends StatefulWidget {
  @override
  _EditSocialLinkState createState() => _EditSocialLinkState();
}

class _EditSocialLinkState extends State<EditSocialLink> {
  List<SelectListItem<ESocialNetwork>> socialNetworks = [
    new SelectListItem<ESocialNetwork>(ESocialNetwork.facebook, 'Facebook'),
    new SelectListItem<ESocialNetwork>(ESocialNetwork.github, 'Github'),
    new SelectListItem<ESocialNetwork>(ESocialNetwork.pub, 'Pub.dev'),
    new SelectListItem<ESocialNetwork>(ESocialNetwork.twitter, 'Twitter'),
  ];

  @override
  Widget build(BuildContext context) {
    FormGroup originalSocialLink = context.readFormGroup();
    ReactiveFormBuilder clonedFormBuilder =
        originalSocialLink.formBuilder.clone();
    FormGroup socialLink =
        Collection(clonedFormBuilder.group.getFormArray('social_links').groups)
            .where((arg1) => arg1.name == originalSocialLink.name)
            .single();

    return ReactiveForm(
      formBuilder: this._getFormBuilder(socialLink),
      child: new Scaffold(
        appBar: new AppBar(title: Text("Edit social link")),
        body: new SingleChildScrollView(
          child: new Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Container(),
          ),
        ),
        /*floatingActionButton: new FloatingActionButton(
          onPressed: () async {
            ReactiveFormState formState = context.readFormState();
            FormGroup form = context.readFormGroup();

            if (await formState.validate()) {
              await this._saveForm(form);
              Navigator.pop(context);
            }
          },
          child: Icon(Icons.done),
        ),*/
        floatingActionButton: new FormStateConsumer(
          builder: (_, formState, __) => new FloatingActionButton(
            child: Icon(Icons.done),
            onPressed: () async {
              if (await formState.validate()) {
                // Data treatment and post to server here...
              }
            },
          ),
        ),
      ),
    );
  }

  ReactiveFormBuilder _getFormBuilder(FormGroup data) =>
      new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'social_network': new FormControl<ESocialNetwork>(
              value:
                  data.getFormControl<ESocialNetwork>('social_network').value,
              validators: [],
            ),
            'url': new FormControl<String>(
              value: data.getFormControl<String>('url').value,
              validators: [],
            ),
          },
          validators: [],
        ),
      );

  Widget _form(BuildContext context) {
    FormGroup form = context.watchFormGroup();

    return new Column(
      children: [
        this._socialNetworkInput(form.controls['social_network']),
        this._urlInput(form.controls['url']),
      ],
    );
  }

  Future<void> _saveForm(FormGroup form) async {
    // get new data
    FormControl<ESocialNetwork> socialNetwork =
        form.getFormControl<ESocialNetwork>('social_network');
    FormControl<String> url = form.getFormControl<String>('url');

    // save data
    await context
        .readFormGroup()
        .getFormControl<ESocialNetwork>('social_network')
        .setValue(socialNetwork.value);
    await context
        .readFormGroup()
        .getFormControl<String>('url')
        .setValue(url.value);
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
