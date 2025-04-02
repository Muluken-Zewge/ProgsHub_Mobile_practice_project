import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final String catagory;
  final String imgUlr;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.catagory,
    required this.imgUlr,
  });

  @override
  List<Object> get props => [id, title, price, description, catagory, imgUlr];
}
