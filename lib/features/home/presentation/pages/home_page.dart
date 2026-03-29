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
import '../../data/models/product_model.dart';
import '../manager/fetch_products/cubit.dart';
import '../manager/fetch_products/state.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final categories = AppConstant.categories;

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
          const Gap(10),
          ExploreNow(),
          const Gap(20),

          /// 🔥 عرض المنتجات المضافة يدوياً (أداء أفضل بدون ListView متداخل)
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              final manualProducts = context.read<ProductCubit>().addedProducts;
              if (manualProducts.isEmpty) return const SizedBox.shrink();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("Newly Added by You", Icons.stars),
                  Gap(10.h),
                  ...manualProducts.map((p) => Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: ProductCard(product: p),
                  )),
                  const Divider(thickness: 1.5),
                  Gap(10.h),
                ],
              );
            },
          ),

          /// 🔥 Categories
          _buildCategoryList(),

          Gap(20.h),

          /// 🔥 قائمة منتجات الـ API
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) return _buildLoading();
              if (state is ProductError) return Center(child: Text(state.message));

              final products = state is ProductSuccess ? state.products : <ProductModel>[];
              return Column(
                children: products.map((product) => InkWell(
                  onTap: () => _navigateToDetails(context, product),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: ProductCard(product: product),
                  ),
                )).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets لإبقاء الـ Build نظيف ---
  Widget _buildSectionTitle(String title, IconData icon) => Row(
    children: [
      Icon(icon, color: ColorManager.activeButton, size: 20.sp),
      const Gap(8),
      Text(title, style: getBoldStyle(color: ColorManager.primaryText, fontSize: 18.sp)),
    ],
  );

  Widget _buildCategoryList() => SizedBox(
    height: 35.h,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      separatorBuilder: (_, __) => Gap(8.w),
      itemBuilder: (context, index) => _buildCategoryItem(index),
    ),
  );

  Widget _buildCategoryItem(int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
        context.read<ProductCubit>().filterByCategory(categories[index]);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: isSelected ? null : ColorManager.secondary,
          gradient: isSelected ? LinearGradient(colors: [ColorManager.activeButton, const Color(0xffFF784D)]) : null,
        ),
        alignment: Alignment.center,
        child: Text(
          categories[index] == "all" ? "All Products" : categories[index],
          style: getRegularStyle(color: isSelected ? ColorManager.white : ColorManager.primaryText, fontSize: 14.sp),
        ),
      ),
    );
  }

  Widget _buildLoading() => SizedBox(height: 200.h, child: const Center(child: CircularProgressIndicator()));

  void _navigateToDetails(BuildContext context, ProductModel product) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => CartCubit(CartRepository()),
        child: ProductDetails(product: product),
      ),
    ));
  }
}