import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.title,  this.color,this.onTap,  this.textColor, this.height,this.padding});
  final String title;
  final Color ?color;
  void Function()? onTap;
  final Color ?textColor;
  EdgeInsetsGeometry? padding;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        height: height??40.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            ColorManager.activeButton,
            Color(0xffFF784D)
          ]),

            borderRadius: BorderRadius.all(Radius.circular(25.r))
        ),
        child: Center(
          child: Text(title,style: TextStyle(
              color: textColor??Colors.white,
              fontSize: 16.sp
          ),),

        ),
      ),
    );
  }
}