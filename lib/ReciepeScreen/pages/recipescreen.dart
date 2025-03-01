
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ExtraScreens/loadingscreen.dart';
import 'package:new_diy_beauty_products/ReciepeScreen/pages/emptyrecipescreen.dart';
import 'package:new_diy_beauty_products/ReciepeScreen/provider/reciepeprovider.dart';
import 'package:new_diy_beauty_products/ReciepeScreen/widgets/allrecipewidget.dart';
import 'package:provider/provider.dart';


class ReciepeScreen extends StatefulWidget { 
    static const routeName = 'all_recipe_screen';
  const ReciepeScreen({super.key});

  @override
  State<ReciepeScreen> createState() => _ReciepeScreenState();
}

class _ReciepeScreenState extends State<ReciepeScreen> {
    @override
  void initState() {
    Provider.of<RecipeProvider>(context, listen: false)
        .getAllRecipesData(context: context);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final recipe=Provider.of<RecipeProvider>(context);
    return Scaffold(
        appBar: AppBar(
        
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        // ignore: prefer_const_constructors
        },icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor:appcolor,
        title: const Text('Recipes',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),
    body:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
     Text('Recipes Products Nears You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(height: size.height*0.02),
           
               recipe.loadingSpinner
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
                            : recipe.recipes.isEmpty
                                ? const Emptyrecipescreen()
                                : SizedBox(
                                    //height: size.height * 0.6,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                      itemCount: recipe.recipes.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                  
                      itemBuilder: (context, index) {
                        return AllRecipeWidget(
                          id: recipe.recipes[index].id,
                          category: recipe.recipes[index].category,
                          creator: recipe.recipes[index].creator,
                          preparationTime: recipe.recipes[index].preparationTime,
                          difficultyLevel: recipe.recipes[index].difficultyLevel,
                         
                        
                          );
                      },
                    )
                                  ),
            
          ],
        ),
      ),
    ),  
    );
  }
}