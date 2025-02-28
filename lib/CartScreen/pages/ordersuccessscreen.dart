
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/BottomNavigationBar/bottomnavigationbar.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';


class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({super.key});

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/order.png',scale: 1.8)),
          SizedBox(height: size.height*0.02,),
          const Text('Order Placed Successfully',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 17 ),),
            SizedBox(height: size.height*0.02,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: appcolor,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
            }, child: const Text('OK',style: TextStyle(color:Colors.white,fontWeight: FontWeight.w900),))
        ],
      ),
    );
  }
}