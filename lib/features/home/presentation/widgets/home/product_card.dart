import 'dart:io';

import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:eb_tech_task/core/resources/style_manager.dart';
import 'package:eb_tech_task/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../data/models/product_model.dart';
class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.primary,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            Center(
              child: _buildProductImage(),
            ),

            Gap(10.h),

            ///  TITLE + CATEGORY
            Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getBoldStyle(
                color: ColorManager.secondaryText,
                fontSize: 16.sp,
              ),
            ),

            Gap(5.h),

            Text(
              product.category,
              style: getRegularStyle(
                color: ColorManager.primaryText,
                fontSize: 13.sp,
              ),
            ),

            Gap(10.h),

            ///  PRICE
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${product.price.toStringAsFixed(2)} \$",
                style: getBoldStyle(
                  color: ColorManager.activeButton,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildProductImage() {
  return  product.image.isNotEmpty
        ? (product.image.startsWith('http')
        ? Image.network(
      product.image,
      height: 180.h,
      width: double.infinity,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return _buildErrorImage();
      },
    )
        : Image.file(
      File(product.image),
      height: 180.h,
      width: double.infinity,
      fit: BoxFit.contain,
    ))
        : Image.network(
      "https://via.placeholder.com/150",
      height: 180.h,
      width: double.infinity,
      fit: BoxFit.contain,
    );
  }
  Widget _buildErrorImage() {
    return Container(
      height: 180.h,
      width: double.infinity,
      color: Colors.grey.shade200,
      child: Icon(
        Icons.image_not_supported,
        size: 40.r,
        color: Colors.grey,
      ),
    );
  }
}