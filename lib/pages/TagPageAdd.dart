import 'package:financeiro/model/tag.model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class TagPageAdd extends StatefulWidget {
  @override
  _TagPageAddState createState() => _TagPageAddState();
}

class _TagPageAddState extends State<TagPageAdd> {
  var _tagControll = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var tagModel = TagModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => {
            Navigator.pop(context, false),
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 100,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _tagControll,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Criar tag",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFFF58524),
                    Color(0XFFF92B7F),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Map<String, dynamic> tagData = {
                        "name": _tagControll.text
                      };
                      tagModel.CreatTag(tagData, () {
                        _onSucess();
                      }, () {
                        _onFail();
                      });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onSucess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Tag criado com sucesso!!!"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 10),
    ));
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => LoginPage(),
    //     ));
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao criar tag!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 10),
    ));
  }
}
