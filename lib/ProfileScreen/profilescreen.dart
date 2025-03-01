
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/BottomNavigationBar/bottomnavigationbar.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/LoginScreen/loginscreen.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Provider.of<UserProvider>(context,listen: false).getUsertData(context: context);
    super.initState();
  }
  
  
  
  @override 
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appcolor,
        title: Text('Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
           
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<UserProvider>(builder: (context, value, child) {
            String userName = "";
            for (var i = 0; i < value.users.length; i++) {
              userName = value.users[i].name;
            }
            return Text(
              userName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            );
          }),
           Consumer<UserProvider>(builder: (context, value, child) {
            String useremail = "";
            for (var i = 0; i < value.users.length; i++) {
              useremail = value.users[i].email;
            }
            return Text(
              useremail,
              style: const TextStyle(
               
                  fontWeight: FontWeight.bold),
            );
          }),
          
           
                     
                    ],
                  ),
                    Consumer<UserProvider>(builder: (context, value, child) {
            String userphoto = "";
            for (var i = 0; i < value.users.length; i++) {
              userphoto = value.users[i].image;
            }
            return CircleAvatar(
              backgroundColor: Colors.grey[100],
              radius: 60,
              backgroundImage: AssetImage('assets/profile.png'),
            );
          }),
                  // GestureDetector(
                  //   onTap: () {
                    
                  //   },
                  //   child: CircleAvatar(
                  //     radius: 45,
                  //     child: Image.asset('assets/profile.png'),
                  //   ),
                  // )
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
        Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Column(
            children: [
             
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                           // Navigator.push(context,MaterialPageRoute(builder:(context)=>const pr()));
                          },
                          child: Icon(
                            Icons.person,
                            size: 25,
                            color: appcolor
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        const Text('Edit Profile',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 31),
                      child: Text(
                        'Edit your profile',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                           // Navigator.push(context,MaterialPageRoute(builder:(context)=>const TermsandConditions()));
                          },
                          child: Icon(
                            Icons.book,
                            size: 25,
                            color: appcolor,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        const Text('Terms & Conditions',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 31),
                      child: Text(
                        'Know terms of use',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                           // Navigator.push(context,MaterialPageRoute(builder: (context)=>const PrivacyandPolicy()));
                          },
                          child: Icon(
                            Icons.privacy_tip,
                            size: 25,
                            color: appcolor,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        const Text('Privacy Policy',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 31),
                      child: Text(
                        'Companies privacy policy',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Logout', 
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  content:
                      const Text('Are you sure want to exit this app?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                  actions: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: appcolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor:appcolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(
                           fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                );
              },
            );
                          },
                          child: Icon(
                            Icons.logout,
                            size: 25,
                            color: appcolor,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        const Text('Logout',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 31),
                      child: Text(
                        'Sign out from account',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
          ),
        );
  }
}
