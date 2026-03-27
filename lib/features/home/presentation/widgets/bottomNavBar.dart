import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomBottomNav extends StatefulWidget {
  final Function(int) onTabChanged;
  const CustomBottomNav({super.key, required this.onTabChanged});
  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 75.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
                _buildItem(Icons.card_travel_rounded, "Cart", 1),
              ],
            ),
          ),

          // زر Cart الدائري
          Positioned(
            top: -25.h,
            left: 0.5.sw - 30.w,
            child: GestureDetector(
              onTap: () {
                setState(() => currentIndex = 2);
                widget.onTabChanged(currentIndex);
              },
              child: Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: ColorManager.activeButton,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 8.r),
                  ],
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      );
  }

  Widget _buildItem(IconData icon, String label, int index) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => currentIndex = index);
        widget.onTabChanged(currentIndex);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? ColorManager.activeButton : Colors.grey,
          ),
          Gap(4.h),
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
