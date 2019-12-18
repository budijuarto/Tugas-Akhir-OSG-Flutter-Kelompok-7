import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:osg_flutter/model.dart';

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
    String query = 'q=$users';
    Response response = await get('https://www.themealdb.com/api/json/v1/1/search.php?s=$query');
    APIFoodResponse foodResponseFromJson(String str) => APIFoodResponse.fromJson(json.decode(str));
    return foodResponseFromJson(response.body);
  }
}



class SearchContent extends StatelessWidget {
  final String users;

  SearchContent(this.users);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<APIFoodResponse>(
        future: ApiClient.getUsers(users),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          APIFoodResponse gitHubUsers = snapshot.data;
          bool connect = snapshot.connectionState == ConnectionState.done;
          if (snapshot.hasData && connect) {
            return ListView.builder(
              itemCount: gitHubUsers.meals.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(gitHubUsers.meals[index].strMeal),
                  onTap: () {
                    SnackBar snackbar = SnackBar(
                      content: Text(
                        gitHubUsers.meals[index].strCategory,
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snackbar);
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
