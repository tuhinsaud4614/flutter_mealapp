import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(
      {BuildContext context, String text, IconData icon, Function tapHandler}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 20.0,
          ),
          buildListTitle(
            context: context,
            text: "Meals",
            icon: Icons.restaurant,
            tapHandler: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          buildListTitle(
            context: context,
            text: "Filters",
            icon: Icons.settings,
            tapHandler: () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.pathName);
            },
          ),
        ],
      ),
    );
  }
}
