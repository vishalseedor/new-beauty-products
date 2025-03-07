import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';


class TermsandConditions extends StatefulWidget {
  const TermsandConditions({super.key});

  @override
  State<TermsandConditions> createState() => _TermsandConditionsState();
}

class _TermsandConditionsState extends State<TermsandConditions> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: appcolor,
        title: const Text('Terms & Conditions',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('1 . General Use :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
              const Text('By using our app, you agree to our terms and policies designed to ensure a seamless beauty experience.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
              SizedBox(height: size.height*0.02),
                const Text('2 .Product Usage Disclaimer :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Our beauty products are formulated with care, but individual results may vary. Always conduct a patch test before full application.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
               SizedBox(height: size.height*0.02),
              const Text('3 .Payments & Refunds :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                const Text('All transactions are secure, and refunds or exchanges are subject to our return policy',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                SizedBox(height: size.height*0.02),
                 const Text('4 .Privacy & Data Protection :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Your personal data is safe with us and will only be used to enhance your shopping experience.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                    SizedBox(height: size.height*0.02),
                 const Text('5 .Liability Limitation :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('We are not responsible for any allergic reactions or adverse effects. Please read ingredient labels carefully.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                     SizedBox(height: size.height*0.02),
                 const Text('7 .Cancellation Policy:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text(' Vendors should adhere to any cancellation policies outlined by the market, including notifying organizers in advance if they are unable to attend..',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
            
            ]
            ,
          ),
        ),
      ),
    );
  }
}