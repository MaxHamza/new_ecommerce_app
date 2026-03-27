import 'package:eb_tech_task/core/resources/strings_manager.dart';
import 'package:eb_tech_task/features/home/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';


class RoutesManager {
  static const String splashRoute='/';
  static const String insertProduct='/insertProduct';
  static const String homePage='/home';
  static const String cart='/cart';
  static const String mainRoute='/main';
  static const String storeDetailsRoute='/storeDetails';

}

class RouteGenerator{

  static Route<dynamic>getRoute(RouteSettings settings){
    switch (settings.name){//return string
      // case RoutesManager.splashRoute:
      //   return MaterialPageRoute(builder: (_)=>SplashView());
      // case RoutesManager.homePage:
      //   return MaterialPageRoute(builder: (_)=>LoginView());
      case RoutesManager.mainRoute:
        return MaterialPageRoute(builder: (_)=>MainPage());
      // case RoutesManager.storeDetailsRoute:
      //   return MaterialPageRoute(builder: (_)=>ForgotPasswordView());
      // case RoutesManager.cart:
      //   return MaterialPageRoute(builder: (_)=>StoreDetailsView());
      //case RoutesManager.insertProduct:
      //   return MaterialPageRoute(builder: (_)=>StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }
 static Route<dynamic>unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(title: Text(AppStrings.noRouteFound),),
      body: Center(
        child:const Text(AppStrings.noRouteFound),
      ),
    ));
  }
}