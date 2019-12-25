import 'package:flutter/material.dart';
import 'package:osg_project/generated/BujuPage.dart';
import 'package:osg_project/generated/Eudeka.dart';
import 'package:osg_project/generated/Pamanrerere.dart';

import 'Routes.dart';
import 'halaman_makanan.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HalamanMakanan()));
            },
          ),
          _createDrawerItem(
              icon: Icons.people,
              text: 'ブディジュアルトのプロフィール',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => BujuPage()));
            },
          ),
          _createDrawerItem(
              icon: Icons.people,
              text: 'Paman rerere',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Pamanrerere()));
            },
          ),
          _createDrawerItem(
              icon: Icons.question_answer,
              text: 'About Eudeka',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Eudeka()));
            },
          ),
          Divider(),
          _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          ListTile(
            title: Text('versi 1.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('res/images/food.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Flutter Food App",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
