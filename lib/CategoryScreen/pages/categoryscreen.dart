
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/BottomNavigationBar/bottomnavigationbar.dart';
import 'package:new_diy_beauty_products/CategoryScreen/provider/categoryprovider.dart';
import 'package:new_diy_beauty_products/CategoryScreen/widgets/allcategorywidget.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ExtraScreens/loadingscreen.dart';
import 'package:provider/provider.dart';


class CategoryScreen extends StatefulWidget { 
    static const routeName = 'all_category_screen';
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
    @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategoryData(context: context);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final category=Provider.of<CategoryProvider>(context);
    return WillPopScope(
      onWillPop: ()async {
        Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );    return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
          appBar: AppBar(
          
          leading:  IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
          // ignore: prefer_const_constructors
          },icon: Icon(Icons.arrow_back,color: Colors.white,)),
          backgroundColor: appcolor,
          title: const Text('Category Products',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
        ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
       Text('Category Products Nears You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(height: size.height*0.02),
             
                 FadeInUp(
                   duration: const Duration(milliseconds: 1500),
                   child: category.loadingSpinner
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
                                : category.category.isEmpty
                                    ? const Center(
                                        child: Text(
                                        'No Categoeies...',
                                        style: TextStyle(color:Colors.green),
                                      ))
                                    : SizedBox(
                                        //height: size.height * 0.6,
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                          itemCount: category.category.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        
                          itemBuilder: (context, index) {
                            return AllCategoryWidget(
                              id: category.category[index].id,
                              categoryname: category.category[index].categoryName,
                              image: category.category[index].image,
                            
                              );
                          },
                        )
                                      ),
                 ),
              
            ],
          ),
        ),
      ),  
      ),
    );
  }
}