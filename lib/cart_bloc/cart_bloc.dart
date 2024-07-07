import 'package:bloc/bloc.dart';
import 'package:datapage_bloc/api/cart_api.dart';
import 'package:datapage_bloc/models/cartmodel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartApiService apiService;

  CartBloc({required this.apiService}) : super(CartInitial()) {
    on<FetchCarts>(_onFetchCarts);
    on<AddProductToCart>(_onAddProductToCart);
  }

  void _onFetchCarts(FetchCarts event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final carts = await apiService.fetchCarts();
      emit(CartLoaded(carts));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  void _onAddProductToCart(
      AddProductToCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final cart = await apiService.addProductToCart(
          event.userId, event.date, event.products);
      emit(CartProductAdded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}
