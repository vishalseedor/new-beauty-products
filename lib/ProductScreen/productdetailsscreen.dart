
import 'package:flutter/material.dart';

import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:new_diy_beauty_products/CartScreen/provider/cartprovider.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/FavouriteScreen/provider/favouriteprovider.dart';
import 'package:new_diy_beauty_products/ProductScreen/pages/globalsnackbar.dart';
import 'package:new_diy_beauty_products/ProductScreen/pages/productsnackbar.dart';
import 'package:new_diy_beauty_products/ProductScreen/provider/productprovider.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';
import 'package:provider/provider.dart';


class ProductDetailsScreen extends StatefulWidget {

static const routeName = 'product_details_screen';
  final String id;
  const ProductDetailsScreen({super.key,required this.id
  });



  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isFavorite=false;
  

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
   GlobalSnackBar _snackBar =GlobalSnackBar();
  ProductSnackBar _productSnackBar=ProductSnackBar();
      final product = Provider.of<ProductProvider>(context,listen: false);
        final cartapi = Provider.of<CartProvider>(context, listen: false);
    final userData = Provider.of<UserProvider>(context,   listen: false);
    final fav=Provider.of<FavouriteProvider>(context,listen: false);
       
      final productData =
        Provider.of<ProductProvider>(context).products.firstWhere((element) => element.id == widget.id);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:Color.fromARGB(255, 12, 117, 14),
        title: const Text("Product Details",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
       
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container( 
            height: 350,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productData.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            productData.productName,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)
          ),
    
      
         
