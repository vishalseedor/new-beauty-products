
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ReciepeScreen/pages/recipedetailsscreen.dart';

class AllRecipeWidget extends StatefulWidget {
  final String id;
  final String category;
  final String preparationTime;
  final String creator;
  final String difficultyLevel;
  const AllRecipeWidget({super.key,required this.id,required this.category,required this.preparationTime,required this.creator,required this.difficultyLevel});

  @override
  State<AllRecipeWidget> createState() => _AllRecipeWidgetState();
}

class _AllRecipeWidgetState extends State<AllRecipeWidget> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
         Navigator.of(context).pushNamed(ReceipeDetailsScreen.routeName,arguments:widget.id);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset('assets/logo.png',height: 50,width: 50,),
                title: Text('Creator : ${widget.creator}',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold),),
                subtitle: Text('Category : ${widget.category}',style: TextStyle(color: appbarRightColor,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: size.height*0.01),
              Container(
                height: 40,
                width: double.infinity,
                color: appcolor,
                child: Center(child: Text('Preparation Time : ${widget.preparationTime}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
              ),
              SizedBox(height: size.height*0.02,)
            ],
          ),
        ),
      ),
    );
    
}}