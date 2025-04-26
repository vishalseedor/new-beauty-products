import 'package:flutter/material.dart';
class ProductModel {
  final String id;
  final String productName;
  final String image;
  final String quantity;
  final String price;
  final String creatorName;
  final String createrid;
  final String description;

  ProductModel(
      {required this.id,
      required this.productName,
      required this.image,
      required this.quantity,
      required this.price,
      required this.creatorName,
      required this.createrid,
      required this.description});


factory  ProductModel.fromJson(Map<String, dynamic> json) {
  return ProductModel(  
    id : json['id'],
    productName : json['product_name'],
    image : json['image'],
    quantity : json['quantity'],
    price : json['price'],
    creatorName : json['creator_name'],
    createrid: json['creator_id'],
    description:json['description']
   
    
    );
  
  }}
