import 'package:eb_tech_task/core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../main.dart';
import '../widgets/cart/cart_item.dart';
import '../widgets/cart/price_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      height: height,
      decoration: BoxDecoration(color: ColorManager.primary),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Gap(10.h),
          Text('Your Bag',style: getBoldStyle(color: ColorManager.secondaryText,fontSize: 25.sp),),
          Gap(3.h),
          Text('Review your curated selection',style: getRegularStyle(color: ColorManager.primaryText,fontSize: 16.sp),),
          Gap(10.h),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder:(context,index){
              return CartItem();
            },
            itemCount: 4,
            separatorBuilder: (context,index){
              return Gap(10.h);
            },
          ),
          Gap(20.h),
          PriceCard(price: 417,),
        ],
      ),
    );
  }
}
