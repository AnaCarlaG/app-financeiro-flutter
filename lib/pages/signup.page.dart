import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:financeiro/model/user.model.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();
  final _valorController =
      MoneyMaskedTextController(decimalSeparator: ",", thousandSeparator: ".");
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, dynamic> userData = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        if (model.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 40,
              right: 40,
            ),
            color: Colors.white,
            child: ListView(children: <Widget>[
              Container(
                  // width: 200,
                  // height: 200,
                  // alignment: Alignment(0.0, 1),
                  // decoration: new BoxDecoration(
                  //   image: new DecorationImage(
                  //     image: AssetImage("assets/icons8-name-100.png"),
                  //     fit: BoxFit.fitHeight,
                  //   ),
                  // ),
                  // child: Container(
                  //   height: 56,
                  //   width: 56,
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       begin: Alignment.topLeft,
                  //       end: Alignment.bottomRight,
                  //       stops: [0.3, 1],
                  //       colors: [
                  //         Color(0xFFF58524),
                  //         Color(0XFFF92B7F),
                  //       ],
                  //     ),
                  //     border: Border.all(
                  //       width: 5.0,
                  //       color: Colors.white,
                  //     ),
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(56),
                  //     ),
                  //   ),
                  //   child: SizedBox.expand(
                  //     child: FlatButton(
                  //       child: Icon(
                  //         Icons.add,
                  //         color: Colors.white,
                  //       ),
                  //       onPressed: () => {},
                  //     ),
                  //   ),
                  // ),
                  ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                validator: (text) {
                  if (text.isEmpty) return "Nome inválido";
                },
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
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text.isEmpty || !text.contains("@"))
                    return "Email invalido";
                },
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
                controller: _passController,
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
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _valorController,
                keyboardType: TextInputType.number,
                validator: (text) {
                  if (text.isEmpty || text.length < 0)
                    return "Valor Investido inválido";
                },
                decoration: InputDecoration(
                  labelText: "Valor Investido(\$)",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
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
                      onPressed: () => {
                        if (_formKey.currentState.validate())
                          {
                            userData = {
                              "name": _nameController.text,
                              "email": _emailController.text,
                              "valorInvestido":
                                  _valorController.numberValue.toString()
                            }
                          },
                        model.signup(
                          userData: userData,
                          password: _passController.text,
                          onSucess: _onSucess,
                          onFail: _onFail,
                        ),
                      },
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
      },
    ));
  }

  void _onSucess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário criado com sucesso!!!"),
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
      content: Text("Falha ao criar usuário!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 10),
    ));
  }
}
