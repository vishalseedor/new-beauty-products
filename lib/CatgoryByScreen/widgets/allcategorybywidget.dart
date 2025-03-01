
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/ProductScreen/productdetailsscreen.dart';



class AllEachCategoryWidget extends StatefulWidget {
  final String categoryid;
  final String productname;
  final String image;
  

  const AllEachCategoryWidget(
      {super.key,
     required this.categoryid,
     required this.productname,
     required this.image
      });

  @override
  State<AllEachCategoryWidget > createState() => _AllEachCategoryWidgetState();
}

class _AllEachCategoryWidgetState extends State<AllEachCategoryWidget > {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final pet = Provider.of<PetModel>(context);

       return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
       child: AspectRatio(
        aspectRatio: 2 / 2.2,
        child: GestureDetector(
          onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,arguments:widget.categoryid);
          },
          child: Material(
            child: Container(
             
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ]
                  )
                ),
                child: 
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(widget.productname, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),)
                ),
              ),
            ),
          ),
        ),
           ),
     );
  }
}
