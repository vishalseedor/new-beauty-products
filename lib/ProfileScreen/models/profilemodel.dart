import 'package:flutter/material.dart';

class UserData {
 final String id;
 final String name;
 final String phone;
 final String email;
 final String password;
 final String image;


  UserData(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.image,
   
      
      });

 factory UserData.fromJson(Map<String, dynamic> json) {
  return UserData(
    id: json['id'], 
    name:json['name'],
     phone: json['phone'], 
     email: json['email'],
      password: json['password'],
        image: json['image'],
);
  }
}