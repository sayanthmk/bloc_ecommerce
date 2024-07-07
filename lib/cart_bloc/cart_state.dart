part of 'cart_bloc.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartModel> carts;

  CartLoaded(this.carts);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}

class CartProductAdded extends CartState {
  final CartModel cart;

  CartProductAdded(this.cart);
}
