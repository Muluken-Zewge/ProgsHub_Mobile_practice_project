import 'package:equatable/equatable.dart';
import 'package:progshub_practice_project/features/productListing/domain/entities/product_entity.dart';

class CartItem extends Equatable {
  final Product product;
  final int quantity;
  const CartItem({required this.product, required this.quantity});

  @override
  List<Object> get props => [product.id];
}

class Cart {
  List<CartItem> cart = [];
}
