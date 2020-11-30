import 'dart:convert';
import 'dart:io';

import 'package:financeiro/pages/TagPageAdd.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class TagTab extends StatefulWidget {
  @override
  _TagTabState createState() => _TagTabState();
}

class _TagTabState extends State<TagTab> {
  List _listTag = [];
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;

  var tagController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _readData().then((data) {
      setState(() {
        _listTag = json.decode(data);
      });
    });
  }

  void _addTag() {
    setState(() {
      Map<String, dynamic> newTag = Map();
      newTag["tag"] = tagController.text;
      tagController.text = "";
      _listTag.add(newTag);
      saveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: tagController,
                  decoration: InputDecoration(
                      labelText: "Criar tags",
                      labelStyle: TextStyle(color: Colors.black38)),
                ),
              ),
              RaisedButton(
                color: Colors.blueGrey,
                child: Text("add"),
                textColor: Colors.white,
                onPressed: _addTag,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0),
              itemCount: _listTag.length,
              itemBuilder: buildItem),
        ),
      ],
    ));
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.redAccent,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: ListTile(
        title: Text(_listTag[index]["tag"]),
      ),
      onDismissed: (direction) {
        setState(() {
          _lastRemoved = Map.from(_listTag[index]);
          _lastRemovedPos = index;
          _listTag.removeAt(index);

          saveData();

          final snack = SnackBar(
            content: Text("Tag ${_lastRemoved["tag"]} removida"),
            action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                setState(() {
                  _listTag.insert(_lastRemovedPos, _lastRemoved);
                  saveData();
                });
              },
            ),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
        });
      },
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> saveData() async {
    String data = json.encode(_listTag);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
