import 'package:progshub_practice_project/features/productListing/data/dataSources/product_remote_datasource.dart';
import 'package:progshub_practice_project/features/productListing/domain/entities/product_entity.dart';
import 'package:progshub_practice_project/features/productListing/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource productRemoteDatasource;
  ProductRepositoryImpl({required this.productRemoteDatasource});
  @override
  Future<List<Product>> fetchProduct() async {
    final productModels = await productRemoteDatasource.fetchProduct();
    final productEntities =
        productModels.map((model) => model.toEntity()).toList();
    return productEntities;
  }
}
