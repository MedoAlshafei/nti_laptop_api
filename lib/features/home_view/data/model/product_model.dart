class Product {
  final String id;
  final String status;
  final String category;
  final String name;
  final double price;
  final String description;
  final String image;
  final List<String> images;
  final String company;
  final int countInStock;
  final int v;
  final int sales;

  Product({
    required this.id,
    required this.status,
    required this.category,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.images,
    required this.company,
    required this.countInStock,
    required this.v,
    required this.sales,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    status: json["status"],
    category: json["category"],
    name: json["name"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    image: json["image"],
    images: List<String>.from(json["images"].map((x) => x)),
    company: json["company"],
    countInStock: json["countInStock"],
    v: json["__v"],
    sales: json["sales"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "status": status,
    "category": category,
    "name": name,
    "price": price,
    "description": description,
    "image": image,
    "images": List<dynamic>.from(images.map((x) => x)),
    "company": company,
    "countInStock": countInStock,
    "__v": v,
    "sales": sales,
  };
}
