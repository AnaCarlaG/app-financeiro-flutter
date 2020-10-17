import 'package:financeiro/model/user.model.dart';
import 'package:financeiro/reset-password.page.dart';
import 'package:financeiro/signup.page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        if (model.isLoading)
          return Center(
            child: CircularProgressIndicator(),
          );

        return Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(
              top: 60,
              left: 40,
              right: 40,
            ),
            color: Colors.white,
            child: ListView(children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("assets/icons8-money-bag-100.png"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                //autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
                validator: (text) {
                  if (text.isEmpty || !text.contains("@"))
                    return "Email inválido";
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                //autofocus: true,
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (text) {
                  if (text.isEmpty || text.length < 6) return "Senha inválida";
                },
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text(
                    "Recuperar senha",
                    textAlign: TextAlign.right,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordPage(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          child: SizedBox(
                            child: Image.asset(
                                "assets/icons8-money-transfer-96.png"),
                            height: 28,
                            width: 28,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () => {
                      ///if (_formKey.currentState.validate()) {}
                      model.signin()
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                child: FlatButton(
                  child: Text(
                    "Cadastre-se",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ))
                  },
                ),
              ),
            ]),
          ),
        );
      }),
    );
  }
}
