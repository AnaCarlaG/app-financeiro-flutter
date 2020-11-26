import 'package:financeiro/model/user.model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ResetPasswordPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Form(
          child: Scaffold(
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
            top: 60,
            left: 40,
            right: 40,
          ),
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset("assets/icons8-forgot-password-100.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Esqueceu sua senha?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Por favor insira o seu email para que possa atualizar a sua senha",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
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
                        "Enviar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        if (_emailController.text.isEmpty) {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Insira um email para recuperação"),
                            backgroundColor: Colors.redAccent,
                            duration: Duration(seconds: 10),
                          ));
                        } else {
                          model.recoverPass(_emailController.text);
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Confira seu email"),
                            backgroundColor: Theme.of(context).primaryColor,
                            duration: Duration(seconds: 10),
                          ));
                        }
                      }),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ));
    });
  }
}
