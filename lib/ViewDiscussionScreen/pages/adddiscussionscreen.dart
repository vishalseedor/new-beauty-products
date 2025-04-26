
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/BottomNavigationBar/bottomnavigationbar.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/pages/view_discuussion.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/provider/discussionprovider.dart';
import 'package:provider/provider.dart';

class AddDiscussionScreen extends StatefulWidget {
  final String id;
  const AddDiscussionScreen({super.key,required this.id});

  @override
  State<AddDiscussionScreen> createState() => _AddDiscussionScreenState();
}

class _AddDiscussionScreenState extends State<AddDiscussionScreen> {
  TextEditingController discussioncontroller=TextEditingController();
     final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
 final discussion=Provider.of<Discussionprovider>(context);
  final userData=Provider.of<UserProvider>(context);
 
    Size size=MediaQuery.of(context).size;
    final discussData =
        Provider.of<Discussionprovider>(context).discussions.firstWhere((element) => element.id == widget.id);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appcolor,
        title: Text('Disscussion Answer',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height*0.15),
                Center(child: Image.asset('assets/discuss.png',scale: 2)),
                Text('Answer',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: size.height*0.01),
                TextFormField(
                  controller: discussioncontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: 'Add Discussion answer',
                    hintStyle: TextStyle(fontSize: 13)
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Please enter your discussion';

                    }
                    else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: size.height*0.02),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: appcolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    onPressed: ()async{
            
                         if (_formKey.currentState!.validate()) {
                             
                                 discussion.addDiscussion(userId: userData.currentUserId.toString(),discussionId: discussData.id.toString(),answers: discussioncontroller.text.toString());  
                                 print(userData.currentUserId.toString());
                                 print(discussData.id.toString()) ;
                                 print(discussioncontroller.text.toString());                    
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    backgroundColor: appcolor,
                                    content: const Text("Disccussion added successfully",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)));
                                  await Navigator.push(context,MaterialPageRoute(builder:(context)=>const HomePage()));
             
            
                        }
                    }, child:Text('Submit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                )
              ],
            ),
          ),
        ),
      ),
     
    );
    
  }
  
}