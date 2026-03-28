import 'package:dio/dio.dart';
import '../../../../core/resources/api.dart';
import '../models/product_model.dart';

class ProductRepository {
  final DioService dioService;

  ProductRepository(this.dioService);

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dioService.dio.get('products');

      final List data = response.data;

      return data
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? 'Dio Error');
    } catch (e) {
      throw Exception('Unexpected Error');
    }
  }
}