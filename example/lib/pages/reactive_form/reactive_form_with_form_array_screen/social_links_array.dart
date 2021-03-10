import 'package:example/models.dart';
import 'package:example/pages/reactive_form/reactive_form_with_form_array_screen/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class SocialLinksArray extends StatefulWidget {
  @override
  _SocialLinksArrayState createState() => _SocialLinksArrayState();
}

class _SocialLinksArrayState extends State<SocialLinksArray> {
  @override
  Widget build(BuildContext context) {
    FormGroup root = context.readFormGroup();

    return new FormArrayProvider(
      create: (context) => root.getFormArray('social_links'),
      builder: (context, _) {
        FormArray formArray = context.watchFormArray();

        if (formArray.groups.length > 0) {
          return SizedBox(
            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: formArray.groups.length,
              itemBuilder: (context, index) {
                FormGroup socialLink = formArray.groups[index];
                int itemIndex = formArray.groups.indexOf(socialLink);

                return new FormGroupProvider(
                  create: (context) => socialLink,
                  builder: (context, __) =>
                      this._getSlidableWithLists(context, itemIndex),
                );
              },
            ),
          );
        }

        return Container();
      },
    );
  }

  Widget _getSlidableWithLists(BuildContext context, int index) {
    FormGroup socialLink = context.readFormGroup();
    FormControl<ESocialNetwork> socialNetwork =
        socialLink.getFormControl<ESocialNetwork>('social_network');

    return Slidable(
      key: Key(socialNetwork.value.toString()),
      direction: Axis.horizontal,
      actionPane: _getActionPane(index),
      actionExtentRatio: 0.25,
      child: new ListItem(),
      actions: [],
      secondaryActions: [
        IconSlideAction(
          caption: 'Edit',
          color: Colors.grey.shade200,
          icon: Icons.more_horiz,
          onTap: () => this._goToPage(context),
          closeOnTap: false,
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async => await this._showDeleteItemDialog(context),
        ),
      ],
    );
  }

  static Widget _getActionPane(int index) {
    switch (index % 4) {
      case 0:
        return SlidableBehindActionPane();
      case 1:
        return SlidableStrechActionPane();
      case 2:
        return SlidableScrollActionPane();
      case 3:
        return SlidableDrawerActionPane();
      default:
        return null;
    }
  }

  void _goToPage(BuildContext context) {
    FormGroup socialLink = context.readFormGroup();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            new FormGroupProvider.value(value: socialLink),
          ],
          child: new EditSocialLink(),
        ),
      ),
    );
  }

  Future<void> _showDeleteItemDialog(BuildContext context) async {
    FormArray socialLinks = context.readFormArray();
    FormGroup socialLink = context.readFormGroup();

    await showDialog<bool>(
      context: context,
      builder: (_) {
        return MultiProvider(
          providers: [
            new FormGroupProvider(create: (_) => socialLink),
            new FormArrayProvider(create: (_) => socialLinks),
          ],
          builder: (context, _) => AlertDialog(
            title: Text('Delete'),
            content: Text('Item will be deleted'),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () async {
                  FormArray socialLinks = context.readFormArray();
                  FormGroup socialLink = context.readFormGroup();
                  await socialLinks.removeGroup(socialLink);
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    FormGroup socialLink = context.readFormGroup();
    FormControl<ESocialNetwork> socialNetwork =
        socialLink.controls['social_network'] as FormControl<ESocialNetwork>;
    FormControl<String> url = socialLink.controls['url'] as FormControl<String>;

    return new GestureDetector(
      onTap: () =>
          Slidable.of(context)?.renderingMode == SlidableRenderingMode.none
              ? Slidable.of(context)?.open()
              : Slidable.of(context)?.close(),
      child: new Container(
        color: Colors.white,
        child: new ListTile(
          title: new Text(socialNetwork.value.toString().split('.')[1]),
          subtitle: new Text(url.value),
        ),
      ),
    );
  }
}
