// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:new_diy_beauty_products/BottomNavigationBar/bottomnavigationbar.dart';
// import 'package:new_diy_beauty_products/Colors/colors.dart';
// import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;

// class ProfileEditScreen extends StatefulWidget {
//   const ProfileEditScreen({super.key});

//   @override
//   State<ProfileEditScreen> createState() => _ProfileEditScreenState();
// }

// class _ProfileEditScreenState extends State<ProfileEditScreen> {
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController phonecontroller = TextEditingController();
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController addresscontroller = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   @override
//   void initState() {
//     super.initState();
    
//     // Delay to ensure context is available
//     Future.delayed(Duration.zero, () {
//       final user = Provider.of<UserProvider>(context, listen: false);

//       setState(() {
//         namecontroller.text = user.currentUsername?? "ramu";
//         phonecontroller.text = user.currentUserphone?? "8870235645";
//         emailcontroller.text = user.currentUseremail??"ramu@gmail.com";
//         addresscontroller.text = user.currentUseremail ?? "Kollam";
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: appcolor,
//         title: Text(
//           'Edit Profile',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 // Name Field
//                 TextFormField(
//                   controller: namecontroller,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
//                       return 'Only letters allowed';
//                     }
//                     return null;
//                   },
//                   decoration: inputDecoration('Edit the name'),
//                 ),
//                 SizedBox(height: size.height * 0.03),

//                 // Phone Field
//                 TextFormField(
//                   controller: phonecontroller,
//                   keyboardType: TextInputType.phone,
//                     inputFormatters: [
//                           LengthLimitingTextInputFormatter(
//                             10,
//                           ), // Limits input to 10 characters
//                           FilteringTextInputFormatter
//                               .digitsOnly, // Allows only digits
//                         ],
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your phone';
//                     } else if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
//                       return 'Enter a valid 10-digit phone number';
//                     }
//                     return null;
//                   },
//                   decoration: inputDecoration('Edit the phone'),
//                 ),
//                 SizedBox(height: size.height * 0.03),

//                 // Email Field
//                 TextFormField(
//                   controller: emailcontroller,
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$").hasMatch(value)) {
//                       return 'Enter a valid email';
//                     }
//                     return null;
//                   },
//                   decoration: inputDecoration('Edit the email'),
//                 ),
//                 SizedBox(height: size.height * 0.03),

//                 // Address Field
//                 TextFormField(
//                   controller: addresscontroller,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your address';
//                     } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
//                       return 'Only letters allowed';
//                     }
//                     return null;
//                   },
//                   decoration: inputDecoration('Edit the address'),
//                 ),
//                 SizedBox(height: size.height * 0.03),

//                 // Update Button
//                 SizedBox(
//                   height: size.height * 0.06,
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(backgroundColor: appcolor),
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         updateProfileApi();
//                       }
//                     },
//                     child: Text(
//                       'Update',
//                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Function to Create Input Decoration
//   InputDecoration inputDecoration(String hintText) {
//     return InputDecoration(
//       fillColor: Colors.grey[200],
//       filled: true,
//       hintText: hintText,
//       hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
//       border: OutlineInputBorder(
//         borderSide: BorderSide.none,
//         borderRadius: BorderRadius.circular(70),
//       ),
//     );
//   }

//   // API Call Function
//   Future<void> updateProfileApi() async {
//     try {
//       final user = Provider.of<UserProvider>(context, listen: false);
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse('http://campus.sicsglobal.co.in/Project/Diy_product/api/edit_profile.php'),
//       );

//       request.fields.addAll({
//         'name': namecontroller.text.trim(),
//         'phone': phonecontroller.text.trim(),
//         'email': emailcontroller.text.trim(),
//         'password': '123',
//         'address': addresscontroller.text.trim(),
//         'userid': user.currentUserId ?? "1"
//       });

//       http.StreamedResponse response = await request.send();
//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           backgroundColor: appcolor,
//           content: Text(
//             "Profile Updated successfully!",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ));
//         Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
//       } else {
//         print("Error: ${response.reasonPhrase}");
//       }
//     } catch (e) {
//       print("Exception: $e");
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:new_diy_beauty_products/BottomNavigationBar/bottomnavigationbar.dart';
// import 'package:new_diy_beauty_products/Colors/colors.dart';
// import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;

// class ProfileEditScreen extends StatefulWidget {
//   final String id;
//   const ProfileEditScreen({super.key, required this.id});

//   @override
//   State<ProfileEditScreen> createState() => _ProfileEditScreenState();
// }

// class _ProfileEditScreenState extends State<ProfileEditScreen> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
  
//     Provider.of<UserProvider>(context,listen: false).getUsertData(context: context);
//     // Ensure context is available
//     Future.delayed(Duration.zero, () {
//       final user =
//         Provider.of<UserProvider>(context).users.firstWhere((element) => element.id == widget.id);

