
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ReciepeScreen/pages/recipedetailsscreen.dart';
import 'package:new_diy_beauty_products/TipsScreen/design/tipsdetailsscreen.dart';

class AllTipsWidget extends StatefulWidget {
  final String id;
  final String description;
  final String ingredients;
  final String usageProduct;

  const AllTipsWidget({super.key, required this.id, required this.description,required this.ingredients, required this.usageProduct,});

  @override
  State<AllTipsWidget> createState() => _AllTipsWidgetState();
}

class _AllTipsWidgetState extends State<AllTipsWidget> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
      Navigator.of(context).pushNamed(Tipsdetailsscreen.routeName,arguments:widget.id);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset('assets/logo.png',height: 50,width: 50,),
                title: Text('Ingredients : ${widget.ingredients}',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold),),
                subtitle: Text('Usage Product : ${widget.usageProduct}',style: TextStyle(color: appbarRightColor,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: size.height*0.01),
              // Container(
              //   height: 40,
              //   width: double.infinity,
              //   color: appcolor,
              //   child: Center(child: Text('Preparation Time : ${widget.description}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
              // ),
            
            ],
          ),
        ),
      ),
    );
    
}}