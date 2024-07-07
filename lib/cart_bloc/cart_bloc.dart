import 'package:bloc/bloc.dart';
import 'package:datapage_bloc/models/productmodel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddProduct>((event, emit) {
      if (state is CartInitial) {
        emit(CartUpdated({event.product: 1}));
      } else if (state is CartUpdated) {
        final currentState = state as CartUpdated;
        final updatedProducts = Map<Product, int>.from(currentState.products);
        if (updatedProducts.containsKey(event.product)) {
          updatedProducts[event.product] = updatedProducts[event.product]! + 1;
        } else {
          updatedProducts[event.product] = 1;
        }
        emit(CartUpdated(updatedProducts));
      }
    });

    on<IncrementQuantity>((event, emit) {
      if (state is CartUpdated) {
        final currentState = state as CartUpdated;
        final updatedProducts = Map<Product, int>.from(currentState.products);
        updatedProducts[event.product] = updatedProducts[event.product]! + 1;
        emit(CartUpdated(updatedProducts));
      }
    });

    on<DecrementQuantity>((event, emit) {
      if (state is CartUpdated) {
        final currentState = state as CartUpdated;
        final updatedProducts = Map<Product, int>.from(currentState.products);
        if (updatedProducts[event.product]! > 1) {
          updatedProducts[event.product] = updatedProducts[event.product]! - 1;
        } else {
          updatedProducts.remove(event.product);
        }
        emit(CartUpdated(updatedProducts));
      }
    });
  }
}
