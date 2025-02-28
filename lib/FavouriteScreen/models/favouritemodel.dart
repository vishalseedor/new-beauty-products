import 'package:flutter/material.dart';

class FavouriteModel{
  final String id;
  final String productName;
  final String image;
  final String quantity;
  final String price;
  final String creatorName;

  FavouriteModel(
      {required this.id,
      required this.productName,
      required this.image,
      required this.quantity,
      required this.price,
      required this.creatorName});

factory  FavouriteModel.fromJson(Map<String, dynamic> json) {
  return FavouriteModel( id : json['id'],
    productName : json['product_name'],
    image : json['image'],
    quantity : json['quantity'],
    price : json['price'],
    creatorName : json['creator_name']);
   
  }}