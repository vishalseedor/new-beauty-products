import 'package:flutter/material.dart';

class RecipeModel {
  final String id;
  final String category;
  final String ingredients;
  final String instructions;
  final String benefits;
  final String usageProduct;
  final String preparationTime;
  final String difficultyLevel;
  final String storage;
  final String link;
  final String comments;
  final String creator;

  RecipeModel(
      {required this.id,
      required this.category,
      required this.ingredients,
      required this.instructions,
      required this.benefits,
      required this.usageProduct,
      required this.preparationTime,
      required this.difficultyLevel,
      required this.storage,
      required this.link,
      required this.comments,
      required this.creator});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      category: json['category'],
      ingredients: json['ingredients'],
      instructions: json['instructions'],
      benefits: json['benefits'],
      usageProduct: json['usage_product'],
      preparationTime: json['preparation_time'],
      difficultyLevel: json['difficulty_level'],
      storage: json['storage'],
      link: json['link'],
      comments: json['comments'],
      creator: json['creator'],
    );
  }
}
