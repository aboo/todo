import 'package:flutter/material.dart';

class MyTheme {
  static const Color gray = Color(0xffF6F6F6);
  static const Color gray97 = Color(0xff979797);
  static const Color blue = Color(0xff007AFF);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static  Color red = const Color(0xffFF3B2F);
  static  Color green = const Color(0xff4BD763);

  static const TextStyle t_700_17_black = TextStyle(color: black,fontSize: 17,fontWeight: FontWeight.w700);
  static const TextStyle t_m_20_black = TextStyle(color: black,fontSize: 20);
  static const TextStyle t_700_19_white = TextStyle(color: white,fontSize: 19,fontWeight: FontWeight.w700);
  static  Color gray3c60 = const Color(0xff3C3C43).withOpacity(0.60);
  static const TextStyle t_700_16_black = TextStyle(color: black,fontSize: 16,fontWeight: FontWeight.w700);
  static  Color gray3c29 = const Color(0xff3C3C43).withOpacity(0.29);
  static  TextStyle t_400_12_blue= const TextStyle(color: blue,fontSize: 12,fontWeight: FontWeight.w400);
  static  TextStyle t_400_14_gray97= const TextStyle(color: gray97,fontSize: 14,fontWeight: FontWeight.w400);
  static  TextStyle t_400_14_black= const TextStyle(color: black,fontSize: 14,fontWeight: FontWeight.w400);
  static const TextStyle t_700_16_gray97 = TextStyle(color: gray97,fontSize: 16,fontWeight: FontWeight.w400);
  static  TextStyle t_500_17_white = const TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500);
  static  TextStyle t_500_16_red = TextStyle(color: red,fontSize: 16,fontWeight: FontWeight.w500);

  static  InputDecoration inputTextDecoration=InputDecoration(
    hintStyle: MyTheme.t_400_14_gray97,
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
    labelStyle: MyTheme.t_400_14_black,
  );
}