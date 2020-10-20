import 'package:financeiro/util/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
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
                    top: 16.0,
                    left: 8.0,
                    child: Text(""),
                  )
                ],
              ),
            ),
            DrawerTile(Icons.home, "Home"),
            SizedBox(
              height: 20,
            ),
            DrawerTile(Icons.sentiment_very_satisfied, "Perfil"),
            SizedBox(
              height: 20,
            ),
            DrawerTile(Icons.trending_up, "Relatório"),
          ],
        )
      ],
    ));
  }
}
