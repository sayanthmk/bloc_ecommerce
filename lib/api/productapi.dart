import 'dart:convert';
import 'package:datapage_bloc/models/productmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = 'https://fakestoreapi.com/products';
  final String cartUrl = 'https://fakestoreapi.com/carts';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Product> products =
          body.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Future<List<Cart>> fetchCarts() async {
  //   final response = await http.get(Uri.parse(cartUrl));

  //   if (response.statusCode == 200) {
  //     List<dynamic> body = jsonDecode(response.body);
  //     List<Cart> carts =
  //         body.map((dynamic item) => Cart.fromJson(item)).toList();
  //     return carts;
  //   } else {
  //     throw Exception('Failed to load carts');
  //   }
  // }

  // Future<Cart> addProductToCart(
  //     int userId, DateTime date, List<CartItem> products) async {
  //   final response = await http.post(
  //     Uri.parse(cartUrl),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode({
  //       'userId': userId,
  //       'date': date.toIso8601String(),
  //       'products': products
  //           .map((product) => {
  //                 'productId': product.productId,
  //                 'quantity': product.quantity,
  //               })
  //           .toList(),
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     return Cart.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to add product to cart');
  //   }
  // }
  Future<List<Product>> searchProducts(String query) async {
    final response = await http.get(Uri.parse('$apiUrl?q=$query'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Product.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
