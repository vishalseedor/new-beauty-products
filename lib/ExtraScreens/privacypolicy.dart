import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';

class PrivacyandPolicy extends StatefulWidget {
  const PrivacyandPolicy({super.key});

  @override
  State<PrivacyandPolicy> createState() => _PrivacyandPolicyState();
}

class _PrivacyandPolicyState extends State<PrivacyandPolicy> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: appcolor,
        title: const Text('Privacy and Policy',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
        
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        
          children: [
            Text('Privacy Policy for Diy Beauty Products and Tips !',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0),),
            SizedBox(height: size.height*0.02),
            Text('At Diy Beauty products and Tips, we are committed to protecting your privacy and ensuring the security of your personal information. When you use our beauty products application, we may collect details such as your name, email, phone number, address, payment information, and purchase history to enhance your shopping experience. Additionally, we may gather device and usage data to improve our services and provide personalized beauty recommendations. Your information is securely stored, and we do not sell or share it with third parties except for essential services like payment processing and order delivery. You have the right to update or delete your data, manage cookie preferences, and opt out of marketing communications at any time. By using our app, you agree to our privacy practices, which may be updated periodically. If you have any concerns or questions, please contact us at www.beautyproducts@gmail.com.')
            
          ],
        ),
      ),
    );
  }
}