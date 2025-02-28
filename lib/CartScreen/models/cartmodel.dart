import 'package:flutter/material.dart';
class CartModel {
  final String cartId;
  final String productId;
  final String image;
  final String productName;
  final String price;
   String quantity;


  CartModel(
      {required this.cartId,
      required this.productId,
      required this.image,
      required this.productName,
      required this.price,
      required this.quantity,
      });

 factory CartModel.fromJson(Map<String, dynamic> json) {
  return CartModel( cartId : json['cart_id'],
    productId : json['product_id'],
    image : json['image'],
    productName : json['product_name'],
    price : json['price'],
    quantity : json['quantity']);
   
    
  }}