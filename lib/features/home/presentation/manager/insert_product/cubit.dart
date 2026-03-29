import 'package:eb_tech_task/features/home/data/repositories/add_product_repository.dart';
import 'package:eb_tech_task/features/home/presentation/manager/insert_product/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';
import '../fetch_products/state.dart';
class InsertProductCubit extends Cubit<InsertProductState> {
  final AddProductRepository repository;

  InsertProductCubit(this.repository) : super(InsertProductInitial());

  // تم تغيير النوع هنا ليعيد المنتج المستلم من الـ API
  Future<ProductModel> addProduct({
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
  }) async {
    emit(InsertProductLoading());
    try {
      final product = await repository.addProduct(
        title: title,
        price: price,
        description: description,
        category: category,
        image: image,
      );

      emit(InsertProductSuccess(product));
      return product; // ضروري جداً لكي يعمل سطر الـ UI لديك
    } catch (e) {
      emit(InsertProductError(e.toString()));
      rethrow; // نستخدم rethrow لكي يتوقف الكود في الـ UI عند حدوث خطأ ولا ينفذ Navigator.pop
    }
  }
}