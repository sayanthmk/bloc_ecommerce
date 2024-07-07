part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddProduct extends CartEvent {
  final Product product;

  AddProduct(this.product);
}

class IncrementQuantity extends CartEvent {
  final Product product;

  IncrementQuantity(this.product);
}

class DecrementQuantity extends CartEvent {
  final Product product;

  DecrementQuantity(this.product);
}
