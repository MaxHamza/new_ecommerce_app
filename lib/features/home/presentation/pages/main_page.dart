import 'package:eb_tech_task/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../widgets/bottomNavBar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
