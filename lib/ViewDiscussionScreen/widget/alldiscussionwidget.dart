
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ProductScreen/provider/productprovider.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/pages/adddiscussionscreen.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/pages/view_discuussion.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/provider/discussionprovider.dart';
import 'package:provider/provider.dart';

class AllDiscussionWidget extends StatefulWidget {
  final String id;
  final String topics;
  final String category;
  final String date;
  const AllDiscussionWidget({super.key,required this.id,required this.topics,required this.category,required this.date});

  @override
  State<AllDiscussionWidget> createState() => _AllDiscussionWidgetState();
}

class _AllDiscussionWidgetState extends State<AllDiscussionWidget> {
    bool _isNavigating = false; 
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
     final userId = context.read<UserProvider>().currentUserId.toString();
     
    return  Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        color: Colors.grey[200],
                        margin: const EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                   Text(
                                    'Category : ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                 
                                  Text(
                                    widget.category,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                               SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
  children: [
    Text(
      'Topic: ',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: appbarRightColor,
      ),
    ),
    Flexible(
      child: Text(
        widget.topics,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: appbarRightColor,
        ),
        overflow: TextOverflow.ellipsis, // Truncate with "..."
        maxLines: 1, // Ensure it's a single line
        softWrap: false, // Avoid wrapping to the next line
      ),
    ),
  ],
),

                              // Row(
                              //   children: [
                              //     Text('Topic: ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: appbarRightColor),),
                              //     Text(widget.topics,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: appbarRightColor),maxLines: 2,)
                              //   ],
                              // ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            Row(
                              children: [
                                Text('Date : ',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold),),
                                Text(widget.date,style: TextStyle(color: appcolor,fontWeight: FontWeight.bold),),
                              ],
                            ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: size.height*0.04,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: appcolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                      onPressed: (){
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDiscussionScreen(id: widget.id,)));   
                                      }, child:Text('Answer',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                                  ),
                                  SizedBox(width: 10),
                                   SizedBox(
                                    height: size.height*0.04,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: appcolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                                       onPressed: _isNavigating
                            ? null // Disable button when navigating
                            : () {
                                setState(() {
                                  _isNavigating = true; // Prevent multiple clicks
                                });

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewDiscuussion(
                                      userId: userId,
                                      discussionId: widget.id,
                                    ),
                                  ),
                                ).then((_) {
                                  // Re-enable button when coming back
                                  setState(() {
                                    _isNavigating = false;
                                  });
                                });
                              },
                                      // onPressed: (){
                                      //        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewDiscuussion(userId:userid.currentUserId.toString(),discussionId: widget.id,)));   
                                      // },
                                       child:Text('View Reply',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
  }
}