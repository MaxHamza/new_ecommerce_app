import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      title: Text('Lumina',style: getBoldStyle(color: ColorManager.secondaryText,fontSize: 20.sp),),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
