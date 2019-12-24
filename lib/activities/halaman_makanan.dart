import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:osg_flutter/search.dart';
import 'halaman_detail_makanan.dart';
import '../model.dart';

class HalamanMakanan extends StatefulWidget {
  HalamanMakanan({Key key}) : super(key: key);
  @override
  _HalamanMakananState createState() => _HalamanMakananState();
}

class _HalamanMakananState extends State<HalamanMakanan> {
  List<Meal> mealsList = new List<Meal>();
  @override
  void initState() {
    super.initState();
    getAPIFood(52770);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Makanan"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SearchPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: uiListMakanan(),
    );
  }

  Future getAPIFood(int id) async {
    List<Meal> meals = new List<Meal>();
    for (int i = id; i <= id + 7; i++) {
      var response = await http.get(Uri.encodeFull(
          "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$i"));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        APIFoodResponse res = new APIFoodResponse.fromJson(data);
        meals.add(res.meals[0]);
        setState(() {
          mealsList = meals;
        });
      }
    }
    // print(meals.length);
  }

  uiListMakanan() {
    return ListView.builder(
      itemCount: mealsList.length - 1,
      itemBuilder: (BuildContext context, int index) {
        Meal meal = mealsList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HalamanDetailMakanan(
                  meals: meal,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Card(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      meal.strMeal,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    subtitle: Text(
                      meal.strCategory,
                      style: TextStyle(color: Colors.blue),
                    ),
                    trailing: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        meal.strMealThumb,
                      ),
                    ),
                  ),
                  //divider untuk membuat baris pemisah
                  // Divider(color: Colors.black,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
