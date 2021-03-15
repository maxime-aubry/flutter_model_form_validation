import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class SocialLinksArray extends StatefulWidget {
  @override
  _SocialLinksArrayState createState() => _SocialLinksArrayState();
}

class _SocialLinksArrayState extends State<SocialLinksArray> {
  @override
  Widget build(BuildContext context) {
    return new ReactiveForm(
      step: 'social_links',
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        return Container();
      },
    );
  }

  ReactiveFormBuilder _getFormBuilder() => new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'social_links': new FormArray(
              groups: [],
              validators: [
                NbItems(
                  min: 1,
                  max: 3,
                  error: 'There must be between 1 and 3 items.',
                )
              ],
            ),
          },
          validators: [],
        ),
      );
}
