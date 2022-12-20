
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            child: Text("Toggl Clone"),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text("Time Tracker"),
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text("Projects"),
          ),
          ListTile(
            leading: Icon(Icons.pie_chart),
            title: Text("Charts"),
          ),

        ],
      ),
    );
  }
}
