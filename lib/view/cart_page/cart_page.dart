import 'package:datapage_bloc/cart_bloc/cart_bloc.dart';
import 'package:datapage_bloc/view/cart_page/cartdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitial) {
            return const Center(child: Text('Cart is empty'));
          } else if (state is CartUpdated) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products.keys.elementAt(index);
                final quantity = state.products[product];
                return ListTile(
                  leading: Image.network(product.image, width: 50, height: 50),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price} x $quantity'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CartProductDetailPage(product: product),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
