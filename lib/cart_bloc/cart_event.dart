part of 'cart_bloc.dart';

abstract class CartEvent {}

class FetchCarts extends CartEvent {}

class AddProductToCart extends CartEvent {
  final int userId;
  final DateTime date;
  final List<Map<String, dynamic>> products;

  AddProductToCart({
    required this.userId,
    required this.date,
    required this.products,
  });
}
