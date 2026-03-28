
import '../../../data/models/cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}


class CartSuccess extends CartState {
  final List<CartProduct> items;
  final double total;

  CartSuccess(this.items, this.total);
}

