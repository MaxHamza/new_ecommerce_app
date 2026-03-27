import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:eb_tech_task/core/resources/style_manager.dart';
import 'package:eb_tech_task/core/share/custom_button.dart';
import 'package:eb_tech_task/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:eb_tech_task/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  int quantity=1;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SafeArea(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: ColorManager.primaryText,
                      size: 25.r,
                    ),
                    Gap(5.w),
                    Text(
                      'Back to Essentials',
                      style: getRegularStyle(
                        color: ColorManager.primaryText,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(20.h),
            Container(
              width: width,
              height: 390.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/product.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Gap(10.h),
            Text(
              'Amber Solis Vessel',
              style: getBoldStyle(
                color: ColorManager.secondaryText,
                fontSize: 24.sp,
              ),
            ),
            Gap(3.h),
            Row(
              children: [
                Text(
                  '\$ 16',
                  style: getBoldStyle(
                    color: ColorManager.primaryText,
                    fontSize: 22.sp,
                  ),
                ),
                Spacer(),
                Icon(Icons.star, color: Colors.orange, size: 22.r),
                Text(
                  '4.9',
                  style: getRegularStyle(
                    color: Colors.deepOrange,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            Gap(15.h),
            Text(
              'The Story',
              style: getRegularStyle(
                color: ColorManager.primaryText,
                fontSize: 18.sp,
              ),
            ),
            Gap(10.h),
            Text(
              ''' Hand-blown by master artisans in
 Murano, the Solis Vessel captures the
 essence of the golden hour. Its
 undulating silhouette is designed to
 manipulate natural light, casting warm,
 rhythmic shadows across any surface it inhabits.''',
              style: getRegularStyle(
                color: ColorManager.primaryText,
                fontSize: 18.sp,
              ),
            ),
            Gap(20.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Color(0xffFFD2CF),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    padding: EdgeInsets.all(10.r),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity>1?
                              quantity--:quantity;
                            });
                          },
                          icon: Transform.translate(offset:Offset(0, -6) ,child: Icon(Icons.minimize),),
                          iconSize: 22.r,
                          alignment: Alignment.topCenter,
                        ),
                        Spacer(),
                        Text(quantity.toString()),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: Icon(Icons.add),
                          iconSize: 22.r,
                          alignment: Alignment.topCenter,
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(10.w),
                Expanded(
                  child: CustomButton(
                    title: 'Add To Cart',
                    padding: EdgeInsets.all(10.r),
                    height: 50.h,
                  ),
                ),
              ],
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
