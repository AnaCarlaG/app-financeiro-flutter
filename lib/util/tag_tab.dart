import 'package:financeiro/model/tag.model.dart';
import 'package:financeiro/pages/TagPageAdd.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class TagTab extends StatefulWidget {
  @override
  _TagTabState createState() => _TagTabState();

  var tags = List<TagModel>();
  var tagModel = new TagModel();
  TagTab() {
    tags = [];
  }
}

class _TagTabState extends State<TagTab> {
  var _tagControl = TextEditingController();
  Map<String, dynamic> _tagData = Map();

  void add() {
    if (_tagControl.text.isEmpty) return;
    setState(() {
      widget.tags.add(TagModel(name: _tagControl.text));
    });
    _tagControl.text = "";
    // widget.tagModel.CreatTag(_tagData, () => _onSucess, () => _onFail);
  }

  remove(int index) {
    setState(() {
      widget.tags.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView.builder(
      //     itemCount: widget.tags.length,
      //     itemBuilder: (context, int index) {
      //       final tagItem = widget.tags[index];
      //       return Form(
      //         child: Dismissible(
      //           child: ListTile(
      //             onTap: () {
      //               _tagData = {"name": tagItem.name[index]};
      //             },
      //           ),
      //           key: Key(tagItem.name),
      //           background: Container(
      //             color: Colors.purple.withOpacity(0.2),
      //           ),
      // onDismissed: (direction) {
      //   setState(() {
      //     widget.tags.removeAt(index);
      //     model.removeTag(tagItem.name[index]);
      //   });
      // },
      //     ),
      //   );
      // }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFF58524),
          onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TagPageAdd(),
                    ))
              }),
    );
  }
}
