class CardModel {
  final String id;
  final String status;
  final String category;
  final num price;
  final String name;
  final String description;
  final String image;
  final List<String> images;
  final String company;
  final int countInStock;
  final int sales;
  final List quantity;
  final num totalPrice;

  CardModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.company,
    required this.countInStock,
    required this.sales,
    required this.status,
    required this.images,
    required this.quantity,
    required this.totalPrice,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['_id'] ?? "",
      status: json['status'] ?? '',
      category: json['category'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      images: List<String>.from(json['images'] ?? ''),
      company: json['company'] ?? '',
      countInStock: json['countInStock'] ?? '',
      sales: json['sales'] ?? '',
      quantity: json['quantity'] ?? '',
      totalPrice: json['totalPrice'] ?? '',
    );
  }
}
