import 'package:eb_tech_task/features/home/presentation/manager/fetch_products/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit(this.repository) : super(ProductInitial());

  // تخزين البيانات الأصلية القادمة من السيرفر
  List<ProductModel> _allProductsFromApi = [];

  // تخزين البيانات المضافة يدوياً
  List<ProductModel> addedProducts = [];

  // حفظ الفئة المختارة حالياً
  String currentCategory = "all";

  Future<void> getProducts() async {
    emit(ProductLoading());
    try {
      final products = await repository.getProducts();
      _allProductsFromApi = products; // حفظ النسخة الأصلية
      _applyFilter();
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  void filterByCategory(String category) {
    currentCategory = category;
    _applyFilter();
  }

  void addLocalProduct(ProductModel product) {
    addedProducts.insert(0, product);
    _applyFilter();
  }

  void _applyFilter() {
    List<ProductModel> filteredList;

    if (currentCategory == "all") {
      // نرسل نسخة جديدة من القائمة الكاملة
      filteredList = List.from(_allProductsFromApi);
    } else {
      // نفلتر من القائمة الكاملة المحفوظة لدينا
      filteredList = _allProductsFromApi
          .where((p) => p.category.trim().toLowerCase() == currentCategory.trim().toLowerCase())
          .toList();
    }

    // إرسال حالة النجاح مع القائمة الجديدة
    emit(ProductSuccess(filteredList));
  }
}