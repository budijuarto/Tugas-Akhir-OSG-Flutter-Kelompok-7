import 'package:flutter/material.dart';

import 'drawer.dart';


class Eudeka extends StatelessWidget {
  static const String routeName = '/eudeka';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Events"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Events")));
  }
}
