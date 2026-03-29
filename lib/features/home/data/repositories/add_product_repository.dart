import 'package:dio/dio.dart';
import 'package:eb_tech_task/core/resources/api.dart';

import '../models/product_model.dart';

class AddProductRepository {
 final DioService dioService;
 AddProductRepository(this.dioService);
 Future<ProductModel> addProduct({
   required String title,
   required double price,
   required String description,
   required String category,
   required String image,
 }) async {
   final response = await dioService.dio.post(
     'products',
     data: {
       "title": title,
       "price": price,
       "description": description,
       "image": image,
       "category": category,
     },
   );

   return  ProductModel(
     id: DateTime.now().millisecondsSinceEpoch,
     title: title,
     price: (price as num).toDouble(),
     description: description,
     image: image,
     category: category, rating: RatingModel(rate: 0.0, count: 0),
   );;
 }
}