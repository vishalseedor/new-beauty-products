import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:new_diy_beauty_products/TipsScreen/model/Tipsmodel.dart';
import 'package:provider/provider.dart';

class Tipsprovider extends ChangeNotifier {
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

  List<Tipsmodel> _tips = [];
  List<Tipsmodel> get tips {
    return [..._tips];
  }

  Future getAllTipsData({BuildContext? context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
          "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_tips.php",
        ),
      );

      print(
        "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_tips.php",
      );

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _tips = [];
        var extractedData = json.decode(response.body);

        final List<dynamic> tipsDetails = extractedData['recipeDetails'];
        for (var i = 0; i < tipsDetails.length; i++) {
          _tips.add(
            Tipsmodel(
              id: tipsDetails[i]['id'].toString(),

              description: tipsDetails[i]['description'].toString(),
              ingredients: tipsDetails[i]['ingredients'].toString(),

              benefits: tipsDetails[i]['benefits'].toString(),
              usageProduct: tipsDetails[i]['usage_product'].toString(),
              additionalTips: tipsDetails[i]['additional_tips'].toString(),
              file: tipsDetails[i]['file'].toString(),

              link: tipsDetails[i]['link'].toString(),
              comments: tipsDetails[i]['comments'].toString(),
              creator: tipsDetails[i]['creator'].toString(),
            ),
          );
        }

        print('product details' + _tips.toString());
        _isLoading = false;
        print('products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Product Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
}
