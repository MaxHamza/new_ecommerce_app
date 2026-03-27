import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/style_manager.dart';
import '../widgets/bottomNavBar.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final pages = [
    HomePage()
    , Text("Cart"), Text("Add")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(
            Icons.search,
            color: ColorManager.primaryText,
          ))
          ,
          IconButton(onPressed: (){}, icon: Icon(
            Icons.card_travel,
            color: ColorManager.primaryText,
          ))
        ],
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.primary,
        elevation: 0.5,
        title: Text('Lumina',style: getBoldStyle(color: ColorManager.primaryText,fontSize: 20.sp),),
      ),
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
