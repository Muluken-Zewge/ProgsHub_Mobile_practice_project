import 'package:progshub_practice_project/features/productListing/domain/entities/product_entity.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.catagory,
    required super.imgUlr,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] is int ? json['id'] as int : 0,
      title: json['title'] is String ? json["title"] as String : 'No title',
      price: json['price'] is num ? (json['price'] as num).toDouble() : 0.0,
      description:
          json['description'] is String
              ? json['description'] as String
              : 'No description',
      catagory:
          json['category'] is String
              ? json['category'] as String
              : 'Uncatagorized',
      imgUlr:
          json['image'] is String
              ? json['image'] as String
              : 'https://previews.123rf.com/images/dolphfyn/dolphfyn1804/dolphfyn180400032/99608962-creative-product-word-cut-from-paper-isolated-on-white-background.jpg',
    );
  }

  Product toEntity() {
    return Product(
      id: id,
      title: title,
      price: price,
      description: description,
      catagory: catagory,
      imgUlr: imgUlr,
    );
  }
}
