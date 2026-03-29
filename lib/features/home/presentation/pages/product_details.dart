import 'dart:io';
import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:eb_tech_task/core/resources/style_manager.dart';
import 'package:eb_tech_task/core/share/custom_button.dart';
import 'package:eb_tech_task/features/home/data/models/product_model.dart';
import 'package:eb_tech_task/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:eb_tech_task/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../data/models/cart_model.dart';
import '../manager/cart/cubit.dart';
import '../manager/cart/state.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, this.product});

  ProductModel? product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  int quantity = 1;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
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
                  image: widget.product!.image.isNotEmpty
                      ? (widget.product!.image.startsWith('http')
                            ? NetworkImage(widget.product!.image)
                            : FileImage(File(widget.product!.image)) as ImageProvider)
                      : const NetworkImage("https://via.placeholder.com/150"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(15.h),
            Text(
              widget.product!.title,
              style: getBoldStyle(
                color: ColorManager.secondaryText,
                fontSize: 20.sp,
              ),
            ),
            Gap(10.h),
            Row(
              children: [
                Text(
                  '\$ ${widget.product!.price}',
                  style: getBoldStyle(
                    color: ColorManager.primaryText,
                    fontSize: 22.sp,
                  ),
                ),
                Spacer(),
                Icon(Icons.star, color: Colors.orange, size: 22.r),
                Row(
                  children: [
                    Text(
                      '${widget.product!.rating.rate}',
                      style: getRegularStyle(
                        color: Colors.deepOrange,
                        fontSize: 18.sp,
                      ),
                    ),
                    Gap(5.w),
                    Text(
                      'Reviews(${widget.product!.rating.count})',
                      style: getRegularStyle(
                        color: Colors.deepOrange,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(20.h),
            Text(
              'The Story',
              style: getRegularStyle(
                color: ColorManager.primaryText,
                fontSize: 18.sp,
              ),
            ),
            Gap(10.h),
            Text(
              widget.product!.description,
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
                              quantity > 1 ? quantity-- : quantity;
                            });
                          },
                          icon: Transform.translate(
                            offset: Offset(0, -6),
                            child: Icon(Icons.minimize),
                          ),
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
                    height: 50.h,
                    onTap: () {
                      print("PRODUCT ID: ${widget.product?.id}");
                      context.read<CartCubit>().addToCart(
                        CartProduct(
                          productId: widget.product?.id ?? DateTime.now().millisecondsSinceEpoch,
                          title: widget.product!.title,
                          price: widget.product!.price,
                          image: widget.product!.image,
                          quantity: quantity,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(microseconds: 700),
                          content: Text(
                            'Product Added Successfully',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
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
