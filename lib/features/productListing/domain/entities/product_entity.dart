import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final String catagory;
  final String imgUlr;

  const Product(
    this.id,
    this.title,
    this.price,
    this.description,
    this.catagory,
    this.imgUlr,
  );

  @override
  List<Object> get props => [id, title, price, description, catagory, imgUlr];
}
