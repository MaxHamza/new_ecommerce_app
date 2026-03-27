import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/resources/routes_manager.dart';
import 'core/resources/theme_manager.dart';


void main()async{
  runApp(MyApp());
}
double ?height;
double ?width;
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return  ScreenUtilInit(
      designSize:Size(375,812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: RoutesManager.storeDetailsRoute,
        // theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      ),
    );
  }
}
