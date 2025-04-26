class Ordermodel {
  final String id;
  final String creatorName;
  final String productName;
  final String orderQuantity;
  final String productPrice;
  final String userName;
  final String userPhone;
  final String image;

  Ordermodel(
      {required this.id,
      required this.creatorName,
      required this.productName,
      required this.orderQuantity,
      required this.productPrice,
      required this.userName,
      required this.userPhone,
      required this.image
      });

 factory Ordermodel.fromJson(Map<String, dynamic> json) {
  return Ordermodel(
      id : json['id'],
    creatorName : json['creator_name'],
    productName : json['product_name'],
    orderQuantity : json['order_quantity'],
    productPrice : json['product_price'],
    userName : json['user_name'],
    userPhone : json['user_phone'],
    image: json['image']
  );
  
  }
}
