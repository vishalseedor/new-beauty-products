class Tipsmodel {
  final String id;

  final String description;
  final String ingredients;

  final String benefits;
  final String usageProduct;
  final String additionalTips;
  final String file;

  final String link;
  final String comments;
  final String creator;

  Tipsmodel({
    required this.id,

    required this.description,
    required this.ingredients,

    required this.benefits,
    required this.usageProduct,
    required this.additionalTips,
    required this.file,

    required this.link,
    required this.comments,
    required this.creator,
  });

  factory Tipsmodel.fromJson(Map<String, dynamic> json) {
    return Tipsmodel(
      id: json['id'],

      description: json['description'],
      ingredients: json['ingredients'],

      benefits: json['benefits'],
      usageProduct: json['usage_product'],
      additionalTips: json['additional_tips'],
      file: json['file'],

      link: json['link'],
      comments: json['comments'],
      creator: json['creator'],
    );
  }
}
