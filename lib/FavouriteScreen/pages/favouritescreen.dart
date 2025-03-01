import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/FavouriteScreen/pages/favouriteemptyscreen.dart';
import 'package:new_diy_beauty_products/FavouriteScreen/provider/favouriteprovider.dart';
import 'package:new_diy_beauty_products/FavouriteScreen/widgets/allfavwidget.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';

import 'package:provider/provider.dart';
import '../../../ExtraScreens/loadingscreen.dart';

class FavouriteScreen extends StatefulWidget { 
   static const routeName = 'all_favourites_screen';
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
    @override
  void initState() {
     final userProvider = Provider.of<UserProvider>(context, listen: false);
    Provider.of<FavouriteProvider>(context, listen: false)
        .getAllFavouritesData(context: context,userId:userProvider.currentUserId );
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final favpet=Provider.of<FavouriteProvider>(context);
    return Scaffold(
        appBar: AppBar(
      
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        // ignore: prefer_const_constructors
        },icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: appcolor,
        title: const Text('Favouitres',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),
    body:FadeInUp(
       duration:  const Duration(milliseconds: 1500),
      child: favpet.loadingSpinner
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoadingScreen(title: 'Loading'),
                          CircularProgressIndicator(
                            color:Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                       
                        ],
                      )
                    : favpet.favourites.isEmpty
                        ? EmptyfavScreen()
                        : SizedBox(
                           // height: size.height * 0.6,
                            child: GridView.builder(
              itemCount: favpet.favourites.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return AllFavouriteWidget(
                  id: favpet.favourites[index].id,
                  name: favpet.favourites[index].productName,
                  image: favpet.favourites[index].image,
                  price: favpet.favourites[index].price,

                  );
              },
            )
                          ),
    ),  
    );
  }
}