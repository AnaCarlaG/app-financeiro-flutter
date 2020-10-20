import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  IconData icon;
  String text;

  DrawerTile(this.icon, this.text);
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () => {},
            child: Container(
                child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  size: 32.0,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 22.0,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                )
              ],
            ))));
  }
}
