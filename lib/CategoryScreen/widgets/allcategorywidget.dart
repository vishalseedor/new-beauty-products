
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/CatgoryByScreen/pages/categorybyproductscreen.dart';

class AllCategoryWidget extends StatefulWidget {
  final String id;
  final String categoryname;
  final String image;
  const AllCategoryWidget({super.key,required this.id,required this.categoryname,required this.image});

  @override
  State<AllCategoryWidget> createState() => _AllCategoryWidgetState();
}

class _AllCategoryWidgetState extends State<AllCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
         Navigator.of(context)
                .pushNamed(AllCategoryEachScreen.routeName,arguments:widget.id);
      },
      child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(color: Colors.brown[100],borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(widget.image,height: 100,width: 100,),
                         SizedBox(height: size.height*0.02),
                        Text(widget.categoryname,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
    );
  }
}