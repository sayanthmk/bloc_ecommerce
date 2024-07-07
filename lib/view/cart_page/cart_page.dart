import 'package:datapage_bloc/api/cart_api.dart';
import 'package:datapage_bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
      ),
      body: BlocProvider(
        create: (context) =>
            CartBloc(apiService: CartApiService())..add(FetchCarts()),
        child: CartView(),
      ),
    );
  }
}

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartLoaded) {
          return ListView.builder(
            itemCount: state.carts.length,
            itemBuilder: (context, index) {
              final cart = state.carts[index];
              return ListTile(
                title: Text('Cart ID: ${cart.id}'),
                subtitle: Text('User ID: ${cart.userId}\nDate: ${cart.date}'),
                onTap: () {},
              );
            },
          );
        } else if (state is CartError) {
          return Center(
              child: Text('Failed to load cart items: ${state.message}'));
        } else {
          return Container();
        }
      },
    );
  }
}
