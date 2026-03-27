import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
      debugShowCheckedModeBanner: false,
      ),
    );
  }
}
