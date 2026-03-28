import 'package:eb_tech_task/features/home/presentation/manager/cart/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cart_model.dart';
import '../../../data/repositories/cart_repository.dart';


class CartCubit extends Cubit<CartState> {
  final CartRepository repository;

  CartCubit(this.repository) : super(CartInitial());

  void loadCart() {
    final items = repository.getCartItems();
    final total = repository.getTotalPrice();

    emit(CartSuccess(items, total));
  }

  void addToCart(CartProduct product) {
    repository.addToCart(product);
    loadCart();
  }

  void removeItem(int index) {
    repository.removeItem(index);
    loadCart();
  }
}