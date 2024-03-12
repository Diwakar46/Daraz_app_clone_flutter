// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item {
  int id;
  String title;
  int price;
  String descripiton;
  String category;
  String image;
  int rating;
  int rate;
  Item({
    required this.id,
    required this.title,
    required this.price,
    required this.descripiton,
    required this.category,
    required this.image,
    required this.rating,
    required this.rate,
  });
  factory Item.fromJson(Map<dynamic, dynamic> json) {
    return Item(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        descripiton: json['descripiton'],
        category: json['category'],
        image: json['image'],
        rating: json['rating'],
        rate: json['rate']);
  }
}


