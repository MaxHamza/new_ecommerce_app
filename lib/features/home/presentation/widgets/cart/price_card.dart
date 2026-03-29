import 'package:eb_tech_task/core/share/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class PriceCard extends StatefulWidget {
  const PriceCard({super.key,required this.price});
final  double price;
  @override
  State<PriceCard> createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Color(0xffFFE1DF),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Subtotal',
                style: getMediumStyle(
                  color: ColorManager.primaryText,
                  fontSize: 16.sp,
                ),
              ),
              Spacer(),
              Text(
                '\$ ${widget.price}',
                style: getMediumStyle(
                  color: ColorManager.primaryText,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          Gap(5.h),
          Row(
            children: [
              Text(
                'Shipping',
                style: getMediumStyle(
                  color: ColorManager.primaryText,
                  fontSize: 16.sp,
                ),
              ),
              Spacer(),
              Text(
                'Free',
                style: getMediumStyle(
                  color: ColorManager.primaryText,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          Gap(10.h),
          Container(height: 1.h,color: Colors.grey[300],),
          Gap(10.h),
          Row(
            children: [
              Text(
                'Total',
                style: getMediumStyle(
                  color: ColorManager.secondaryText,
                  fontSize: 20.sp,
                ),
              ),
              Spacer(),
              Text(
                '\$ ${widget.price}',
                style: getMediumStyle(
                  color: ColorManager.secondaryText,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          Gap(20.h),
          CustomButton(title: 'Proceed to Checkout',height: 53.h,),
          Gap(10.h),
          Text('''Taxes calculated at checkout. Secure SSL
encryption active.''',textAlign: TextAlign.center,style: getRegularStyle(color: ColorManager.grey),),
          Gap(10.h),
        ],
      ),
    );
  }
}
