
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ExtraScreens/loadingscreen.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/pages/adddiscussionscreen.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/provider/discussionprovider.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/widget/alldiscussionwidget.dart';
import 'package:provider/provider.dart';


class DiscussionScreen extends StatefulWidget { 
    static const routeName = 'all_discussion_screen';
  const DiscussionScreen({super.key});

  @override
  State<DiscussionScreen> createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
    @override
  void initState() {
    Provider.of<Discussionprovider>(context, listen: false)
        .getAllDiscussionData(context: context);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final discussion=Provider.of<Discussionprovider>(context);
    return Scaffold(
        appBar: AppBar(
        
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        // ignore: prefer_const_constructors
        },icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: appcolor,
        title: const Text('Discuusions',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),
    body:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
     Text('Discussions Nears You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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
                            : discussion.discussions.isEmpty
                                ? const Center(
                                    child: Text(
                                    'No Discuusions...',
                                    style: TextStyle(color:Colors.green),
                                  ))
                                : SizedBox(
                                    //height: size.height * 0.6,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                      itemCount: discussion.discussions.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    
                      itemBuilder: (context, index) {
                        return AllDiscussionWidget(
                          id: discussion.discussions[index].id,
                          category: discussion.discussions[index].category,
                          date: discussion.discussions[index].createdAt,
                          topics: discussion.discussions[index].topics,
                         
                        
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