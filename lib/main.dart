import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progshub_practice_project/features/cart/bloc/cart_bloc.dart';
import 'package:progshub_practice_project/home_screen.dart';
import 'features/productListing/data/repositories/product_repository_impl.dart';
import 'package:progshub_practice_project/features/productListing/data/dataSources/product_remote_datasource.dart';
import 'package:progshub_practice_project/features/productListing/domain/usecases/fetch_product_usecase.dart';
import 'package:progshub_practice_project/features/productListing/presentation/bloc/product_bloc.dart';

void main() {
  final productRemoteDatasourceImpl = ProductRemoteDatasourceImpl(dio: Dio());
  final productRepositoryImpl = ProductRepositoryImpl(
    productRemoteDatasource: productRemoteDatasourceImpl,
  );
  final fetchProductUsecase = FetchProductUsecase(productRepositoryImpl);

  runApp(MyApp(fetchProductUsecase: fetchProductUsecase));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.fetchProductUsecase});
  final FetchProductUsecase fetchProductUsecase;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductBloc(fetchProductUsecase)),
        BlocProvider(create: (_) => CartBloc()),
      ],
      child: MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false),
    );
  }
}
