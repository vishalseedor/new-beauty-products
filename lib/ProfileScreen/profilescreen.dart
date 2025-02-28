
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';

import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    @override
  void initState() {
    Provider.of<UserProvider>(context,listen: false).getUsertData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:appcolor,
        title: const Text('Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16)),
        
      ),
    
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Profile',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19),),
              const SizedBox(height: 20.0),

             Stack(
  children: [
    const CircleAvatar(
      backgroundColor: Color(0xff00A3FF),
      backgroundImage: AssetImage("assets/new.png"),
      radius: 70.0,
    ),
    
    // Positioned(
    //   right: 5,
    //   bottom: 0,
    //   child: Container(
    //     child: const Icon(Icons.camera_alt_outlined,color: Colors.black,size: 20,),
    //     padding: const EdgeInsets.all(7.5),
    //     decoration: BoxDecoration(
    //       border: Border.all(
    //       width: 1,
    //       color: Colors.white
    //     ),
    //     borderRadius: BorderRadius.circular(90.0),
    //     color: Colors.grey[200]
    //     )
    //   )
    // )
  ]
),
SizedBox(height:14),
 Consumer<UserProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].name;
                  print(userAddress+'vvvvvvvvv');
                }
                return Text(
                  '$userAddress',
                 style:Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 16),
                );
              }),
            // Profile picture section
         //   profilePicture(), // Replace with your implementation

            // User information section
            const SizedBox(height: 20.0),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person_outline,color: appcolor),
                        SizedBox(width: 10),
                        Text('Name',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold),)
                      ],
                    ),
                     Consumer<UserProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].name;
                  print(userAddress+'vvvvvvvvv');
                }
                return Text(
                  '$userAddress',
                 style:Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                );
              }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15.0),
          //  TextFormField(
          //     decoration:  InputDecoration(
          //       fillColor: Colors.grey[200],
          //       filled: true,
          //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
          //       prefixIcon: Icon(Icons.email,color: appcolor,),
          //       hintText: "Email",
          //       hintStyle: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 13)
          //     ),
          // 
          //   ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.email_outlined,color: appcolor),
                        SizedBox(width: 10),
                        Text('Email',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold),)
                      ],
                    ),
                     Consumer<UserProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].email;
                  print(userAddress+'vvvvvvvvv');
                }
                return Text(
                  '$userAddress',
                  style:Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                );
              }),
                  ],
                ),
              ),
            ),
         
          
            SizedBox(height: 15.0,),
             Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.lock_outlined,color: appcolor),
                        SizedBox(width: 10),
                        Text('Password',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold),)
                      ],
                    ),
                     Consumer<UserProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].password;
                  print(userAddress+'vvvvvvvvv');
                }
                return Text(
                  '$userAddress',
                  style:Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                );
              }),
                  ],
                ),
              ),
            ),
            // Row(
            //   children: [
            //     Text("Sex:"),
            //     SizedBox(width: 10.0),
            //     Row(
            //       children: [
            //         Radio<String>(
            //           value: "male",
            //           groupValue: _sex,
            //          : (value) => _onSexSelected(value!),
            //         ),
            //         Text("Male"),
            //         SizedBox(width: 10.0),
            //         Radio<String>(
            //           value: "female",
            //           groupValue: _sex,
            //          : (value) => _onSexSelected(value!),
            //         ),
            //         Text("Female"),
            //         SizedBox(width: 10.0),
            //         Radio<String>(
            //           value: "other",
            //           groupValue: _sex,
            //          : (value) => _onSexSelected(value!),
            //         ),
            //         Text("Other"),
            //       ],
            //     ),
            //   ],
            // ),
            const SizedBox(height: 25.0),

            // Action buttons section
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButton(
            //       style: ElevatedButton.styleFrom(backgroundColor: appcolor),
            //       onPressed: (){
            //       Navigator.push(context,MaterialPageRoute(builder:(context)=>const ProfileEditScreen()));
            //       },
            //       child: const Text("Edit Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            //     ),
            //      ElevatedButton(
            //       style: ElevatedButton.styleFrom(backgroundColor: appcolor),
            //       onPressed: (){},
            //       child: const Text("Cancel",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  // Widget profilePicture() {
  //   // Replace with your desired profile picture implementation
  //   // (e.g., placeholder
  // }
}