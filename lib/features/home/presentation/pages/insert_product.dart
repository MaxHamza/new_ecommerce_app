import 'package:eb_tech_task/core/share/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../main.dart';

class InsertProduct extends StatefulWidget {
  const InsertProduct({super.key});

  @override
  State<InsertProduct> createState() => _InsertProductState();
}

class _InsertProductState extends State<InsertProduct> {
  @override
  Widget build(BuildContext context) {
  return  Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      height: height,
      decoration: BoxDecoration(color: ColorManager.primary),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Gap(10.h),
          Text('New Product',style: getBoldStyle(color: ColorManager.secondaryText,fontSize: 25.sp),),
          Gap(3.h),
          Text('Add a new item to your curated collection.',style: getRegularStyle(color: ColorManager.primaryText,fontSize: 16.sp),),
          Gap(10.h),
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.secondaryText.withOpacity(0.5), width: 2.w), // ملاحظة: للحدود المنقطة يفضل استخدام حزمة dotted_border
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cloud_upload_outlined, size: 40.r, color: ColorManager.secondaryText),
                 SizedBox(height: 8.h),
                Text(
                  "UPLOAD PRODUCT IMAGERY",
                  style: TextStyle(color: ColorManager.secondaryText, fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
              ],
            ),
          ),

           Gap( 30.h),

        
          _buildLabel("PRODUCT NAME", ColorManager.secondaryText),
          _buildTextField("e.g. Minimalist Ceramic Vase", Color(0xffFFD2CF),   Colors.grey,),

          _buildLabel("CATEGORY", ColorManager.secondaryText),
          _buildDropdownField("Select a category", Color(0xffFFD2CF),   Colors.grey,),

          _buildLabel("PRICE (USD)", ColorManager.secondaryText),
          _buildTextField("\$ 0.00", Color(0xffFFD2CF),   Colors.grey, prefix: true),

          _buildLabel("DESCRIPTION", ColorManager.secondaryText),
          _buildTextField(
            "Describe the story and craftsmanship behind this piece...",
            Color(0xffFFD2CF),
            Colors.grey,
            maxLines: 5,
          ),
          Gap(20.h),
          CustomButton(title: 'Save Product',height: 56.h,),
          Gap(30.h),
        ],
      ),
  );
  }
  
  Widget _buildLabel(String text, Color color) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 8.0.r, top: 16.0.r),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13.sp),
      ),
    );
  }

  
  Widget _buildTextField(String hint, Color fill, Color textCol, {int maxLines = 1, bool prefix = false}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: textCol.withOpacity(0.5)),
        filled: true,
        fillColor: fill,
        prefixText: prefix ? "\$ " : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        contentPadding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.r),
      ),
    );
  }

  // Widget مخصص لحقل الاختيار (Dropdown)
  Widget _buildDropdownField(String hint, Color fill, Color textCol) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(hint, style: TextStyle(color: textCol.withOpacity(0.5))),
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color: textCol),
          items: [
            DropdownMenuItem(child: Text('Electronics'))
          ], 
          onChanged: (value) {},
        ),
      ),);
  }
}
