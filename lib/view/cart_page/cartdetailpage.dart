import 'package:datapage_bloc/controller/blocs/cart_bloc/cart_bloc.dart';
import 'package:datapage_bloc/view/cart_page/cartcustom_container.dart';
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
        title: const Text(
          "Details",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.network(product.image, height: 200)),
              const SizedBox(height: 16),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartUpdated) {
                    final quantity = state.products[product] ?? 0;
                    final totalValue = product.price * quantity;
                    return Column(
                      children: [
                        Container(
                          height: 400,
                          width: 400,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              ProductRow(
                                greyContainerText: "Product",
                                redContainerChild: Text(
                                  product.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              ProductRow(
                                greyContainerText: "Price",
                                redContainerChild: Text(
                                  '\$${product.price}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                              ProductRow(
                                  greyContainerText: "Quantity",
                                  redContainerChild: Container(
                                    height: 40,
                                    width: 120,
                                    decoration: const BoxDecoration(
                                      color: Colors.yellow,
                                    ),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            context.read<CartBloc>().add(
                                                DecrementQuantity(product));
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                                border: Border.all(width: 2)),
                                            child: const Icon(Icons.remove),
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          color: Colors.white,
                                          child:
                                              Center(child: Text('$quantity')),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            context.read<CartBloc>().add(
                                                IncrementQuantity(product));
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                                border: Border.all(width: 2)),
                                            child: const Icon(Icons.add),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              ProductRow(
                                greyContainerText: "Subtotal",
                                redContainerChild: Text(
                                  '\$${totalValue.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 70,
                          width: 400,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                          child: const Center(
                            child: Text(
                              "BUY NOW",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
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
      ),
    );
  }
}
