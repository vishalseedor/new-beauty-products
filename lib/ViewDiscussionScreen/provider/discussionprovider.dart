import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:new_diy_beauty_products/ViewDiscussionScreen/model/discussionmodel.dart';
import 'package:new_diy_beauty_products/ViewDiscussionScreen/model/viewreplydiscussionmodel.dart';

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
    List<DiscussViewModel> _viewdis = [];
  List<DiscussViewModel> get viewdis {
    return [..._viewdis];
  }
  String? disccussionId;
  void setCurrentUserId(String userdisId) {
    disccussionId = userdisId;
    notifyListeners();
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
Future<void> getAllDiscussionReplyData({
  required BuildContext context,
  required String discussionId,
  required String userId,
}) async {
  try {
    _isLoading = true;
    notifyListeners();

    // 🔹 Clear previous discussions before fetching new ones
    _viewdis.clear();

    var response = await https.get(
      Uri.parse(
        "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_reply.php?discussion_id=$discussionId&user_id=$userId",
      ),
    );

    print("Fetching URL: http://campus.sicsglobal.co.in/Project/Diy_product/api/view_reply.php?discussion_id=$discussionId&user_id=$userId");
    print("Response: ${response.body}");

    if (response.statusCode == 200) {
      var extractedData = json.decode(response.body);

      final List<dynamic> discussionDetails = extractedData['discussionDetails'];

      for (var i = 0; i < discussionDetails.length; i++) {
        _viewdis.add(
          DiscussViewModel(
            id: discussionDetails[i]['id'].toString(),
            discussionId: discussionDetails[i]['discussion_id'].toString(),
            userId: discussionDetails[i]['user_id'].toString(),
            topics: discussionDetails[i]['topics'].toString(),
            category: discussionDetails[i]['category'].toString(),
            answers: discussionDetails[i]['answers'].toString(),
            adminReply: discussionDetails[i]['admin_reply'].toString(),
            createdAt: discussionDetails[i]['created_at'].toString(),
          ),
        );
      }

      print('Fetched discussion replies: $_viewdis');

      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = false;
      notifyListeners();
      print('Failed to fetch discussions: Status Code ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching discussions: $e');
    _isLoading = false;
    notifyListeners();
  }
}

//  Future getAllDiscussionReplyData({required BuildContext context,required String disccussionId,required String userId}) async {
//     try {
//       _isLoading = true;
//       // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
//       var response = await https.get(
//         Uri.parse(
//             "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_reply.php?discussion_id=$disccussionId&user_id=$userId"),
//       );

//       print(
//           "http://campus.sicsglobal.co.in/Project/Diy_product/api/view_reply.php?discussion_id=$disccussionId&user_id=$userId");

//       print(response.body);

//       if (response.statusCode == 200) {
//         _isLoading = false;
//         _discussions = [];
//         var extractedData = json.decode(response.body);
//         //  print(json.decode(response.body) + 'printed extrated data');
//         final List<dynamic> discussionDetails = extractedData['discussionDetails'];
//         for (var i = 0; i < discussionDetails.length; i++) {
//           _viewdis.add(
//             DiscussViewModel(
//               id : discussionDetails[i]['id'].toString(),
//              discussionId : discussionDetails[i]['discussion_id'].toString(),
//     userId : discussionDetails[i]['user_id'].toString(),
//     topics : discussionDetails[i]['topics'].toString(),
//     category : discussionDetails[i]['category'].toString(),
//     answers : discussionDetails[i]['answers'].toString(),
//     adminReply : discussionDetails[i]['admin_reply'].toString(),
//     createdAt : discussionDetails[i]['created_at'].toString(), 
  
             
             
//             ),
//           );
//         }
//         ;

//         print('pet details' + _discussions.toString());
//         _isLoading = false;
//         print('cateogory products loading completed --->' + 'loading data');
//         notifyListeners();
//       } else {
//         _isLoading = true;
//         notifyListeners();
//       }
//     } on HttpException catch (e) {
//       // ignore: prefer_interpolation_to_compose_strings
//       print('error in product prod -->>' + e.toString());
//       print('Pet Data is one by one loaded the pet' + e.toString());
//       _isLoading = false;

//       _isSelect = false;
//       notifyListeners();
//     }
  
  
 
// }
Future<void> addDiscussion(
      {String? userId,String? discussionId,String? answers,}) async {
    var body = {
      'userid': userId.toString(),
      'discussion_id': discussionId.toString(),
      'answers': answers.toString(),
    };

    try {
      var response = await https.post(
          Uri.parse(
              'http://campus.sicsglobal.co.in/Project/Diy_product/api/add_answer_discussion.php?userid=$userId&discussion_id=$discussionId&answers=$answers'),
          body: body);

      if (response.statusCode == 200) {
        print('http://campus.sicsglobal.co.in/Project/Diy_product/api/add_answer_discussion.php?userid=$userId&discussion_id=$discussionId&answers=$answers');
        // Request successful
        print('Added to cart successfully');
        print('Response: ${response.body}');
      } else {
        // Request failed with error code
        print('Failed to add to cart. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception thrown during request
      print('Failed to add to cart. Exception: $e');
    }
  }
  Future<void> addEnquiry(
      {String? senderId,String? reciverId,String? message}) async {
    var body = {
      'sender_id': senderId.toString(),
      'receiver_id': reciverId.toString(),
      'message': message.toString(),
    };

    try {
      var response = await https.post(
          Uri.parse(
              'http://campus.sicsglobal.co.in/Project/Diy_product/api/enquiries_api.php?sender_id=$senderId&receiver_id=$reciverId&message=$message'),
          body: body);

      if (response.statusCode == 200) {
        print(   'http://campus.sicsglobal.co.in/Project/Diy_product/api/enquiries_api.php?sender_id=$senderId&receiver_id=$reciverId&message=$message');
        // Request successful
        print('Enquire add  successfully');
        print('Response: ${response.body}');
      } else {
        // Request failed with error code
        print('Failed to add to cart. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception thrown during request
      print('Failed to add to cart. Exception: $e');
    }
  }

}




