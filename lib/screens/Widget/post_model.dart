import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

class Post {
  Post({
    required this.pro_name,
    required this.id,
    required this.pro_details,
    required this.pro_price,
    required this.pro_pic,
  });

  String pro_details;
  String id;
  String pro_pic;
  String pro_price;
  String pro_name;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    pro_details: json["pro_details"],
    id: json["id"],
    pro_pic: json["pro_pic"],
    pro_price: json["pro_price"],
    pro_name: json["pro_name"]);
}
