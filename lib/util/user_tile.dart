// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  //final DocumentSnapshot snapshot;
  // UserTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "title",
        style: TextStyle(color: Colors.blueGrey),
      ),
      subtitle: Text(
        "sub",
        style: TextStyle(color: Colors.teal[900]),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            "Tags",
            style: TextStyle(color: Colors.cyan[800]),
          ),
          Text(
            "Gasto ",
            style: TextStyle(color: Colors.blueGrey),
          )
        ],
      ),
    );
  }
}
