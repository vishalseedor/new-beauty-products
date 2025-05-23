
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/BottomNavigationBar/bottomnavigationbar.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/Feedbackscreen/feedbackprovider.dart';
import 'package:new_diy_beauty_products/ProductScreen/provider/productprovider.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  TextEditingController commentcontroller=TextEditingController();
   final _formKey = GlobalKey<FormState>();
   void launchEmailSubmission() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'support@example.com',
      queryParameters: {
        'subject': 'Default Subject',
        'body': 'Default body'
      }
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final support=Provider.of<FeedbackProvider>(context);
    final userData=Provider.of<UserProvider>(context);
    final product=Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text('Feedback',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
          leading:IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=>HomePage()));
          }, icon:Icon(Icons.arrow_back,color: Colors.white,)),
          backgroundColor: appcolor,
          iconTheme:IconThemeData(color: Colors.white),
        ),
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Form(
              key:_formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'Support',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Let us know your',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'feedback & queries',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Text('If you have any questions, feedback, or need assistance, feel free to reach out to us. You can contact us via email at support@example.com or call us at +1 234 567 890. Our team is always ready to assist you and ensure you have the best experience. We value your input and look forward to hearing from you!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                   SizedBox(
                    height: size.height * 0.02,
                  ),
                  InkWell(
                    onTap: ()async{
                      final Uri url=Uri(
                        scheme: 'tel',
                        path: "+1 234 567 890.",
                      );
                      if( await canLaunchUrl(url)){
                        await launchUrl(url);
                      }else{
                        print('cannot lanuch this url');
                      }
                     
                    },
                    child: Card(
                      shadowColor: Colors.grey,
                      // height: size.height * 0.048,
                      // width: size.width * 0.90,
                      // decoration: BoxDecoration(
                      //   boxShadow: [
                      //     BoxShadow(
                      //         color: Colors.grey.withOpacity(0.4),
                      //         spreadRadius: 1,
                      //         blurRadius: 1)
                      //   ],
                      //   color: Colors.white,
                      //   borderRadius: BorderRadius.circular(5),
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Call us',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Icon(
                              Icons.call,
                              color: appcolor,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  InkWell(
                    onTap:launchEmailSubmission,
                    child: Card(
                      // height: size.height * 0.048,
                      // width: size.width * 0.90,
                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   borderRadius: BorderRadius.circular(5),
                      //   boxShadow: [
                      //     BoxShadow(
                      //         color: Colors.grey.withOpacity(0.4),
                      //         spreadRadius: 1,
                      //         blurRadius: 1)
                      //   ],
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Email us',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Icon(
                              Icons.email,
                              color: appcolor,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  // const Text(
                  //   'Write us',
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.002,
                  // ),
                  // Text(
                  //   'Enter your message',
                  //   style: TextStyle(
                  //       color: Colors.grey[700],
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.w600),
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.04,
                  // ),
               
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 1),
                  //   child: Container(
                  //     height: size.height * 0.05,
                  //     width: size.width * 0.90,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         border: Border.all(color: Colors.white),
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: Colors.grey.withOpacity(0.4),
                  //               spreadRadius: 1,
                  //               blurRadius: 1)
                  //         ],
                  //         // color: affnityBottomAppBarBackgroundColor,
                  //         borderRadius: BorderRadius.circular(5)),
                  //     child: Center(
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(left: 20),
                  //         child: TextField(
                  //           keyboardType: TextInputType.text,
                  //           decoration: InputDecoration(
                  //             hintText: "Select subject",
                  //             suffixIcon: Icon(
                  //               Icons.expand_more,
                  //               color: greencolor,
                  //             ),
                  //             hintStyle: const TextStyle(color: Colors.grey),
                  //             border: InputBorder.none,
                  //             focusedBorder: InputBorder.none,
                  //           ),
                  //           style: const TextStyle(color: Colors.white),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // Container(
                  //   height: size.height * 0.1,
                  //   width: size.width * 0.90,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     border: Border.all(color: Colors.white),
                  //     // color: affnityBottomAppBarBackgroundColor,
                  //     borderRadius: BorderRadius.circular(5),
                  //     boxShadow: [
                  //       BoxShadow(
                  //           color: Colors.grey.withOpacity(0.4),
                  //           spreadRadius: 1,
                  //           blurRadius: 1)
                  //     ],
                  //   ),
                  //   child:  Center(
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 20),
                  //       child: TextFormField(
                  //         controller: commentcontroller,
                  //         keyboardType: TextInputType.text,
                  //         decoration: const InputDecoration(
                  //           hintText: "Write here",
                  //           hintStyle: TextStyle(color: Colors.grey),
                  //           border: InputBorder.none,
                  //           focusedBorder: InputBorder.none,
                  //         ),
                  //         style: const TextStyle(color: Colors.black),
                  //         validator: (value) {
                  //           if(value!.isEmpty){
                  //             return 'Please enter your comments';
                  //           }
                            
                  //         },
                        
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.03,
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.047,
                  //   width: size.width * 0.88,
                  //   child: ElevatedButton(
                  //       style:
                  //           ElevatedButton.styleFrom(backgroundColor: appcolor),
                  //       onPressed: ()async {
                  //       if (_formKey.currentState!.validate()) {
                  //               support.addFeedback(comments: commentcontroller.toString(),userId:userData.currentUserId);                        
                  //               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //                 backgroundColor: appcolor,
                  //                 content: const Text("Feedback added successfully",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)));
                  //               await Navigator.push(context,MaterialPageRoute(builder:(context)=>const HomePage()));
 

                  //     }
                  //       },
                  //       child: const Text(
                  //         'Submit',
                  //         style: TextStyle(fontSize: 15, color: Colors.white),
                  //       )),
                  // ),
                  SizedBox(height: size.height * 0.07),
                  Image.asset(
                    'assets/contact_footer.png',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
