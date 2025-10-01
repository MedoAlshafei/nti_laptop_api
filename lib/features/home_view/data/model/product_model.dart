class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;
  final String company;
  final int countInStock;
  final int v;
  final int sales;
  final String status;
  final List<String> images;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.company,
    required this.countInStock,
    required this.v,
    required this.sales,
    required this.status,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      image: json['image'] ?? defaultProductImage(),
      category: json['category'] ?? '',
      company: json['company'] ?? '',
      countInStock: json['countInStock'] ?? 0,
      v: json['__v'] ?? 0,
      sales: json['sales'] ?? 0,
      status: json['status'] ?? '',
      images: (json['images'] as List<dynamic>? ?? [])
          .map((x) => x.toString())
          .toList(),
    );
  }
}

defaultProductImage() => 'https://via.placeholder.com/150';
