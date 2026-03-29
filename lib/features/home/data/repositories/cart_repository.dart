import 'package:hive/hive.dart';
import '../models/cart_model.dart';
class CartRepository {
  final Box<CartProduct> box = Hive.box<CartProduct>('cartBox');

  List<CartProduct> getCartItems() {
    return box.values.toList();
  }

  void addToCart(CartProduct product) {
    final index = box.values.toList().indexWhere(
          (item) => item.productId == product.productId,
    );

    if (index != -1) {
      final existing = box.getAt(index)!;
      existing.quantity += product.quantity;
      existing.save();
    } else {
      box.add(product);
    }
  }

  void removeItem(int index) {
    box.deleteAt(index);
  }

  double getTotalPrice() {
    return box.values.fold(
      0,
          (sum, item) => sum + (item.price * item.quantity),
    );
  }
}