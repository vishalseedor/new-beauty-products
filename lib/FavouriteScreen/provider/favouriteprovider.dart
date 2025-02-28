import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:new_diy_beauty_products/FavouriteScreen/models/favouritemodel.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';
import 'package:provider/provider.dart';





class FavouriteProvider extends ChangeNotifier {
 
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
  FavouriteModel? cartDetails;
  List<FavouriteModel> _favourites = [];
  List<FavouriteModel> get favourites {
    return [..._favourites];
  }
  
  // List<AddCartItem> _favItems = [];

  // List<AddCartItem> get favItems => _favItems;

  // void addToCart(AddCartItem item) {
  //   _favItems.add(item);
  //   notifyListeners();
  // }

  Future getAllFavouritesData({BuildContext? context,String? userId}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_favourite_product.php?user_id=$userId"),
      );

      print(
            "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_favourite_product.php?user_id=$userId");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _favourites = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> favDetails = extractedData['categoryDetails'];
        for (var i = 0; i < favDetails.length; i++) {
          _favourites.add(
            FavouriteModel(
              id: favDetails[i]['id'].toString(),
              productName: favDetails[i]['product_name'].toString(),
              price: favDetails[i]['price'].toString(),
              image: favDetails[i]['image'].toString(),
              creatorName: favDetails[i]['creator_name'].toString(),
              quantity: favDetails[i]['quantity'].toString(),
             
              
             
              
            ),
          );
        }
        ;

        print('favourites details' + _favourites.toString());
        _isLoading = false;
        print('Favourites loading completed --->' + 'loading data');
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
 Future<void> addItemToFavourites(
      {String? productid, String? userid}) async {
    var body = {
      'product_id': productid.toString(),
      'user_id': userid.toString(),
     
    };

    try {
      var response = await https.post(
          Uri.parse(
              'http://campus.sicsglobal.co.in/Project/Diy_product/api/add_favourite.php?user_id=$userid&product_id=$productid'),
          body: body);

      if (response.statusCode == 200) {
        // Request successful
        print('Added to cart successfully');
        print('Response: ${response.body}');
      } else {
        // Request failed with error code
        print('Failed to add to cart. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception thrown during request
      print('Failed to add to cart. Exception: $e');
    }
  }

Future<void> deleteFav(String? productId,String? userId, BuildContext context) async {
    final user = Provider.of<UserProvider>(context, listen: false);
    final url = Uri.parse(
        'http://campus.sicsglobal.co.in/Project/Diy_product/api/delete_favourite.php?user_id=$userId&product_id=$productId');

    try {
      final response = await https.delete(url);
      print(url);
      if (response.statusCode == 200) {
        getAllFavouritesData(userId: user.currentUserId);
        // Cart deleted successfully
        print('Cart deleted successfully');
      } else {
        // Failed to delete cart
        print('Failed to delete cart: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting cart: $e');
    }
  }


 
}


 
