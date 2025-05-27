import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progshub_practice_project/features/cart/bloc/cart_bloc.dart';
import 'package:progshub_practice_project/features/cart/model/cart_model.dart';
import 'package:progshub_practice_project/features/productListing/domain/entities/product_entity.dart';
import 'package:progshub_practice_project/features/productListing/presentation/Screens/product_detail_screen.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  height: 100,
                  width: 100,
                  product.imgUlr,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.category, color: Colors.red),
                            SizedBox(width: 5),
                            Text(
                              product.catagory,
                              style: TextStyle(color: Colors.red[200]),
                            ),
                          ],
                        ),
                        Text(
                          '${product.price} USD',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border),
                        ),
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            final cart =
                                (state is CartUpdatedState) ? state.cart : [];

                            final isInCart = cart.any(
                              (item) => item.product.id == product.id,
                            );
                            return IconButton(
                              onPressed:
                                  isInCart
                                      ? () {
                                        context.read<CartBloc>().add(
                                          RemoveFromCartEvent(
                                            product: product,
                                            quantity: 1,
                                          ),
                                        );
                                      }
                                      : () {
                                        context.read<CartBloc>().add(
                                          AddToCartEvent(
                                            product: product,
                                            quantity: 1,
                                          ),
                                        );
                                      },
                              icon: Icon(
                                isInCart
                                    ? Icons.shopping_cart
                                    : Icons.shopping_cart_outlined,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
