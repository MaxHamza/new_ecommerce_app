import 'package:eb_tech_task/core/resources/api.dart';
import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:eb_tech_task/features/home/data/repositories/add_product_repository.dart';
import 'package:eb_tech_task/features/home/data/repositories/cart_repository.dart';
import 'package:eb_tech_task/features/home/data/repositories/product_repository.dart';
import 'package:eb_tech_task/features/home/presentation/manager/cart/cubit.dart';
import 'package:eb_tech_task/features/home/presentation/manager/fetch_products/cubit.dart';
import 'package:eb_tech_task/features/home/presentation/manager/insert_product/cubit.dart';
import 'package:eb_tech_task/features/home/presentation/pages/cart_page.dart';
import 'package:eb_tech_task/features/home/presentation/pages/insert_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/style_manager.dart';
import '../widgets/bottomNavBar.dart';
import '../widgets/custom_app_bar.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final pages = [
    const HomePage(),
    const CartPage(),
    const InsertProduct(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: pages[currentIndex],
      backgroundColor: ColorManager.primary,
      bottomNavigationBar: CustomBottomNav(
        onTabChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
