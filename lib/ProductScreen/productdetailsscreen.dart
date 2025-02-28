
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
  

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart,size: 35),
          ),
        ],
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

          Text('Body perfumes typically consist of a blend of aromatic compounds, essential oils, alcohol, and water. These fragrances may also contain fixatives to stabilize the scent and extend its longevity, as well as preservatives to maintain product freshness. The exact composition can vary greatly depending on the desired fragrance profile, with some perfumes focusing on floral notes, others on fruity or woody scents'),
         
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                fav.addItemToFavourites(productid: productData.id.toString(),userid: userData.currentUserId.toString());
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor:appcolor,
                                  content: const Text("Favourite Product Added Successfully",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)));
                },
                child: Container(
                  height: 60,
                  width: 70,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: appcolor),
                  child: Icon(Icons.favorite,color: Colors.white,),
                ),
              ),
               GestureDetector(
                onTap: (){
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
                              }

                },
                 child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: appcolor),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Icon(IconlyLight.bag2,color: Colors.white,),
                       SizedBox(width: 10),
                       Text('Add to cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                    ],
                  )
                               ),
               ),

            ],
          )


          // FilledButton.icon(
              
          //     onPressed: () {},
          //     icon: const Icon(IconlyLight.bag2),
          //     label: const Text("Add to cart"))
        ],
      ),
    );
  }
}
