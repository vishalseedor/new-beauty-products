
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/BottomNavigationBar/bottomnavigationbar.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';




class Emptyrecipescreen extends StatefulWidget {
  const Emptyrecipescreen({super.key});

  @override
  State<Emptyrecipescreen> createState() => _EmptyrecipescreenState();
}

class _EmptyrecipescreenState extends State<Emptyrecipescreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 90),
          Center(child: Image.asset('assets/norecipe.png',scale: 1.6)),
          const Center(child: Text('No Reciepies....!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
        
          SizedBox(height: size.height*0.01),
         

        ],
      );
    

  }
}