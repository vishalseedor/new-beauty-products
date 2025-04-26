

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_diy_beauty_products/BottomNavigationBar/bottomnavigationbar.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/LoginScreen/roundbutton.dart';
import 'package:new_diy_beauty_products/ProfileScreen/models/profilemodel.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';
import 'package:new_diy_beauty_products/RegisterScreen/registerscreen.dart';
import 'package:provider/provider.dart';





class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  bool rememberMe = true;
  bool loading = false;
  late bool _passwordVisible;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  final _formKey = GlobalKey<FormState>();
   void loginBeautyProducts(String email, String password) async {
    print(email);
    print(password);
    const url =
        'http://campus.sicsglobal.co.in/Project/Diy_product/api/user_login.php';

    Map<String, String> body = {'email': email, 'password': password};

    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
      );
      print(url);
      var jsonData = json.decode(response.body);
      print(jsonData);
      print(jsonData["status"]);
      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {
          //      getstorage.write("phone",loginModel!.phone.toString());
          // getstorage.write("password",loginModel!.password.toString());
          // getstorage.read(phone);
          // phone=getstorage.read("phone");

          List user = jsonData['userData'];
          if (user.isNotEmpty) {
            UserData userdata = UserData.fromJson(user[0]);
            String userId = userdata.id;
            Provider.of<UserProvider>(context, listen: false)
                .setCurrentUserId(userId);
            print(userId);
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor:appcolor,
              content: const Text(
                'Login Successful!',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomePage()));
          print(body);
          print("Response body${response.body}");

          print('Login successful');
        } else if (jsonData['status'] == false) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: appcolor,
              content: const Text(
                'Invalid email and password',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
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
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }
 


 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SafeArea(
        child: Scaffold(
       
            body: Container(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/c.jpg'),fit: BoxFit.cover)),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _formKey,
                  
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                    
                        SizedBox(height: size.height*0.2),
                          Center(
                            child: const Text(
                              'GlowWhisk',
                              style:
                                  TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          //  const Text(
                          //   'Email',
                          //   style: TextStyle(
                          //       color: Colors.black, fontWeight: FontWeight.bold,),
                          // ),
                          SizedBox(height: size.height * 0.01),
                          TextFormField(
                            
                             controller: emailcontroller,
                            keyboardType: TextInputType.emailAddress,
                            decoration:  InputDecoration(
                              
                              fillColor: Colors.white.withOpacity(0.3),
                              filled: true,
                              prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                                // hintText: 'Enter Phone Number/Email ID/BN User Id',
                                hintText: 'Email',
                                hintStyle: TextStyle(fontSize: 13),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(60),borderSide: BorderSide.none)),
                                validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            else{
                              return null;
                            }
                          },
                          ),
                          SizedBox(height: size.height * 0.03),
                          // const Text(
                          //   'Password',
                          //   style: TextStyle(
                          //       color: Colors.black, fontWeight: FontWeight.bold),
                          // ),
                          SizedBox(height: size.height * 0.01),
                          TextFormField(
                            obscureText: _passwordVisible,
                              controller: passwordcontroller,
                            keyboardType: TextInputType.emailAddress,
                            decoration:  InputDecoration(
                              
                                  
                                 fillColor: Colors.white.withOpacity(0.3),
                              filled: true,
                                prefixIcon: Icon(Icons.lock_outline,color:Colors.black),
                                // hintText: 'Enter Phone Number/Email ID/BN User Id',
                                hintText: 'Password',
                                hintStyle: TextStyle(fontSize: 13),
                                suffixIcon: IconButton(
            icon: Icon(
             
               _passwordVisible
               ? Icons.visibility_off
               : Icons.visibility,
               color: Colors.black
               ),
            onPressed: () {
           
               setState(() {
                   _passwordVisible = !_passwordVisible;
               });
             },
            ),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(60),borderSide: BorderSide.none)),
                                validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    // Regular expression to check for at least one special character
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  },
                          //        validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Please enter your password';
                          //   }
                          //   else{
                          //     return null;
                          //   }
                          // },
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Row(
                              //   children: [
                              //     GestureDetector(
                              //       onTap: () {
                              //         rememberMe = !rememberMe;
                              //         setState(() {});
                              //       },
                              //       child: Container(
                              //         //margin: const EdgeInsets.only(left: 7),
                              //         width: size.width * 0.05,
                              //         height: size.height * 0.025,
                              //         decoration: BoxDecoration(
                              //             color: Colors.white,
                              //             borderRadius: BorderRadius.circular(2),
                              //             border: Border.all(
                              //                 color: rememberMe
                              //                     ? Colors.blue
                              //                     : Colors.black)),
                              //         child: Center(
                              //             child: rememberMe
                              //                 ? const Icon(
                              //                     Icons.done,
                              //                     size: 15,
                              //                     color: Colors.black,
                              //                   )
                              //                 : Container()),
                              //       ),
                              //     ),
                              //     const SizedBox(
                              //       width: 15,
                              //     ),
                              //   //  const Text('Remember me',style: TextStyle(color: Colors.white),)
                              //   ],
                              // ),
                          
                              
                              InkWell(
                                onTap: () {
                                  
                                },
                                child: const Text(
                                  '',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                                    
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                                    
                          RoundButton(
                              title: 'Login',
                              loading: loading,
                              onTap: () {
                                     if (_formKey.currentState!.validate()) {
                              loginBeautyProducts(
                                emailcontroller.text.toString(),
                                passwordcontroller.text.toString(),
                              );
                            }
                            
                              }),
                                  SizedBox(
                            height: size.height * 0.01,
                          ),
                                    
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Already have an account ?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                  TextButton(onPressed: (){
                                   Navigator.push(context,MaterialPageRoute(builder:(context)=>const RegisterScreen()));
                                
                                  }, child:Text('Register',style: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold),))
                                ],
                              )
                        
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
      );
    
  }
}
