
import 'package:new_diy_beauty_products/CartScreen/provider/cartprovider.dart';
import 'package:new_diy_beauty_products/CategoryScreen/provider/categoryprovider.dart';
import 'package:new_diy_beauty_products/CatgoryByScreen/provider/categorybyprovider.dart';
import 'package:new_diy_beauty_products/FavouriteScreen/provider/favouriteprovider.dart';
import 'package:new_diy_beauty_products/Feedbackscreen/feedbackprovider.dart';
import 'package:new_diy_beauty_products/ProductScreen/provider/productprovider.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';
import 'package:new_diy_beauty_products/ReciepeScreen/provider/reciepeprovider.dart';

import 'package:new_diy_beauty_products/ViewDiscussionScreen/provider/discussionprovider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> multiprovider = [
   ChangeNotifierProvider(create: (context) => ProductProvider()),
  ChangeNotifierProvider(create: (context) => UserProvider()),
  ChangeNotifierProvider(create: (context)=>CategoryProvider()),
    ChangeNotifierProvider(create: (context)=>RecipeProvider()),
    ChangeNotifierProvider(create: (context)=>Discussionprovider()),
    ChangeNotifierProvider(create: (context)=>CategoryEachProvider()),
    ChangeNotifierProvider(create: (context)=>CartProvider()),
    ChangeNotifierProvider(create: (context)=>FavouriteProvider()),
     ChangeNotifierProvider(create: (context)=>FeedbackProvider()),

 
];
