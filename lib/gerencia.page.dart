import 'package:financeiro/gerencia_tab.dart';
import 'package:financeiro/model/user.model.dart';
import 'package:financeiro/util/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Gerencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: GerenciaTab(),
          drawer: CustomDrawer(),
        )
      ],
    );
  }
}
