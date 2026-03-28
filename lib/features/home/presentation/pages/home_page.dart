import 'package:eb_tech_task/core/resources/api.dart';
import 'package:eb_tech_task/core/resources/app_constant.dart';
import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:eb_tech_task/core/resources/routes_manager.dart';
import 'package:eb_tech_task/core/share/custom_button.dart';
import 'package:eb_tech_task/features/home/data/repositories/cart_repository.dart';
import 'package:eb_tech_task/features/home/presentation/manager/cart/cubit.dart';
import 'package:eb_tech_task/features/home/presentation/pages/product_details.dart';
import 'package:eb_tech_task/features/home/presentation/widgets/home/exploreNow.dart';
import 'package:eb_tech_task/features/home/presentation/widgets/home/product_card.dart';
import 'package:eb_tech_task/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/resources/style_manager.dart';
import '../manager/fetch_products/cubit.dart';
import '../manager/fetch_products/state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final categories = [
    "all",
    "men's clothing",
    "women's clothing",
    "jewelery",
    "electronics",
  ];

  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      color: ColorManager.primary,
      child: ListView(
        children: [
          Gap(10.h),
          ExploreNow(),
          Gap(10.h),

          /// 🔥 categories
          SizedBox(
            height: 30.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => Gap(5.w),
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });

                    context
                        .read<ProductCubit>()
                        .filterByCategory(categories[index]);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: isSelected ? null : ColorManager.secondary,
                      gradient: isSelected
                          ? LinearGradient(
                        colors: [
                          ColorManager.activeButton,
                          Color(0xffFF784D),
                        ],
                      )
                          : null,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      categories[index] == "all"
                          ? "All Objects"
                          : categories[index],
                      style: getRegularStyle(
                        color: isSelected
                            ? ColorManager.white
                            : ColorManager.primaryText,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Gap(20.h),

          /// 🔥 products
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return SizedBox(
                    height: 200.h,
                    child: Center(child: CircularProgressIndicator()));
              } else if (state is ProductSuccess) {
                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.products.length,
                  separatorBuilder: (_, _) => Gap(10.h),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  BlocProvider(
                                    create: (context) => CartCubit(CartRepository()),
                                    child: ProductDetails(
                                      product: state.products[index],),
                                  )));
                        },
                        child: ProductCard(product: state.products[index]));
                  },
                );
              } else if (state is ProductError) {
                return Text(state.message);
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
