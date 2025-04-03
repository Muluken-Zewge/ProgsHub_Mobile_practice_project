import 'package:dio/dio.dart';
import 'package:progshub_practice_project/core/utils/app_url.dart';
import 'package:progshub_practice_project/features/productListing/data/models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> fetchProduct();
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final Dio dio;
  ProductRemoteDatasourceImpl({required this.dio});
  @override
  Future<List<ProductModel>> fetchProduct() async {
    try {
      final response = await dio.get(AppUrl.baseUrl);
      if (response.statusCode == 200) {
        final List productJson = response.data;
        final products =
            productJson.map((json) => ProductModel.fromJson(json)).toList();
        return products;
      } else {
        throw Exception(
          'Failed to fetch product with status code ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('An error occurred while fetching product');
    }
  }
}
