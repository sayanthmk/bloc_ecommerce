import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:datapage_bloc/models/cartmodel.dart';

class CartApiService {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<List<CartModel>> fetchCarts() async {
    final response = await http.get(Uri.parse('$baseUrl/carts'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<CartModel> carts =
          body.map((dynamic item) => CartModel.fromJson(item)).toList();
      return carts;
    } else {
      throw Exception('Failed to load carts');
    }
  }

  Future<CartModel> addProductToCart(
      int userId, DateTime date, List<Map<String, dynamic>> products) async {
    final response = await http.post(
      Uri.parse('$baseUrl/carts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'userId': userId,
        'date': date.toIso8601String(),
        'products': products,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return CartModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add product to cart');
    }
  }
}
