import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomBottomNav extends StatefulWidget {
  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Page $currentIndex")),

      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 70.h,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildItem(Icons.store, "SHOP", 0),
                // _buildItem(Icons.search, "SEARCH", 1),
                Gap(60.w),
                _buildItem(Icons.person, "Cart", 1),
              ],
            ),
          ),

          // زر Cart الدائري
          Positioned(
            top: -25,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: GestureDetector(
              onTap: () {
                setState(() => currentIndex = 2);
              },
              child: Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: ColorManager.activeButton,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.r,
                    ),
                  ],
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String label, int index) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => currentIndex = index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? ColorManager.activeButton : Colors.grey,
          ),
           Gap( 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: isSelected ? ColorManager.activeButton : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}