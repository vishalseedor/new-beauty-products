
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ReciepeScreen/provider/reciepeprovider.dart';
import 'package:new_diy_beauty_products/TipsScreen/api/tipsprovider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Tipsdetailsscreen extends StatefulWidget {
  static const routeName = 'tips_details_screen';
  final String id;
  const Tipsdetailsscreen({super.key,required this.id});

  @override
  State<Tipsdetailsscreen> createState() => _TipsdetailsscreenState();
}

class _TipsdetailsscreenState extends State<Tipsdetailsscreen> {
   void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
       final tipsData =
        Provider.of<Tipsprovider>(context).tips.firstWhere((element) => element.id== widget.id);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appcolor,
        title: Text('Receipe Details Screen',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),

      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('1. Category :',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            // Text(tipsData.category),
            SizedBox(height: size.height*0.02,),
            Text('1. Incridents',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(tipsData.ingredients),
            SizedBox(height: size.height*0.02,),
            // Text('3. Instructions',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            // Text(tipsData.instructions),
           // SizedBox(height: size.height*0.02,),
            Text('2. Benifits',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(tipsData.benefits),
            SizedBox(height: size.height*0.02,),
            Text('3. Usage product',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(tipsData.usageProduct),
            SizedBox(height: size.height*0.02,),
            Text('4. Prepartion Time',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            // Text(tipsData.preparationTime),
            // SizedBox(height: size.height*0.02,),
            // Text('7. Diffculity Level',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            // Text(tipsData.difficultyLevel),
            // SizedBox(height: size.height*0.02,),
            // Text('8. Storage',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            // Text(tipsData.storage),
            SizedBox(height: size.height*0.02,),
          Text('5. YouTube Link',
                  style: TextStyle(
                      color: appcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
              GestureDetector(
                onTap: () => _launchURL(tipsData.link),
                child: Text(
                  tipsData.link,
                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            SizedBox(height: size.height*0.02,),
            Text('6. Creator',style: TextStyle(color: appcolor,fontWeight: FontWeight.bold,fontSize: 14),),
            Text(tipsData.creator)
        
        
        
          ],
        ),
        ),
      ),
      
    );
  }
}