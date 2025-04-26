import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';

class Viewdiscusswidget extends StatefulWidget {
  final String id;
  final String disccussionId;
  final String topics;
  final String category;
  final String answers;
  final String adminReply;
  const Viewdiscusswidget({super.key, required this.id, required this.disccussionId, required this.topics, required this.category, required this.answers, required this.adminReply});

  @override
  State<Viewdiscusswidget> createState() => _ViewdiscusswidgetState();
}

class _ViewdiscusswidgetState extends State<Viewdiscusswidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(

        leading: CircleAvatar(
          backgroundColor: appcolor, 
          radius: 40,child: Icon(Icons.person,color: Colors.white,),),
        title: Text('Category : ${widget.category}',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold),),
        subtitle:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Answer : ${widget.answers}',style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Admin Reply : ${widget.adminReply}',style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        )
      ),
    );
  }
}