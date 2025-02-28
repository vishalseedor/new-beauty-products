
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';

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
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                                      // Navigator.of(context).pushNamed(EventDetailsScreen.routeName,arguments:widget.id);

                        
                        },
                        child: Card(
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
                                    Text('Topic: ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: appbarRightColor),),
                                    Text(widget.topics,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: appbarRightColor),)
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    color: appcolor,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: size.height * 0.03,
                                        width: size.width * 0.32,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(40),
                                              topRight: Radius.circular(40)),
                                          color: Colors.white,
                                        ),
                                        child: const Center(
                                            child: Text(
                                          'Date :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.2),
                                        child: Text(
                                          widget.date.substring(0,11),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
  }
}