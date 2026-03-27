import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:eb_tech_task/core/resources/style_manager.dart';
import 'package:eb_tech_task/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
class CartItem extends StatefulWidget {
   const CartItem({super.key,});
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity=1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: ColorManager.secondary,
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/product.png',
            height: 116.h,
            fit: BoxFit.contain,
          ),
          Gap(10.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ethereal Timepiece',
                      style: getMediumStyle(
                        color: ColorManager.secondaryText,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      'Ref: LMN-001 • Rose Gold',
                      style: getMediumStyle(
                        color: ColorManager.primaryText,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                Gap(10.h),
                Text(
                  '\$249.00',
                  style: getMediumStyle(
                    color: ColorManager.secondaryText,
                    fontSize: 16.sp,
                  ),
                ),
                Gap(10.h),
                Text(
                  'Quantity= $quantity',
                  style: getMediumStyle(
                    color: ColorManager.secondaryText,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Gap(5.w),
          IconButton(onPressed: (){}, icon: Icon(Icons.close,size: 24.r,color: ColorManager.secondaryText,))
        ],
      ),
    );
  }
}