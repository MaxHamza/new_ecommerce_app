import 'package:dio/dio.dart';
import '../../../../core/resources/api.dart';
import '../models/product_model.dart';
class ProductRepository {
  final DioService dioService;
  ProductRepository(this.dioService);

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dioService.dio.get('products');

      // 1. التأكد من أن البيانات قائمة (List)
      if (response.data is List) {
        final List data = response.data;
        return data.map((e) => ProductModel.fromJson(e)).toList();
      }

      // 2. إذا كان الـ API يغلف القائمة داخل مفتاح 'data'
      if (response.data is Map && response.data['data'] is List) {
        final List data = response.data['data'];
        return data.map((e) => ProductModel.fromJson(e)).toList();
      }

      return []; // عودة قائمة فارغة كحالة افتراضية آمنة

    } on DioException catch (e) {
      // تحويل الخطأ لنص مفهوم دائماً
      throw e.message ?? 'Server Connection Error';
    } catch (e) {
      throw 'An unexpected error occurred';
    }
  }
}