//       setState(() {
//         nameController.text = user.name;
//         phoneController.text = user.phone;
//         emailController.text =user.email;
//     //    addressController.text = userProvider.currentUseraddress ?? "Kollam";
//       });
//         super.initState();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         backgroundColor: appcolor,
//         title: const Text(
//           'Edit Profile',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 buildTextField('Edit the name', nameController, r'^[a-zA-Z\s]+$', 'Only letters allowed'),
//                 SizedBox(height: size.height * 0.03),
//                 buildTextField(
//                   'Edit the phone',
//                   phoneController,
//                   r'^[0-9]{10}$',
//                   'Enter a valid 10-digit phone number',
//                   keyboardType: TextInputType.phone,
//                   inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
//                 ),
//                 SizedBox(height: size.height * 0.03),
//                 buildTextField('Edit the email', emailController, r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$', 'Enter a valid email', keyboardType: TextInputType.emailAddress),
//                 SizedBox(height: size.height * 0.03),
//                 buildTextField('Edit the address', addressController, r'^[a-zA-Z\s]+$', 'Only letters allowed'),
//                 SizedBox(height: size.height * 0.03),
//                 SizedBox(
//                   height: size.height * 0.06,
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(backgroundColor: appcolor),
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         updateProfileApi();
//                       }
//                     },
//                     child: const Text(
//                       'Update',
//                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper function for text fields
//   Widget buildTextField(String hint, TextEditingController controller, String pattern, String errorMessage, {TextInputType? keyboardType, List<TextInputFormatter>? inputFormatters}) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       inputFormatters: inputFormatters,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter $hint';
//         } else if (!RegExp(pattern).hasMatch(value)) {
//           return errorMessage;
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         fillColor: Colors.grey[200],
//         filled: true,
//         hintText: hint,
//         hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
//         border: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.circular(70),
//         ),
//       ),
//     );
//   }

//   // API Call Function
//   Future<void> updateProfileApi() async {
//     try {
//       final userProvider = Provider.of<UserProvider>(context, listen: false);
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse('http://campus.sicsglobal.co.in/Project/Diy_product/api/edit_profile.php'),
//       );

//       request.fields.addAll({
//         'name': nameController.text.trim(),
//         'phone': phoneController.text.trim(),
//         'email': emailController.text.trim(),
//         'password': '123', // Consider replacing this with an actual password field
//         'address': addressController.text.trim(),
//         'userid': userProvider.currentUserId ?? "1"
//       });

//       http.StreamedResponse response = await request.send();
//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: appcolor,
//             content: const Text(
//               "Profile Updated successfully!",
//               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//         );
//         Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
//       } else {
//         print("Error: ${response.reasonPhrase}");
//       }
//     } catch (e) {
//       print("Exception: $e");
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_diy_beauty_products/BottomNavigationBar/bottomnavigationbar.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ProfileScreen/models/profilemodel.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProfileEditScreen extends StatefulWidget {
  final String id;
  const ProfileEditScreen({super.key, required this.id});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = true; // To track if data is being fetched

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  // Fetch user data properly
  Future<void> fetchUserData() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    
    await userProvider.getUsertData(context: context); // Ensure data is fetched before using it

    final user = userProvider.users.firstWhere(
      (element) => element.id == widget.id,
      orElse: () => UserData(id: '', name: '', phone: '', email: '', password: ''), // Handle missing data gracefully
    );

    if (user.id.isNotEmpty) {
      setState(() {
        nameController.text = user.name;
        phoneController.text = user.phone;
        emailController.text = user.email;
        
      //  addressController.text = user.address; // Make sure `address` is available
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: appcolor,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: size.height * 0.02),
                      buildTextField('Edit the name', nameController, r'^[a-zA-Z\s]+$', 'Only letters allowed'),
                      SizedBox(height: size.height * 0.03),
                       Text('Phone',style: TextStyle(fontWeight: FontWeight.bold),),
                       SizedBox(height: size.height * 0.02),
                      buildTextField(
                        'Edit the phone',
                        phoneController,
                        r'^[0-9]{10}$',
                        'Enter a valid 10-digit phone number',
                        keyboardType: TextInputType.phone,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
                      ),
                      SizedBox(height: size.height * 0.03),
                       Text('Email',style: TextStyle(fontWeight: FontWeight.bold),),
                       SizedBox(height: size.height * 0.02),
                      buildTextField('Edit the email', emailController, r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$', 'Enter a valid email', keyboardType: TextInputType.emailAddress),
                      SizedBox(height: size.height * 0.03),
                    //  buildTextField('Edit the address', addressController, r'^[a-zA-Z\s]+$', 'Only letters allowed'),
                      SizedBox(height: size.height * 0.03),
                      SizedBox(
                        height: size.height * 0.06,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: appcolor),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              updateProfileApi();
                            }
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  // Helper function for text fields
  Widget buildTextField(String hint, TextEditingController controller, String pattern, String errorMessage, {TextInputType? keyboardType, List<TextInputFormatter>? inputFormatters}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hint';
        } else if (!RegExp(pattern).hasMatch(value)) {
          return errorMessage;
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(70),
        ),
      ),
    );
  }

  // API Call Function
  Future<void> updateProfileApi() async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://campus.sicsglobal.co.in/Project/Diy_product/api/edit_profile.php'),
      );

      request.fields.addAll({
        'name': nameController.text.trim(),
        'phone': phoneController.text.trim(),
        'email': emailController.text.trim(),
        'password': '123', // Consider replacing this with an actual password field
        'address': addressController.text.trim(),
        'userid': userProvider.currentUserId ?? "1"
      });

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: appcolor,
            content: const Text(
              "Profile Updated successfully!",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        print("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }
}
