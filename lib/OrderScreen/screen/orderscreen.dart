
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/OrderScreen/provider/orderprovider.dart';
import 'package:new_diy_beauty_products/OrderScreen/screen/emptyorderscreen.dart';
import 'package:new_diy_beauty_products/OrderScreen/widget/orderwidget.dart';
import 'package:new_diy_beauty_products/ProfileScreen/provider/userprovider.dart';


import 'package:provider/provider.dart';
import '../../../ExtraScreens/loadingscreen.dart';

class MyOrdersScreen extends StatefulWidget { 
    static const routeName = 'all_orders_screen';
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
    @override
  void initState() {
     final userProvider = Provider.of<UserProvider>(context, listen: false);
    Provider.of<Orderprovider>(context, listen: false)
        .getAllOrdersData(context: context, userid: userProvider.currentUserId);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final order=Provider.of<Orderprovider>(context);
    return Scaffold(
        appBar: AppBar(
        
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        // ignore: prefer_const_constructors
        },icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: appcolor,
        title: const Text('My Orders',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),
    body:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: size.height*0.01),
     Text('My Orders Nears You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(height: size.height*0.02),
       
               FadeInUp(
                duration: const Duration(milliseconds: 1500),
                 child: order.loadingSpinner
                              ? const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LoadingScreen(title: 'Loading'),
                                    CircularProgressIndicator(
                                      color:Colors.green,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                 
                                  ],
                                )
                              : order.orders.isEmpty
                                  ? Emptyorderscreen()
                                  : SizedBox(
                                      //height: size.height * 0.6,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                        itemCount: order.orders.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                     
                        itemBuilder: (context, index) {
                          return AllOrdersWidget(
                           orderid: order.orders[index].id,
                           price: order.orders[index].productPrice,
                           creatername: order.orders[index].creatorName,
                           orderQuantity: order.orders[index].orderQuantity,
                           phone: order.orders[index].userPhone,
                           productname: order.orders[index].productName,
                           username: order.orders[index].userName,
                           image: order.orders[index].image,
                          
                           
                 
                           
                         
                          
                            );
                        },
                      )
                                    ),
               ),
            
          ],
        ),
      ),
    ),  
    );
  }
}