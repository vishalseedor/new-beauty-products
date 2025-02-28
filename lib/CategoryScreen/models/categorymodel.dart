import 'package:flutter/material.dart';
class CategoryModel {
  final String id;
  final String categoryName;
  final String image;

  CategoryModel({required this.id, required this.categoryName, required this.image});

 factory CategoryModel.fromJson(Map<String, dynamic> json) {
  return CategoryModel(
     id:json['id'],
    categoryName:json['category_name'],
    image:json['image'],
  );
   
  }}