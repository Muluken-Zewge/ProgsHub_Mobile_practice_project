part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  final Product product;
  final int quantity;
  const AddToCartEvent({required this.product, required this.quantity});
}

class RemoveFromCartEvent extends CartEvent {
  final Product product;
  final int quantity;
  const RemoveFromCartEvent({required this.product, required this.quantity});
}
