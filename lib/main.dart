import 'package:eb_tech_task/features/home/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/resources/api.dart';
import 'core/resources/routes_manager.dart';
import 'features/home/data/models/cart_model.dart';
import 'features/home/data/repositories/add_product_repository.dart';
import 'features/home/data/repositories/cart_repository.dart';
import 'features/home/data/repositories/product_repository.dart';
import 'features/home/presentation/manager/cart/cubit.dart';
import 'features/home/presentation/manager/fetch_products/cubit.dart';
import 'features/home/presentation/manager/insert_product/cubit.dart';


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
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) =>
                  ProductCubit(ProductRepository(DioService())),
            ),
            BlocProvider(
              create: (_) =>
                  CartCubit(CartRepository()),
            ),
            BlocProvider(
              create: (_) =>
                  InsertProductCubit(
                    AddProductRepository(DioService()),
                  ),
            ),
          ],
  child: MainPage(),
),
        // theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      ),
    );
  }
}
