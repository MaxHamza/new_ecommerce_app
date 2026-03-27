import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/share/custom_button.dart';
import '../../../../main.dart';

class ExploreNow extends StatelessWidget {
  const ExploreNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 70.w,vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: ColorManager.secondary,
          border: BoxBorder.all(
              color: Colors.black
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Limited Edition',style: getRegularStyle(color: ColorManager.primaryText,fontSize: 16.sp),),
          Gap(10.h),
          Text('Essentials for The Model Curator',style: getMediumStyle(color: ColorManager.secondaryText,fontSize: 25.sp),),
          Gap(14.h),
          CustomButton(title: 'Explore Now',height: 50.h,),
        ],
      ),
    );
  }
}
