import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:new_diy_beauty_products/ReciepeScreen/models/reciepemodel.dart';



class RecipeProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }

  List<RecipeModel> _recipes = [];
  List<RecipeModel> get recipes {
    return [..._recipes];
  }

  Future<void> getAllRecipesData({BuildContext? context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_recipes.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_recipes.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _recipes = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> recipeDetails = extractedData['recipeDetails'];
        for (var i = 0; i <recipeDetails.length; i++) {
          _recipes.add(
            RecipeModel(
                id: recipeDetails[i]['id'].toString(),
                category: recipeDetails[i]['category'].toString(),
                ingredients: recipeDetails[i]['ingredients'].toString(),
                instructions: recipeDetails[i]['instructions'].toString(),
                benefits: recipeDetails[i]['benefits'].toString(),
                usageProduct: recipeDetails[i]['usage_product'].toString(),
                comments: recipeDetails[i]['comments'].toString(),
                creator: recipeDetails[i]['creator'].toString(),
                difficultyLevel: recipeDetails[i]['difficulty_level'].toString(),
                link: recipeDetails[i]['link'].toString(),
                preparationTime: recipeDetails[i]['preparation_time'].toString(),
                storage: recipeDetails[i]['storage'].toString(),

               
                ),
          );
        }
        ;

        print('category details' + _recipes.toString());
        _isLoading = false;
        print('category loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in fav prod -->>' + e.toString());
      print('Favourite Data is one by one loaded the favouite' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
}
