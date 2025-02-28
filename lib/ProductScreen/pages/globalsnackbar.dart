
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/CartScreen/pages/cartscreen.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';



class GlobalSnackBar {
  customSnackbar({
    required BuildContext context,
  }) {
    return SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 70,
            child: Row(
              children: [
                const Text(
                  '1 Item added cart ',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
             
              ],
            ),
          
          ),
          InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  CartScreen()));
              },
            

              child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                      color:appcolor),
                  child:  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/sk.png',height: 20,width: 20,),
                        // Icon(
                        //   Icons.shopping_bag_rounded,
                        //   color: Colors.white,
                        // ),
                        Text('VIEW CART',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )))
        ],
      ),
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      // action: SnackBarAction(
      //   textColor: CustomColor.whitecolor,
      //   label: 'View cart',
      //   onPressed: () {},
      // ),
    );
  }

  generalSnackbar({required BuildContext context, required String text}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        height: 40,
        child: Center(
          child: Text(text),
        ),
      ),

      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: appcolor,
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      // action: SnackBarAction(
      //   textColor: CustomColor.whitecolor,
      //   label: 'View cart',
      //   onPressed: () {},
      // ),
    ));
  }

  successsnackbar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        height: 40,
        child: Center(
          child: Text(text),
        ),
      ),

      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: appcolor,
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'View cart',
        onPressed: () {},
      ),
    ));
  }
}
 