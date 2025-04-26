
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';

import 'package:new_diy_beauty_products/OrderScreen/screen/emptyorderscreen.dart';

import 'package:new_diy_beauty_products/TipsScreen/api/tipsprovider.dart';
import 'package:new_diy_beauty_products/TipsScreen/widget/tipswidget.dart';


import 'package:provider/provider.dart';
import '../../../ExtraScreens/loadingscreen.dart';

class Tipsscreen extends StatefulWidget { 
    static const routeName = 'all_tips_screen';
  const Tipsscreen({super.key});

  @override
  State<Tipsscreen> createState() => _TipsscreenState();
}

class _TipsscreenState extends State<Tipsscreen> {
    @override
  void initState() {
 
    Provider.of<Tipsprovider>(context, listen: false)
        .getAllTipsData(context: context);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final tips=Provider.of<Tipsprovider>(context);
    return Scaffold(
        appBar: AppBar(
        
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        // ignore: prefer_const_constructors
        },icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: appcolor,
        title: const Text('Tips',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),
    body:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: size.height*0.01),
     Text('Tips Nears You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(height: size.height*0.02),
       
               FadeInUp(
                duration: const Duration(milliseconds: 1500),
                 child: tips.loadingSpinner
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
                              : tips.tips.isEmpty
                                  ? Emptyorderscreen()
                                  : SizedBox(
                                      //height: size.height * 0.6,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                        itemCount: tips.tips.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                     
                        itemBuilder: (context, index) {
                          return AllTipsWidget(
                            id:tips.tips[index].id,
                             description:tips.tips[index].description,
                              ingredients: tips.tips[index].ingredients,
                               usageProduct: tips.tips[index].usageProduct);
                        },
                      )
                                    ),
               ),
            
          ],
        ),
      ),
    ),  
    );
  }
}