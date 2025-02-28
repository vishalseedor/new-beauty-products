
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ReciepeScreen/provider/reciepeprovider.dart';
import 'package:provider/provider.dart';

class ReceipeDetailsScreen extends StatefulWidget {
  static const routeName = 'recipe_details_screen';
  final String id;
  const ReceipeDetailsScreen({super.key,required this.id});

  @override
  State<ReceipeDetailsScreen> createState() => _ReceipeDetailsScreenState();
}

class _ReceipeDetailsScreenState extends State<ReceipeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
       final recipeData =
        Provider.of<RecipeProvider>(context).recipes.firstWhere((element) => element.id== widget.id);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appcolor,
        title: Text('Receipe Details Screen',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),

      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1. Category :',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(recipeData.category),
            SizedBox(height: size.height*0.02,),
            Text('2. Incridents',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(recipeData.ingredients),
            SizedBox(height: size.height*0.02,),
            Text('3. Instructions',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(recipeData.instructions),
            SizedBox(height: size.height*0.02,),
            Text('4. Benifits',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(recipeData.benefits),
            SizedBox(height: size.height*0.02,),
            Text('5. Usage product',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(recipeData.usageProduct),
            SizedBox(height: size.height*0.02,),
            Text('6. Prepartion Time',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(recipeData.preparationTime),
            SizedBox(height: size.height*0.02,),
            Text('7. Diffculity Level',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(recipeData.difficultyLevel),
            SizedBox(height: size.height*0.02,),
            Text('8. Storage',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(recipeData.storage),
            SizedBox(height: size.height*0.02,),
            Text('9. Youtube Link',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(recipeData.link,style: TextStyle(color: Colors.blue),),
            SizedBox(height: size.height*0.02,),
            Text('10. Creator',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(recipeData.creator)
        
        
        
          ],
        ),
        ),
      ),
      
    );
  }
}