import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(children: <Widget>[
          Container(
            width: 200,
            height: 200,
            alignment: Alignment(0.0, 1),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage("assets/icons8-name-100.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Container(
              height: 56,
              width: 56,
              alignment: Alignment.center,
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
                border: Border.all(
                  width: 5.0,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(56),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () => {},
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Nome",
              labelStyle: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            style: TextStyle(fontSize: 16),
          ),
          Container(
              height: 60,
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
                  onPressed: (null),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            alignment: Alignment.center,
            child: FlatButton(
              child: Text(
                "Cancelar",
                textAlign: TextAlign.center,
              ),
              onPressed: () => {Navigator.pop(context, false)},
            ),
          )
        ]),
      ),
    );
  }
}
