import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'pages/makanan/halaman_detail_makanan.dart';
import 'model.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();
  bool onSearch = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: editingController,
          autofocus: true,
          decoration: InputDecoration(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                onSearch = true;
              });
            },
          ),
        ],
      ),
      body: onSearch ? SearchContent(editingController.text) : Container(),
    );
  }
}

//API Search
class ApiClient {
  static Future<APIFoodResponse> getUsers(String users) async {
    Response response = await get(
        'https://www.themealdb.com/api/json/v1/1/search.php?s=$users');
//    APIFoodResponse foodResponseFromJson(String str) => APIFoodResponse.fromJson(json.decode(str));
    print(response.body);
    print(APIFoodResponse.fromJson(json.decode(response.body)).meals.length);
    return APIFoodResponse.fromJson(json.decode(response.body));
  }
}

class SearchContent extends StatelessWidget {
  final String users;
  List<Meal> mealsList = new List<Meal>();
  SearchContent(this.users);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<APIFoodResponse>(
        future: ApiClient.getUsers(users),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          APIFoodResponse mealsResult = snapshot.data;
          print(snapshot.data);
          bool connect = snapshot.connectionState == ConnectionState.done;
          if (snapshot.hasData && connect) {
            return ListView.builder(
              itemCount: mealsResult.meals.length,
              itemBuilder: (BuildContext context, int index) {
//                Meal meal = mealsList[index];
                return ListTile(
                  title: Text(
                    mealsResult.meals[index].strMeal,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  subtitle: Text(
                    mealsResult.meals[index].strCategory,
                    style: TextStyle(color: Colors.blue),
                  ),
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      mealsResult.meals[index].strMealThumb,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HalamanDetailMakanan(
                          meals: mealsResult.meals[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
