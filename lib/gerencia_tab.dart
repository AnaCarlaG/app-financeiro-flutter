import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class GerenciaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          color: Colors.white,
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