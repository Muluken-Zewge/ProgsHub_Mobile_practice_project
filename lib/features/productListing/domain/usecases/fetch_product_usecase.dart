import 'package:progshub_practice_project/features/productListing/domain/entities/product_entity.dart';
import 'package:progshub_practice_project/features/productListing/domain/repositories/product_repository.dart';

class FetchProductUsecase {
  final ProductRepository productRepository;
  FetchProductUsecase(this.productRepository);

  Future<List<Product>> call() async {
    return await productRepository.fetchProduct();
  }
}
