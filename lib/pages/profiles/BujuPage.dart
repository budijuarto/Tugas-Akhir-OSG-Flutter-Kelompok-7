import 'package:flutter/material.dart';

import '../../drawer.dart';

class BujuPage extends StatelessWidget {
  static const String routeName = '/buju';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('res/images/maki.jpg'),
                ),
              ),
              Text(
                'ブディジュアルト',
                style : TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  'FLUTTER DEVELOPER',
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
                          Icons.laptop_mac,
                          color:Colors.teal[900]
                      ),
                      title: Text('https://www.kaggle.com/budijuarto',
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      )
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
                    title: Text('https://github.com/budijuarto/website-portofolio',
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
