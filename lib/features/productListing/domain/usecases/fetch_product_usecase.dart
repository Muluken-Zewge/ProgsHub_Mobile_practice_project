import 'package:progshub_practice_project/features/productListing/domain/entities/product_entity.dart';
import 'package:progshub_practice_project/features/productListing/domain/repositories/product_repository.dart';

class FetchProduct {
  final ProductRepository productRepository;
  FetchProduct(this.productRepository);

  Future<List<Product>> call() async {
    return await productRepository.fetchProduct();
  }
}
