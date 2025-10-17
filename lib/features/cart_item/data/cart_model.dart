class CardModel {
  final String id;
  final String name;
  final String description;
  final num price;
  final String image;
  final String category;
  final String company;
  final List quantity;
  final int countInStock;
  final int sales;
  final String status;
  final List<String> images;

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
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['_id'] ?? "",
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      company: json['company'] ?? '',
      countInStock: json['countInStock'] ?? '',
      sales: json['sales'] ?? '',
      status: json['status'] ?? '',
      images: List<String>.from(json['images'] ?? ''),
      quantity: json['quantity'] ?? '',
    );
  }
}
