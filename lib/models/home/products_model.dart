class ProductModel {
  final String id;
  final String imageUrl;
  final String name;
  final String price;
  final String detail;
  final String category;

  ProductModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.detail,
    required this.category,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      imageUrl: map['image'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      detail: map['detail'] ?? '',
      category: map['category'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': imageUrl,
      'name': name,
      'price': price,
      'detail': detail,
      'category': category,
    };
  }
}

