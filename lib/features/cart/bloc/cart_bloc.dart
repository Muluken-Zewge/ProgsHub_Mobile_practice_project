import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:progshub_practice_project/features/cart/model/cart_model.dart';
import 'package:progshub_practice_project/features/productListing/domain/entities/product_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    final cart = Cart();
    on<AddToCartEvent>((event, emit) {
      cart.cart.add(CartItem(product: event.product, quantity: event.quantity));

      emit(
        CartUpdatedState(
          cart: List.from(cart.cart),
          cartUpdateType: CartUpdateType.added,
        ),
      );
    });
    on<RemoveFromCartEvent>((event, emit) {
      cart.cart.remove(
        CartItem(product: event.product, quantity: event.quantity),
      );
      emit(
        CartUpdatedState(
          cart: List.from(cart.cart),
          cartUpdateType: CartUpdateType.removed,
        ),
      );
      //}
    });
  }
}
