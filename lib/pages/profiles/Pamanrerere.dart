import 'package:flutter/material.dart';

import '../../drawer.dart';

class Pamanrerere extends StatelessWidget {
  static const String routeName = '/pamanrerere';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Tentang Agung"),
      ),
      drawer: AppDrawer(),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Agung Satrio Budi Prakoso',
                style : TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  'Flutter Novice Developer',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal[900],
                    fontSize: 20,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,

                  )
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                    leading: Icon(
                        Icons.link,
                        color:Colors.teal[900]
                    ),
                    title: Text('https://agung.sera5.id',
                      style: TextStyle(
                        color: Colors.teal[900],
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    )
                ),
              ),
            ],
          )
      ),
    );
  }
}
