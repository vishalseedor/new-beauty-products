import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:new_diy_beauty_products/ProductScreen/models/productmodel.dart';


class ProductProvider with ChangeNotifier {
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

  ProductModel? productDetail;

  List<ProductModel> _products = [];
  List<ProductModel> get products {
    return [..._products];
  }

  List<ProductModel> _searchProducts = [];
  List<ProductModel> get searchProducts {
    return [..._searchProducts];
  }

  List<ProductModel> _filteredProducts = [];
  List<ProductModel> get filteredProducts {
    return [..._filteredProducts];
  }

  Future getAllProductData({BuildContext? context,}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_all_products.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_all_products.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _products = [];
        _filteredProducts = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> productDetails = extractedData['categoryDetails'];
        for (var i = 0; i < productDetails.length; i++) {
          _products.add(
            ProductModel(
                id:productDetails[i]['id'].toString(),
                productName: productDetails[i]['product_name'].toString(),
                price: productDetails[i]['price'].toString(),
                image: productDetails[i]['image'].toString(),
                creatorName: productDetails[i]['creator_name'].toString(),
                quantity: productDetails[i]['quantity'].toString(),
                description: productDetails[i]['description'].toString()

               
               
               ),
          );
        }
        ;

        print('product details' + _products.toString());
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

  Future<void> getSearchData({dynamic value}) async {
    _isLoading = true;
    var response = await https.get(
      Uri.parse(
          "http://campus.sicsglobal.co.in/Project/Diy_product/api/search_product.php?product=$value"),
    );

    print(
           "http://campus.sicsglobal.co.in/Project/Diy_product/api/search_product.php?product=$value");

    if (response.statusCode == 200) {
      var responseBody = response.body;

        print(responseBody);

        _searchProducts = [];

        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> productDetails = extractedData['categoryDetails'];
        for (var i = 0; i < productDetails.length; i++) {
          _searchProducts.add(
            ProductModel(
                id:productDetails[i]['id'].toString(),
                productName: productDetails[i]['product_name'].toString(),
                price: productDetails[i]['price'].toString(),
                image: productDetails[i]['image'].toString(),
                creatorName: productDetails[i]['creator_name'].toString(),
                quantity: productDetails[i]['quantity'].toString(),
                description: productDetails[i]['description'].toString()

               
               
               ),
          );
        }

        print('product details search' + _searchProducts.toString());
        print('products loading completed --->' + 'loading data');
          _isLoading = false;
        notifyListeners();


    } else {
        _isLoading = false;
          notifyListeners();
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }

    _isLoading = false;
    notifyListeners();
  }
}
