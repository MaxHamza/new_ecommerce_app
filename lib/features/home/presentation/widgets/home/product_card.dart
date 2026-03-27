import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:eb_tech_task/core/resources/style_manager.dart';
import 'package:eb_tech_task/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(

      color: ColorManager.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('assets/images/product.png',height: 400.h,width: width,fit: BoxFit.fill,),
            Gap(10.h),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sonic Over-Ear',style: getBoldStyle(color:ColorManager.secondaryText,fontSize: 16.sp),),
                    Text('Matte Black Edition',style: getRegularStyle(color:ColorManager.secondaryText,fontSize: 14.sp),)
                  ],
                ),
                Spacer(),
                Text('16\$',style: getRegularStyle(color:ColorManager.primaryText,fontSize: 16.sp),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
