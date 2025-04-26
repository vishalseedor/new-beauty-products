
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/CartScreen/pages/cartscreen.dart';
import 'package:new_diy_beauty_products/CategoryScreen/pages/categoryscreen.dart';
import 'package:new_diy_beauty_products/CatgoryByScreen/pages/categorybyproductscreen.dart';
import 'package:new_diy_beauty_products/FavouriteScreen/pages/favouritescreen.dart';
import 'package:new_diy_beauty_products/OrderScreen/screen/orderscreen.dart';
import 'package:new_diy_beauty_products/ProductScreen/homescreen.dart';
import 'package:new_diy_beauty_products/ProductScreen/productdetailsscreen.dart';
import 'package:new_diy_beauty_products/ReciepeScreen/pages/recipedetailsscreen.dart';
import 'package:new_diy_beauty_products/ReciepeScreen/pages/recipescreen.dart';
import 'package:new_diy_beauty_products/TipsScreen/design/TipsScreen.dart';
import 'package:new_diy_beauty_products/TipsScreen/design/tipsdetailsscreen.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/pages/discussionscreen.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/pages/view_discuussion.dart';

var customRoutes = <String, WidgetBuilder>{
    'all_category_screen': (context) => const  CategoryScreen(),
     'all_products_screen':(context)=>const ProductScreen(),
    'all_recipe_screen':(context) => const ReciepeScreen(),
    'all_discussion_screen':(context)=>const DiscussionScreen(),
     'all_favourites_screen':(context)=>const FavouriteScreen(),
     'all_categorypackage_screen': (context) {
    var data = ModalRoute.of(context)!.settings.arguments;
    if (data is String) {
      return AllCategoryEachScreen(catepackage: data);
    } else if (data is Map<String, dynamic>) {
      return AllCategoryEachScreen(catepackage: data['category_id']);
    } else {
      print('Unexpected argument type: ${data.runtimeType}');
      return const Scaffold(
        body: Center(
          child: Text(''),
        ),
      );
    }
  },
  'all_carts_screen':(context)=>const CartScreen(),
 'product_details_screen': (context) {
           String id = ModalRoute.of(context)!.settings.arguments.toString();
           return ProductDetailsScreen(
           id: id,
    ); 
  },
 'recipe_details_screen': (context) {
           String id = ModalRoute.of(context)!.settings.arguments.toString();
           return ReceipeDetailsScreen(
           id: id,
    ); 
  },
   'tips_details_screen': (context) {
           String id = ModalRoute.of(context)!.settings.arguments.toString();
           return Tipsdetailsscreen(
           id: id,
    ); 
  },
  'all_orders_screen':(context)=>MyOrdersScreen(),
   'all_tips_screen':(context)=>Tipsscreen(),
   //'view_discussion_screen':(context)=>ViewDiscuussion(userId: '',discussionId: '',)

         
};
