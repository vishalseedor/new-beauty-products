class DiscussViewModel {
 final String id;
 final String discussionId;
final  String userId;
 final String topics;
  final String category;
final  String answers;
 final String adminReply;
 final String createdAt;

  DiscussViewModel(
      {required this.id,
      required this.discussionId,
      required this.userId,
      required this.topics,
      required this.category,
      required this.answers,
      required this.adminReply,
      required this.createdAt});

factory  DiscussViewModel.fromJson(Map<String, dynamic> json) {
  return DiscussViewModel( id : json['id'],
    discussionId : json['discussion_id'],
    userId : json['user_id'],
    topics : json['topics'],
    category : json['category'],
    answers : json['answers'],
    adminReply : json['admin_reply'],
    createdAt : json['created_at']);
   
  }
}