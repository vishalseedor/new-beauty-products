
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/Colors/colors.dart';



class AllOrdersWidget extends StatefulWidget {
  final String orderid;
  final String creatername;
  final String productname;
  final String orderQuantity;
  final String price;
  final String username;
  final String phone;
  final String image;
 

  const AllOrdersWidget({super.key, required this.orderid, required this.creatername, required this.productname, required this.orderQuantity, required this.price, required this.username, required this.phone,
  required this.image
});

  @override
  State<AllOrdersWidget> createState() => _AllOrdersWidgetState();
}

class _AllOrdersWidgetState extends State<AllOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 140,
          child: InkWell(
            onTap: (){

            },
            child: Card(
              color: Colors.grey[100],
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: double.infinity,
                      width: 120,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:NetworkImage(widget.image),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Creater Name : ${widget.creatername}',
                          
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: appcolor,fontWeight: FontWeight.bold)),
                          
                          Text(
                           'Product : ${widget.productname}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                           Text(
                           'Username: ${widget.username}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                         // const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\₹ : ${widget.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: Colors.brown,fontWeight: FontWeight.bold
                                    ),
                              ),
                            //  Container(
                            //   height: 35,
                            //   width: 100,
                              
                            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.green[100]),
                            //   child: Center(child: Text(widget.username,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)),
                            //  ) 
                            
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}