          const SizedBox(height: 10),
          Text('Price : ₹ ${productData.price}',   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,color: appcolor
              ),),
           Text(
             "${'Quantity : ${productData.quantity}PCS'}",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,color: appcolor
              ),
           ),
          
          const SizedBox(height: 20),
          Text("Description",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),

          Text(productData.description),
         
          const SizedBox(height: 20),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               Container(
     height: size.height*0.07,
                  width: size.width*0.16,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: appcolor),
      ),
      child: InkWell(
  onTap: () async {
    setState(() {
      isFavorite = !isFavorite;
      
      if (isFavorite) {
         fav.addItemToFavourites(productid: productData.id.toString(),userid: userData.currentUserId.toString());
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor:appcolor,
                                  content: const Text("Favourite Product Added Successfully",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)));

     
      } else {
         fav.deleteFav(productData.id,userData.currentUserId.toString(),context);
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: appcolor,
            content: const Text(
              'Favourite products removed from Favourites!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            duration: const Duration(seconds: 4),
          ),
        );
     
      }
    });
  },
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: appcolor,
        ),
      ],
    ),
  ),
)

      // child: InkWell(
      //   onTap: ()async{
      //     setState(() {
      //       isFavorite=!isFavorite;
      //        favpet.addItemToFavourites(petid: petData.petid.toString(),userid: user.currentUserId.toString());
      //       ScaffoldMessenger.of(context).showSnackBar(
      //                     SnackBar(
      //                       backgroundColor: purpleColor,
      //                       content: const Text(
      //                         'Pet added to Favourite Succcessfully !',
      //                         style: TextStyle(
      //                             color: Colors.white,
      //                             fontWeight: FontWeight.bold),
      //                       ),
      //                       duration: const Duration(seconds: 4),
      //                     ), 
      //                   );
      // // Navigator.push(context,MaterialPageRoute(builder: (context)=>const PetFavouritePage()));
      //     });
           

      //   },
      //   child: Center(child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Icon(isFavorite?Icons.favorite:Icons.favorite_border,color: Colors.red)
      //       // Image.asset('assets/fav.png',height: 25,width: 25),
      //     ],
      //   ))),
      // child: IconButton(
      //   onPressed: ()async {
      //    favpet.addItemToFavourites(petid: petData.petId.toString(),userid: user.currentUserId.toString());
      //       SnackBar(backgroundColor: purpleColor,content: const Text('Item add to favourite successfully'),duration: const Duration(seconds: 4),);
      //    await Navigator.push(context,MaterialPageRoute(builder: (context)=>const PetFavouritePage()));
          
      //   },
      //   icon: const Icon(
      //   Icons.favorite,color: Colors.red,
      //   ),
      // ),
    ),
                  InkWell(
                    onTap: () async{
                                      final provider =
                                  Provider.of<CartProvider>(context,listen: false);
                              bool isInCart = provider.carts.any(
                                  (item) => item.productId == widget.id);
                              if (isInCart) {
                                 ScaffoldMessenger.of(context).showSnackBar(
                               _productSnackBar.productSnackbar(context: context)
                              
                              );
                            
                              } else {
                                 cartapi.addItemToCart(
                                  productid: productData.id.toString(),
                                  userid: userData.currentUserId.toString(),
                                  quanity: productData.quantity.toString());
                               
                              ScaffoldMessenger.of(context).showSnackBar(
                               _snackBar.customSnackbar(context: context)
                                // SnackBar(
                                //   backgroundColor: greencolor,
                                //   content: const Text(
                                //     'Item added to cart successfully!',
                                //     style: TextStyle(
                                //         color: Colors.white,
                                //         fontWeight: FontWeight.bold),
                                //   ),
                                //   duration: const Duration(seconds: 4),
                                // ),
                              );
                              //  await Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MyCartScreen()));
  
                    }},
                    child: Container(
                     height: size.height*0.07,
                     width: size.width*0.65,
                    decoration: BoxDecoration(
                      color: appcolor,
                      borderRadius: BorderRadius.circular(10)),
                      child:  Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Image.asset('assets/cart.png',height: 30,width: 30,color: Colors.white,),
                          SizedBox(width: size.width*0.06),
                          const Text('Add to cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                        ],
                      )),
                                       ),
                  ),
                ],
              )

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     GestureDetector(
          //       onTap: (){
          //       fav.addItemToFavourites(productid: productData.id.toString(),userid: userData.currentUserId.toString());
          //        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //                         backgroundColor:appcolor,
          //                         content: const Text("Favourite Product Added Successfully",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)));
          //       },
          //       child: Container(
          //         height: 60,
          //         width: 70,
          //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: appcolor),
          //         child: Icon(Icons.favorite,color: Colors.white,),
          //       ),
          //     ),
          //      GestureDetector(
          //       onTap: (){
          //          final provider =
          //                         Provider.of<CartProvider>(context,listen: false);
          //                     bool isInCart = provider.carts.any(
          //                         (item) => item.productId == widget.id);
          //                     if (isInCart) {
          //                        ScaffoldMessenger.of(context).showSnackBar(
          //                      _productSnackBar.productSnackbar(context: context)
                              
          //                     );
                            
          //                     } else {
          //                        cartapi.addItemToCart(
          //                         productid: productData.id.toString(),
          //                         userid: userData.currentUserId.toString(),
          //                         quanity: productData.quantity.toString());
                               
          //                     ScaffoldMessenger.of(context).showSnackBar(
          //                      _snackBar.customSnackbar(context: context)
          //                       // SnackBar(
          //                       //   backgroundColor: greencolor,
          //                       //   content: const Text(
          //                       //     'Item added to cart successfully!',
          //                       //     style: TextStyle(
          //                       //         color: Colors.white,
          //                       //         fontWeight: FontWeight.bold),
          //                       //   ),
          //                       //   duration: const Duration(seconds: 4),
          //                       // ),
          //                     );
          //                     //  await Navigator.push(
          //                     //     context,
          //                     //     MaterialPageRoute(
          //                     //         builder: (context) => MyCartScreen()));
          //                     }

          //       },
          //        child: Container(
          //         height: 60,
          //         width: 300,
          //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: appcolor),
          //         child:Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //              Icon(IconlyLight.bag2,color: Colors.white,),
          //              SizedBox(width: 10),
          //              Text('Add to cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
          //           ],
          //         )
          //                      ),
          //      ),

          //   ],
          // )


          // FilledButton.icon(
              
          //     onPressed: () {},
          //     icon: const Icon(IconlyLight.bag2),
          //     label: const Text("Add to cart"))
        ],
      ),
    );
  }
}
