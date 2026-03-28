import 'package:eb_tech_task/features/home/presentation/manager/fetch_products/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit(this.repository) : super(ProductInitial());

  List<ProductModel> allProducts = [];

  Future<void> getProducts() async {
    emit(ProductLoading());

    try {
      final products = await repository.getProducts();
      allProducts = products;
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  void filterByCategory(String category) {
    if (category == "all") {
      emit(ProductSuccess(allProducts));
    } else {
      final filtered = allProducts
          .where((p) => p.category == category)
          .toList();

      emit(ProductSuccess(filtered));
    }
  }
}