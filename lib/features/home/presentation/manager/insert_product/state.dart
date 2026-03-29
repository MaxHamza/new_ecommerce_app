import '../../../data/models/product_model.dart';
import '../fetch_products/state.dart';
sealed class InsertProductState {}

class InsertProductInitial extends InsertProductState {}

class InsertProductLoading extends InsertProductState {}

class InsertProductSuccess extends InsertProductState {
  final ProductModel product;

  InsertProductSuccess(this.product);
}

class InsertProductError extends InsertProductState {
  final String message;

  InsertProductError(this.message);
}