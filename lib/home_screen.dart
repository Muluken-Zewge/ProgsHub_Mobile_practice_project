import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progshub_practice_project/features/cart/bloc/cart_bloc.dart';
import 'package:progshub_practice_project/features/productListing/presentation/bloc/product_bloc.dart';
import 'package:progshub_practice_project/features/productListing/presentation/widgets/product_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(LoadProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartUpdatedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor:
                  state.cartUpdateType == CartUpdateType.added
                      ? Colors.green
                      : Colors.red,
              content: Text(
                state.cartUpdateType == CartUpdateType.added
                    ? 'Item Added to cart'
                    : 'Item removed from cart',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Go Shopping'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite, color: Colors.red),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_rounded),
            ),
          ],
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [CircularProgressIndicator(), Text('Loading...')],
                ),
              );
            } else if (state is ProductLoadingFailureState) {
              return Center(
                child: Text('Product Loading Failed: ${state.message}'),
              );
            } else if (state is ProductLoadingSuccessState) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ProductCardWidget(product: product);
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
