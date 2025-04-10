part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadingSuccessState extends ProductState {
  final List<Product> products;
  const ProductLoadingSuccessState(this.products);
}

class ProductLoadingFailureState extends ProductState {
  final String message;
  const ProductLoadingFailureState(this.message);
}
