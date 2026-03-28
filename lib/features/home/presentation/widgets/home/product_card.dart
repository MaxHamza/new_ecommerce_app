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
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          children: [
            Image.network(
              product.image,
              height: 200.h,
              width: width,
              fit: BoxFit.contain,
            ),

            Gap(10.h),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                          color: ColorManager.secondaryText,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        product.category,
                        style: getRegularStyle(
                          color: ColorManager.primaryText,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  '${product.price}\$',
                  style: getRegularStyle(
                    color: ColorManager.primaryText,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
