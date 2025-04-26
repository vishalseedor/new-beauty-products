import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:new_diy_beauty_products/OrderScreen/model/ordermodel.dart';
import 'package:provider/provider.dart';

class Orderprovider extends ChangeNotifier {
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

 

  List<Ordermodel> _orders = [];
  List<Ordermodel> get orders {
    return [..._orders];
  }


  Future getAllOrdersData({BuildContext? context, String? userid}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_order_history.php?userid=$userid"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_order_history.php?userid=$userid");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _orders = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> orderDetails = extractedData['orderDetails'];
        for (var i = 0; i < orderDetails.length; i++) {
          _orders.add(
            Ordermodel(
                id : orderDetails[i]['id'].toString(),
    creatorName : orderDetails[i]['creator_name'].toString(),
    productName : orderDetails[i]['product_name'].toString(),
    orderQuantity : orderDetails[i]['order_quantity'].toString(),
    productPrice : orderDetails[i]['product_price'].toString(),
    userName : orderDetails[i]['user_name'].toString(),
    userPhone : orderDetails[i]['user_phone'].toString(),
    image: orderDetails[i]['image'].toString()
            ),
          );
        }
       
        print('product details' + _orders.toString());
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