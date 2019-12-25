import 'package:flutter/material.dart';

import '../../model.dart';


class HalamanDetailMakanan extends StatelessWidget {
  Meal meals;

  HalamanDetailMakanan({Key key, this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meals.strMeal),
        leading: IconButton(icon: Icon(Icons.home), onPressed: () {
            Navigator.pop(context);
          }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.link),
//            onPressed: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => HalamanWeb(
//                            meals: meals,
//                          )));
//            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(meals.strMealThumb),
            Center(
                child: Text(
              meals.strMeal,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(meals.strInstructions),
            )
          ],
        ),
      ),
    );
  }
}


//class HalamanWeb extends StatelessWidget {
//  Meal meals;
//
//  HalamanWeb({Key key, this.meals}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return WebviewScaffold(
//      url: meals.strYoutube,
//    );
//  }
//}
