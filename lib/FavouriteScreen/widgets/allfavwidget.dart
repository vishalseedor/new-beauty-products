
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/FavouriteScreen/provider/favouriteprovider.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';
import 'package:provider/provider.dart';



class AllFavouriteWidget extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  final String price;
  

  const AllFavouriteWidget(
      {super.key,
    required this.id,
    required this.name,
    required this.image,
    required this.price
   
      });

  @override
  State<AllFavouriteWidget > createState() => _AllFavouriteWidgetState();
}

class _AllFavouriteWidgetState extends State<AllFavouriteWidget > {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fav=Provider.of<FavouriteProvider>(context);
    final user=Provider.of<UserProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      child: GestureDetector(
        onTap: () {
        //  Navigator.of(context).pushNamed(GardenDetailsPage.routeName,arguments:widget.packageid);
           // Navigator.of(context).pushNamed(GardenDetailsScreen.routeName,arguments:widget.packageid);
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          elevation: 0.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(                                               
                height: size.height*0.17,
                alignment: Alignment.topRight,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                  ),   
                ),
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton.filledTonal(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                        fav.deleteFav(widget.id,user.currentUserId, context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:appcolor,
                            content: const Text(
                              'Favourite Deleted Successfully !',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            duration: const Duration(seconds: 4),
                          ), 
                        );
                    }, 
                    iconSize: 18,
                    icon: const Icon(Icons.delete,color: Colors.red),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                                      style: TextStyle(color:appcolor,fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    Text('₹ : ${widget.price}',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 11),)
                  
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
