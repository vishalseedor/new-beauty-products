
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/BottomNavigationBar/bottomnavigationbar.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';




class EmptyfavScreen extends StatefulWidget {
  const EmptyfavScreen({super.key});

  @override
  State<EmptyfavScreen> createState() => _EmptyfavScreenState();
}

class _EmptyfavScreenState extends State<EmptyfavScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Center(child: Image.asset('assets/fav.png',scale: 1.6)),
          const Center(child: Text('Your Favourite Product is Empty....!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
        
          SizedBox(height: size.height*0.01),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor:appcolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>const HomePage()));
            }, child:Text('Select Favourite',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))

        ],
      );
    

  }
}