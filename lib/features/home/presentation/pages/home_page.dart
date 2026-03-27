import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:eb_tech_task/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/style_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 16.h),
      height: height,
      decoration: BoxDecoration(
        color: ColorManager.primary,
      ),
      child: Column(
        children: [

        ],
      ),
    );
  }
}
