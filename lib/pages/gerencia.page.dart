import 'package:financeiro/util/custom_drawer.dart';
import 'package:financeiro/util/tab/gerencia_tab.dart';
import 'package:financeiro/util/tab/tag_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GerenciaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: SafeArea(child: GerenciaTab()),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Tags"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: TagTab(),
        ),
        Container(color: Colors.redAccent),
        Container(color: Colors.purpleAccent),
      ],
    );
  }
}
