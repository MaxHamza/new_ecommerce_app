import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/resources/routes_manager.dart';
import 'features/home/data/models/cart_model.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(CartProductAdapter());
  await Hive.initFlutter();
  await Hive.openBox<CartProduct>('cartBox');
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
        initialRoute: RoutesManager.mainRoute,
        // theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      ),
    );
  }
}
