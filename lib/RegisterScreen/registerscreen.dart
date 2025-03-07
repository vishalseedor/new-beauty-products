import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as https;
import 'package:image_picker/image_picker.dart';
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
   bool _passwordVisible = false;
  Future<void> registerBeautyProducts(
    File? imageFile,
    String name,
    String phone,
    String email,
    String password,
    String address,
  ) async {
    const url =
        'http://campus.sicsglobal.co.in/Project/Diy_product/api/user_registration.php';
          try {
    var request = https.MultipartRequest('POST', Uri.parse(url));

    // Attach the image file if selected
    if (imageFile != null) {
      request.files.add(await https.MultipartFile.fromPath('image', imageFile.path));
    }

    // Add other form fields
    request.fields.addAll({
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'address': address,
    });

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    var jsonData = json.decode(responseBody);

      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registation Successful!'),
          duration: const Duration(seconds: 4),
         ));
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
          // print(body);
          // print("Response body${response.body}");
          // print(body);
          // print("Response body${response.body}");
          print('Registration successful');
        } else if (jsonData['status'] == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User Already Exsists!'),
          duration: const Duration(seconds: 4),
         ));
         
          print('Error: ${response.statusCode}');
        } else {
          print('Not working this api');
        }
      }
    } catch (error) {
      print('Error: $error');
    }
  }

    // Map<String, String> body = {
    //   'name': name,
    //   'phone': phone,
    //   'email': email,
    //   'password': password,
    //   'address': address,
    // };

  //   try {
  //     final response = await http.post(Uri.parse(url), body: body);
  //     var jsonData = json.decode(response.body);

  //     if (response.statusCode == 200) {
  //       if (jsonData['status'] == true) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             backgroundColor: appcolor,
  //             content: const Text(
  //               'Register Successful!',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             duration: const Duration(seconds: 4),
  //           ),
  //         );
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => const LoginScreen()),
  //         );
  //         print(body);
  //         print("Response body${response.body}");

  //         print('Registration successful');
  //       } else {
  //         jsonData['status'] == false;
  //         // ignore: use_build_context_synchronously
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             backgroundColor: appcolor,
  //             content: const Text(
  //               'User Already Exists !',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             duration: const Duration(seconds: 4),
  //           ),
  //         );
  //         print('Error: ${response.statusCode}');
  //       }
  //     } else {
  //       print('fffff');
  //     }
  //   } catch (error) {
  //     print('Error: $error');
  //   }
  // }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passswordcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
   XFile? file;
    String? base64Image;
  final ImagePicker _picker = ImagePicker();
   Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        file = pickedFile;
      });

      // Convert image to base64
      File imageFile = File(pickedFile.path);
      List<int> imageBytes = await imageFile.readAsBytes();
    base64Image = base64Encode(imageBytes);
    }
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/reg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.03),
                      const Center(
                        child: Text(
                          'Create an Account',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Center(
                        child: Stack(children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: file != null ? FileImage(File(file!.path)) : null,
                child: file == null ? const Icon(Icons.camera_alt, size: 50, color: Colors.black) : null,
                          ),
                          Positioned(
                              right: 5,
                              bottom: 0,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (builder) => bottomSheet());
                                },
                                child: Container(
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    padding: const EdgeInsets.all(7.5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(90.0),
                                        color: Colors.grey[200])),
                              ))
                        ]),
                      ), SizedBox(height: size.height * 0.02),
                   
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: namecontroller,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          // FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]+$')), // Allows only letters and spaces
                        ],
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(color: Colors.white),
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ),
                          hintText: 'Name',
                          hintStyle: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          } else if (!RegExp(
                            r'^[a-zA-Z\s]+$',
                          ).hasMatch(value)) {
                            return 'Only Characters are allowed';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      
                     
                      TextFormField(
                        controller: phonecontroller,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.mobile_screen_share_outlined,
                            color: Colors.white,
                          ),
                          hintText: 'Phone',
                          hintStyle: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(
                            10,
                          ), // Limits input to 10 characters
                          FilteringTextInputFormatter
                              .digitsOnly, // Allows only digits
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone';
                          } else if (value.length != 10) {
                            return 'Phone number must be 10 digits';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: size.height * 0.03),
                    
                      
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(color: Colors.white),
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          // Email validation using RegExp
                          else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          ).hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                   
                    TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: passswordcontroller,
      obscureText: !_passwordVisible, // This correctly hides or shows the password
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.white),
        fillColor: Colors.white.withOpacity(0.3),
        filled: true,
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: Colors.white,
        ),
        hintText: 'Password',
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(70),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility_off : Icons.visibility, // Correct toggle
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible; // Toggle password visibility
            });
          },
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    ),
                     
                      SizedBox(height: size.height * 0.03),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: addresscontroller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          // hintText: 'Enter Phone Number/Email ID/BN User Id',
                          hintText: 'Address',
                          hintStyle: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your address';
                          } else {
                            return null;
                          }
                        },
                      ),

                      SizedBox(height: size.height * 0.04),

                      RoundButton(
                        title: 'Register',
                        loading: loading,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            registerBeautyProducts(
                               File(file!.path),
                              namecontroller.text.toString(),
                              phonecontroller.text.toString(),
                              emailcontroller.text.toString(),
                              passswordcontroller.text.toString(),
                              addresscontroller.text.toString(),
                            );
                          }
                        },
                      ),
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
    Widget bottomSheet() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              "Choose Profile photo",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    pickImage(ImageSource.camera);
                  },
                  icon: Icon(
                    Icons.camera,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Camera",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: appcolor),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                  pickImage(ImageSource.gallery);
                  },
                  icon: Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Gallery",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: appcolor),
                ),
              ],
            )
          ],
        ));
  }
}

