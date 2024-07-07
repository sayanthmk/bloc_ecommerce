import 'package:datapage_bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:datapage_bloc/models/productmodel.dart';

class CartProductDetailPage extends StatelessWidget {
  final Product product;

  const CartProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(product.image, height: 200)),
            const SizedBox(height: 16),
            Text(
              product.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 8),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartUpdated) {
                  final quantity = state.products[product] ?? 0;
                  final totalValue = product.price * quantity;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(DecrementQuantity(product));
                            },
                          ),
                          Text('$quantity'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(IncrementQuantity(product));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Total: \$${totalValue.toStringAsFixed(2)}',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ],
                  );
                } else {
                  return const Text('Product not in cart');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
