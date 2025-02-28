import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:new_diy_beauty_products/CatgoryByScreen/models/categorybymodel.dart';





class CategoryEachProvider with ChangeNotifier {
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

  

  List<CategoryByModel> _category = [];
  List<CategoryByModel> get category {
    return [..._category];
  }
 

  Future getAllEachCategorysData({required BuildContext context,required String categoryproduct}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_category_product.php?category_id=$categoryproduct"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_category_product.php?category_id=$categoryproduct");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _category = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> catDetails = extractedData['categoryDetails'];
        for (var i = 0; i < catDetails.length; i++) {
          _category.add(
            CategoryByModel(
              id: catDetails[i]['id'].toString(),
              productName:catDetails[i]['product_name'].toString(),
              creatorName: catDetails[i]['creator_name'].toString(),
              image: catDetails[i]['image'].toString(),
              price: catDetails[i]['price'].toString(),
              quantity: catDetails[i]['quantity'].toString(),
              
            

              
            ),
          );
        }
        ;

        print('product details' + _category.toString());
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
  
 
