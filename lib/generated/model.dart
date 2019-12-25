class APIFoodResponse {
  List<Meal> meals;

  APIFoodResponse({this.meals});

  factory APIFoodResponse.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['meals'] as List;
    List<Meal> meals = list.map((i) => Meal.fromJson(i)).toList();
    return APIFoodResponse(
        meals: meals,
      );
  }
}

class Meal {
  String idMeal;
  String strMeal;
  dynamic strDrinkAlternate;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;
  String strYoutube;

  Meal({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strYoutube,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        idMeal: json["idMeal"],
        strMeal: json["strMeal"],
        strDrinkAlternate: json["strDrinkAlternate"],
        strCategory: json["strCategory"],
        strArea: json["strArea"],
        strInstructions: json["strInstructions"],
        strMealThumb: json["strMealThumb"],
        strYoutube: json["strYoutube"],
      );
}
