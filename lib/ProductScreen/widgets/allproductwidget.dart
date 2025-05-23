
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';
import 'package:new_diy_beauty_products/ProductScreen/productdetailsscreen.dart';

class AllProductWidget extends StatefulWidget {
  final String id;
  final String productname;
  final String price;
  final String image;
  final String creatername;
  const AllProductWidget({super.key,required this.id,required this.productname,required this.price,required this.image, required this.creatername});

  @override
  State<AllProductWidget> createState() => _AllProductWidgetState();
}

class _AllProductWidgetState extends State<AllProductWidget> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
     
          Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,arguments:widget.id);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        elevation:3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(                                               
              height: 160,
              alignment: Alignment.topRight,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),   
              ),
             
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productname,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold,fontSize: 14),
                  ), 
                  
                  Text('Prize : ₹ ${widget.price}',style: TextStyle(color: appcolor),),
                   Text('Creater Name : ${widget.creatername}',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                  // SizedBox(height: size.height*0.01),
                  // Text(widget.area)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}