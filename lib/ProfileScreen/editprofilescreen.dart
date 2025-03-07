import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/BottomNavigationBar/bottomnavigationbar.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController addresscontroller=TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appcolor,
        title: Text('Edit Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if(namecontroller.text.isEmpty){
                    return 'Please enter your name';
                  }
                  else{
                    return null;
                  }
                },
                controller: namecontroller,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Edit the name',
                  hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                  border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(70)
          
                )),
                
              ),SizedBox(height: size.height*0.03),
                TextFormField(
                  validator: (value) {
                  if(phonecontroller.text.isEmpty){
                    return 'Please enter your phone';
                  }
                  else{
                    return null;
                  }
                },
                  controller: phonecontroller,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],  hintText: 'Edit the phone',
                  hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                  filled: true,
                  border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(70)
          
                )),
                
              ),SizedBox(height: size.height*0.03),
                TextFormField(
                  validator: (value) {
                  if(emailcontroller.text.isEmpty){
                    return 'Please enter your email';
                  }
                  else{
                    return null;
                  }
                },
                  controller: emailcontroller,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],  hintText: 'Edit the email',
                  hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                  filled: true,
                  border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(70)
          
                )),
                
              ),SizedBox(height: size.height*0.03),
                TextFormField(
                  validator: (value) {
                  if(addresscontroller.text.isEmpty){
                    return 'Please enter your address';
                  }
                  else{
                    return null;
                  }
                },
                  controller: addresscontroller,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],  hintText: 'Edit the address',
                  hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                  filled: true,
                  border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(70)
          
                )),
                
              ),SizedBox(height: size.height*0.03),
                SizedBox(
                  height:size.height*0.06,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: appcolor),
                    onPressed: (){
                    if(_formKey.currentState!.validate()){
                    updateProfileApi();

                    }

                    }, child: Text('Update',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                )
            
          
            ],
          ),
        ),
      ),
    );
  }
  Future<dynamic> updateProfileApi() async {
    try {
      final user = Provider.of<UserProvider>(context, listen: false);
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://campus.sicsglobal.co.in/Project/Diy_product/api/edit_profile.php'),
      );
      print(
          'http://campus.sicsglobal.co.in/Project/Diy_product/api/edit_profile.php');
      request.fields.addAll({
        'name': namecontroller.text.trim(),
        'phone': phonecontroller.text.trim(),
        'email': emailcontroller.text.trim(),
        'password': '123',
        'address': addresscontroller.text.trim(),
        'userid': user.currentUserId ?? "1"
      });
        
      http.StreamedResponse response = await request.send();

      print(await response.stream.bytesToString());
      print(""" 'name': ${namecontroller.text.trim()},
        'phone': ${phonecontroller.text.trim()},
        'email': ${emailcontroller.text.trim},
        'password': '123',
        'address': ${addresscontroller.text.trim()},
        'userid': ${user.currentUserId}?? "1" """);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor:appcolor,
                                  content: const Text("Profile Updated successfully...!",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HomePage()));

        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
}


