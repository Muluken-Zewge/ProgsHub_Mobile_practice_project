import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:progshub_practice_project/features/productListing/domain/entities/product_entity.dart';
import 'package:progshub_practice_project/features/productListing/domain/usecases/fetch_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchProductUsecase fetchProductUsecase;
  ProductBloc(this.fetchProductUsecase) : super(ProductInitial()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final products = await fetchProductUsecase();
        emit(ProductLoadingSuccessState(products));
      } catch (e) {
        emit(ProductLoadingFailureState(e.toString()));
      }
    });
  }
}
