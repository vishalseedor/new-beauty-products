
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ExtraScreens/loadingscreen.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/pages/discussionscreen.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/provider/discussionprovider.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/widget/allviewdiscusswidget.dart';
import 'package:provider/provider.dart';


class ViewDiscuussion extends StatefulWidget { 

  final String userId;
  final String discussionId;
    static const routeName = 'view_discussion_screen';
  const ViewDiscuussion({super.key, required this.userId, required this.discussionId,});

  @override
  State<ViewDiscuussion> createState() => _ViewDiscuussionState();
}

class _ViewDiscuussionState extends State<ViewDiscuussion> {
    @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Discussionprovider>(context, listen: false)
          .getAllDiscussionReplyData(
        context: context,
        userId: widget.userId, // Use widget.userId
         discussionId: widget.discussionId, // Use widget.discussionId
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final discussion=Provider.of<Discussionprovider>(context);
    return Scaffold(
        appBar: AppBar(
        
        leading:  IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DiscussionScreen()));
        // ignore: prefer_const_constructors
        },icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: appcolor,
        title: const Text('Admin Replies',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),
    body:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
     Text('Discussions Replys Nears You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(height: size.height*0.02),
           
               discussion.loadingSpinner
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
                            : discussion.viewdis.isEmpty
                                ?  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height:size.height*0.3),
                                        Icon(Icons.chat_bubble,color: appcolor,size: 50,),
                                         SizedBox(height:size.height*0.02),
                                        Text(
                                        'No Replys.....!',
                                        style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold),
                                                                          ),
                                      ],
                                    ))
                                : SizedBox(
                                    //height: size.height * 0.6,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                      itemCount: discussion.viewdis.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    
                      itemBuilder: (context, index) {
                        return Viewdiscusswidget(
                          id: discussion.viewdis[index].id,
                          category: discussion.viewdis[index].category,
                          topics: discussion.viewdis[index].topics,
                          adminReply: discussion.viewdis[index].adminReply,
                          answers: discussion.viewdis[index].answers,
                          disccussionId: discussion.viewdis[index].discussionId,
                         
                        
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