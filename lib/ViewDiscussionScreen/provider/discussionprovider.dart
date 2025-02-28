import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:new_diy_beauty_products/ViewDiscussionScreen/model/discussionmodel.dart';

class Discussionprovider with ChangeNotifier {
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }

  List<DiscussionModel> _discussions = [];
  List<DiscussionModel> get discussions {
    return [..._discussions];
  }

  Future getAllDiscussionData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_discussion.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_discussion.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _discussions = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> discussionDetails = extractedData['categoryDetails'];
        for (var i = 0; i < discussionDetails.length; i++) {
          _discussions.add(
            DiscussionModel(
              id:discussionDetails[i]['id'].toString(),
              topics: discussionDetails[i]['topics'].toString(),
              category: discussionDetails[i]['category'].toString(),
              createdAt: discussionDetails[i]['created_at'].toString()
             
             
            ),
          );
        }
        ;

        print('pet details' + _discussions.toString());
        _isLoading = false;
        print('cateogory products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Pet Data is one by one loaded the pet' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  
  
 
}

Future<void>addDiscussion({String? userId, String? answers,String? discussionId}) async {
    String apiUrl = 'http://campus.sicsglobal.co.in/Project/Diy_product/api/add_answer_discussion.php?userid=$userId&discussion_id=$discussionId&answers=$answers';
    var response = await https.post(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      
      // Handle success
      print('Feedback added successfully');
    } else {
      // Handle errors
      print('Failed to add feedback. Error: ${response.statusCode}');
    }
  }}

