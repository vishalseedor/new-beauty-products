
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/BottomNavigationBar/bottomnavigationbar.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';


class CartEmptyScreen extends StatefulWidget {
  const CartEmptyScreen({super.key});

  @override
  State<CartEmptyScreen> createState() => _CartEmptyScreenState();
}

class _CartEmptyScreenState extends State<CartEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 150),
          Center(child: Image.asset('assets/ss.png',scale: 1.8)),
          SizedBox(height: size.height*0.02),
          const Center(child: Text('Your Cart is Empty....!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
          SizedBox(height: size.height*0.02),
          ElevatedButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder:(context)=> HomePage()));
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: appcolor),
           child:const Text('Add to Cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
        ],
      );
    

  }
}