import 'package:financeiro/util/user_tile.dart';
import 'package:flutter/material.dart';

class GerenciaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Scaffold(
          body: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                child: TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "Pesquisar",
                      hintStyle: TextStyle(color: Colors.black38),
                      icon: Icon(
                        Icons.search,
                        color: Colors.purple,
                      ),
                      border: InputBorder.none),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return UserTile();
                  },
                  separatorBuilder: (context, builder) {
                    return Divider();
                  },
                  itemCount: 5,
                ),
              )
            ],
          ),
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(colors: [
          //   Color.fromARGB(255, 211, 118, 130),
          //   Color.fromARGB(255, 253, 181, 168)
          // ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );

    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(""),
                centerTitle: true,
              ),
            ),
          ],
        )
      ],
    );
  }
}
