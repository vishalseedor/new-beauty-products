
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
                .pushNamed(AllCategoryEachScreen.routeName ,arguments:widget.id);
                   
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          CircleAvatar(
                            radius: 55,
                            backgroundImage: NetworkImage(widget.image),
                          ),
                          // Image.network(
                          //   widget.image,
                          //   scale: 4,
                          // ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                           Text(
                            widget.categoryname,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                );
    // return GestureDetector(
    //   onTap: () {
    //      Navigator.of(context)
    //             .pushNamed(AllCategoryEachScreen.routeName,arguments:widget.id);
    //   },
    //   child: Card(
    //     color: Colors.grey[200],
    //     elevation: 5,
                 
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
                    
    //                   children: [
    //                     Image.network(widget.image,scale: 4),
                     
    //                     Text(widget.categoryname,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
    //                   ],
    //                 ),
    //               ),
    // );
  }
}