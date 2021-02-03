import 'package:example/routes.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  Widget createDrawerBodyItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(child: Text('Examples')),
          createDrawerBodyItem(
            text: 'Reactive form',
            onTap: () => Navigator.pushReplacementNamed(
              context,
              pageRoutes.reactiveForm,
            ),
          ),
          createDrawerBodyItem(
            text: 'Reactive form with dynamic content',
            onTap: () => Navigator.pushReplacementNamed(
              context,
              pageRoutes.reactiveFormWithDynamicContent,
            ),
          ),
          createDrawerBodyItem(
            text: 'Reactive form with form array',
            onTap: () => Navigator.pushReplacementNamed(
              context,
              pageRoutes.reactiveFormWithFormArray,
            ),
          ),
        ],
      ),
    );
  }
}
