part of 'cart_bloc.dart';

enum CartUpdateType { added, removed }

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class CartUpdatedState extends CartState {
  final List<CartItem> cart;
  final CartUpdateType cartUpdateType;

  const CartUpdatedState({required this.cart, required this.cartUpdateType});

  @override
  List<Object> get props => [cart, cartUpdateType];
}
