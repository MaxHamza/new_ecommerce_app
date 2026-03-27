import 'package:flutter/material.dart';
import 'font_manager.dart';

TextStyle _getStyle(Color color,double fontSize,FontWeight fontWeight){
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontFamily: 'Montserrat',
    fontWeight: fontWeight,
  );
}

TextStyle getLightStyle({required Color color, double ?fontSize}){
return _getStyle(color, fontSize ?? FontSize.s12, FontWeightManager.light);
}
TextStyle getMediumStyle({required Color color, double ?fontSize}){
  return _getStyle(color, fontSize ?? FontSize.s12, FontWeightManager.medium);
}
TextStyle getRegularStyle({required Color color, double ?fontSize}){
  return _getStyle(color, fontSize ?? FontSize.s12, FontWeightManager.regular);
}
TextStyle getSemiBoldStyle({required Color color, double ?fontSize}){
  return _getStyle(color, fontSize ?? FontSize.s12, FontWeightManager.semiBold);
}
TextStyle getBoldStyle({required Color color, double ?fontSize}){
  return _getStyle(color, fontSize ?? FontSize.s12, FontWeightManager.bold);
}