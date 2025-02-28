
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/LoginScreen/loginscreen.dart';
import 'package:new_diy_beauty_products/LoginScreen/roundbutton.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
final _formKey = GlobalKey<FormState>();
Future<void>registerBeautyProducts(

String name,String phone,String email,String password,String address) async {
  const url = 'http://campus.sicsglobal.co.in/Project/Diy_product/api/user_registration.php';

  Map<String, String> body = {
  'name':name,
  'phone':phone,
  'email':email,
  'password':password,
  'address':address
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      body: body,
      
    );
       var jsonData=json.decode(response.body);

      if (response.statusCode == 200) {
      if(jsonData['status']==true){
          ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: appcolor,
          content: const Text('Register Successful!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: const Duration(seconds: 4),
        ),
      );
      Navigator.push(context,MaterialPageRoute(builder:(context)=>const LoginScreen()));
      print(body);
      print("Response body${response.body}");
    
      print('Registration successful');
      }
      else{
        jsonData['status']==false;
         // ignore: use_build_context_synchronously
         ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor:appcolor,
          content: const Text('User Already Exists !',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: const Duration(seconds: 4),
        ),
      );
         print('Error: ${response.statusCode}');
      }
     
    } else {
       
     print('fffff');
    }
  } catch (error) {
    print('Error: $error');
  }
}




  TextEditingController namecontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passswordcontroller=TextEditingController();
  TextEditingController addresscontroller=TextEditingController();
 

  
  
    bool loading = false;
  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
      
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/reg.jpg'),fit: BoxFit.cover)),
          child: Center(
            child: SingleChildScrollView
            (
              child: Padding(
                       padding: const EdgeInsets.all(30),
                       child: Form(
                         key: _formKey,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                           SizedBox(height: size.height*0.03),
                             const Center(
                               child: Text(
                                 'Create an Account',
                                 style:
                                     TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white),
                               ),
                             ),
                             SizedBox(
                               height: size.height * 0.03,
                             ),
                            //   const Text(
                            //    'Name',
                            //    style: TextStyle(
                            //        color: Colors.white, fontWeight: FontWeight.bold,),
                            //  ),
                             SizedBox(height: size.height * 0.01),
                             TextFormField(
                               
                                controller: namecontroller,
                               keyboardType: TextInputType.text,
                               decoration:  InputDecoration(
                                 errorStyle: TextStyle(color: Colors.white),
                                 fillColor: Colors.white.withOpacity(0.3),
                                 filled: true,
                                 prefixIcon: const Icon(Icons.person_outline,color: Colors.white,),
                                   // hintText: 'Enter Phone Number/Email ID/BN User Id',
                                   hintText: 'Name',
                                   hintStyle: const TextStyle(fontSize: 13,color: Colors.white),
                                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(70),borderSide: BorderSide.none)),
                                   validator: (value) {
                                     if(value!.isEmpty){
                                       return 'Please enter your name';
                                     }
                                     else{
                                      return null;
                                     }
                                   },
                             ),
                             SizedBox(height: size.height * 0.02),
                            //  const Text(
                            //    'Phone',
                            //    style: TextStyle(
                            //        color: Colors.white, fontWeight: FontWeight.bold),
                            //  ),
                             SizedBox(height: size.height * 0.01),
                             TextFormField(
                               controller: phonecontroller,
                               keyboardType: TextInputType.phone,
                               decoration:  InputDecoration(
                                    errorStyle: TextStyle(color: Colors.white),
                               fillColor: Colors.white.withOpacity(0.3),
                                 filled: true,
                                   prefixIcon: const Icon(Icons.mobile_screen_share_outlined,color:Colors.white),
                                   hintText: 'Phone',
                                 hintStyle: const TextStyle(fontSize: 13,color: Colors.white),
                                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(70),borderSide: BorderSide.none)),
                                   validator: (value) {
                                     if(value!.isEmpty){
                                       return 'Please enter your phone';
                                     }
                                     else{
                                      return null;
                                     }
                                   },
                             ),
                                        
                               SizedBox(height: size.height * 0.02),
                            //  const Text(
                            //    'Email',
                            //    style: TextStyle(
                            //        color: Colors.white, fontWeight: FontWeight.bold),
                            //  ),
                             SizedBox(height: size.height * 0.01),
                             TextFormField(
                              
                                controller: emailcontroller,
                               keyboardType: TextInputType.emailAddress,
                               decoration:  InputDecoration(
                                    errorStyle: TextStyle(color: Colors.white),
                                  fillColor: Colors.white.withOpacity(0.3),
                                 filled: true,
                                   prefixIcon: const Icon(Icons.email_outlined,color:Colors.white),
                                   // hintText: 'Enter Phone Number/Email ID/BN User Id',
                                   hintText: 'Email',
                                     hintStyle: const TextStyle(fontSize: 13,color: Colors.white),
                                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(70),borderSide: BorderSide.none)),
                                   validator: (value) {
                                     if(value!.isEmpty){
                                       return 'Please enter your email';
                                     }
                                     else{
                                      return null;
                                     }
                                   },
                             ),
                               SizedBox(height: size.height * 0.02),
                            //  const Text(
                            //    'Password',
                            //    style: TextStyle(
                            //        color: Colors.white, fontWeight: FontWeight.bold),
                            //  ),
                             SizedBox(height: size.height * 0.01),
                             TextFormField(
                              controller: passswordcontroller,
                               keyboardType: TextInputType.text,
                               decoration:  InputDecoration(
                                    errorStyle: TextStyle(color: Colors.white),
                               fillColor: Colors.white.withOpacity(0.3),
                                 filled: true,
                                   prefixIcon: const Icon(Icons.lock_outline,color:Colors.white),
                                   // hintText: 'Enter Phone Number/Email ID/BN User Id',
                                   hintText: 'Password',
                                     hintStyle: const TextStyle(fontSize: 13,color: Colors.white),
                                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(70),borderSide: BorderSide.none)),
                                   validator: (value) {
                                     if(value!.isEmpty){
                                       return 'Please enter your password';
                                     }
                                     else{
                                      return null;
                                     }
                                   },
                             ),
                               SizedBox(height: size.height * 0.01),
                            //  const Text(
                            //    'Address',
                            //    style: TextStyle(
                            //        color: Colors.white, fontWeight: FontWeight.bold),
                            //  ),
                              SizedBox(height: size.height * 0.02),
                             TextFormField(
                              controller: addresscontroller,
                               keyboardType: TextInputType.text,
                               decoration:  InputDecoration(
                                    errorStyle: TextStyle(color: Colors.white),
                              fillColor: Colors.white.withOpacity(0.3),
                                 filled: true,
                                   prefixIcon: const Icon(Icons.location_on_outlined,color:Colors.white),
                                   // hintText: 'Enter Phone Number/Email ID/BN User Id',
                                   hintText: 'Address',
                                     hintStyle: const TextStyle(fontSize: 13,color: Colors.white),
                                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(70),borderSide: BorderSide.none)),
                                   validator: (value) {
                                     if(value!.isEmpty){
                                       return 'Please enter your address';
                                     }
                                     else{
                                      return null;
                                     }
                                   },
                             ),
                             
                             
                            
                            
                                         
                             SizedBox(
                               height: size.height * 0.04,
                             ),
                                         
                             RoundButton(
                                 title: 'Register',
                                 loading: loading,
                                 onTap: (){
                                if (_formKey.currentState!.validate()) {
                                  registerBeautyProducts(
                                    namecontroller.text.toString(),
                                    phonecontroller.text.toString(),
                                    emailcontroller.text.toString(),
                                    passswordcontroller.text.toString(),
                                    addresscontroller.text.toString(),

                                   
                     
                
                 );


                
                  }
                                 }),
                
                           ],
                         ),
                       ),
                     ),
            ),
          ),
        ),
      ),
    );
  }
}