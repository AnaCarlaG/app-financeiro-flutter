import 'package:financeiro/pages/gerencia.page.dart';
import 'package:financeiro/pages/login.page.dart';
import 'package:financeiro/model/user.model.dart';
import 'package:financeiro/util/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);
  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 1],
            colors: [
              Colors.blue[100],
              Colors.white,
            ],
          )),
        );
    return Drawer(
        child: Stack(
      children: <Widget>[
        _buildDrawerBack(),
        ListView(
          padding: EdgeInsets.only(left: 32.0, top: 16.0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
              height: 170,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 16.0,
                    left: 0.0,
                    child: Icon(
                      Icons.account_balance_wallet,
                      size: 50.0,
                    ),
                  ),
                  Positioned(
                      top: 25.0,
                      left: 60.0,
                      child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model) {
                        return Text(
                          "Olá, ${(!model.isLoggedIn() ? "" : model.userData["name"])}",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w400),
                        );
                      }))
                ],
              ),
            ),
            DrawerTile(Icons.home, "Home", pageController, 0),
            SizedBox(
              height: 20,
            ),
            DrawerTile(
                Icons.sentiment_very_satisfied, "Tags", pageController, 1),
            SizedBox(
              height: 20,
            ),
            DrawerTile(Icons.trending_up, "Relatório", pageController, 2),
            SizedBox(
              height: 20,
            ),
            Positioned(
              top: 150.0,
              left: 400.0,
              child: ScopedModelDescendant<UserModel>(
                builder: (context, child, model) {
                  return Material(
                    color: Colors.transparent,
                    child: FlatButton(
                      onPressed: () => {
                        model.signOut(),
                        Navigator.of(context).pop(),
                        Navigator.of(context).pop()
                      },
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.sentiment_dissatisfied,
                              size: 32.0,
                            ),
                            SizedBox(
                              width: 22.0,
                            ),
                            Text(
                              "Sair",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        )
      ],
    ));
  }
}
