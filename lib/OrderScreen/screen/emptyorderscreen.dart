import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';

class Emptyorderscreen extends StatefulWidget {
  const Emptyorderscreen({super.key});

  @override
  State<Emptyorderscreen> createState() => _EmptyorderscreenState();
}

class _EmptyorderscreenState extends State<Emptyorderscreen> {
  @override
  Widget build(BuildContext context) {
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 150),
          Center(child: Image.asset('assets/empty_order.png',scale: 2,)),
          Center(child: Text('No Orders....!',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold),))
        ],
      );
  
  }
}