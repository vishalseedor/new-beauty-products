import 'package:flutter/material.dart';
class DiscussionModel {
  final String id;
  final String topics;
  final String category;
  final String createdAt;

  DiscussionModel({required this.id, required this.topics, required this.category, required this.createdAt});

factory  DiscussionModel.fromJson(Map<String, dynamic> json) {
  return DiscussionModel(
     id:json['id'],
    topics:json['topics'],
    category:json['category'],
    createdAt:json['created_at'],
  );
   
    }}