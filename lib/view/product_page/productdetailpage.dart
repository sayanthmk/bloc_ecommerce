import 'package:datapage_bloc/controller/blocs_page/cart_bloc/cart_bloc.dart';
import 'package:datapage_bloc/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Product",
          style: TextStyle(fontWeight: FontWeight.w500),
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
              Text(
                product.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                'Category: ${product.category}',
                style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                product.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Rating: ${product.rating.rate} (${product.rating.count} )',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<CartBloc>().add(AddProduct(product));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Row(
                            children: [
                              Icon(Icons.check, color: Colors.white),
                              SizedBox(width: 10),
                              Expanded(
                                  child: Text(
                                'Product added to the cart',
                                style: TextStyle(color: Colors.white),
                              )),
                            ],
                          ),
                          backgroundColor: Colors.black,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 2)),
                      child: const Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag),
                          Text(
                            "ADD TO KART",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                          child: Text(
                        "BUY NOW",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
    // ElevatedButton(
                  //   onPressed: () {
                  //     context.read<CartBloc>().add(AddProduct(product));
                  //   },
                  //   child: const Text('Add to Cart'),
                  // ),