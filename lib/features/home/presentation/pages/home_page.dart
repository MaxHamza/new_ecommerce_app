import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:eb_tech_task/core/share/custom_button.dart';
import 'package:eb_tech_task/features/home/presentation/widgets/home/exploreNow.dart';
import 'package:eb_tech_task/features/home/presentation/widgets/home/product_card.dart';
import 'package:eb_tech_task/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/resources/style_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      height: height,
      decoration: BoxDecoration(color: ColorManager.primary),
      child: ListView(
        children: [
          Gap(10.h),
          ExploreNow(),
          Gap(10.h),
          SizedBox(
            height: 30.h,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Gap(5.w);
              },
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
              return  Container(
                padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: index == 0 ? null : ColorManager.secondary,
                    gradient: index == 0
                        ? LinearGradient(
                      colors: [
                        ColorManager.activeButton,
                        Color(0xffFF784D),
                      ],
                    )
                        : null,
                  ),
                  height: 30.h,
                  child: Text(
                    'All Objects',
                    style: getRegularStyle(
                      color: index == 0 ? ColorManager.white : ColorManager.primaryText,
                      fontSize: 16.sp,
                    ),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
          Gap(20.h),
         Expanded(
           child: ListView.separated(
             physics: NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               itemBuilder: (context,index){
             return   ProductCard();
           },
               separatorBuilder: (context,index){
           return  Gap(10.h);
           }, itemCount: 5),
         )
        ],
      ),
    );
  }
}
