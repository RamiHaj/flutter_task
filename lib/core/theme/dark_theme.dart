import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constant/shared_color.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: mainColor,
  scaffoldBackgroundColor: HexColor('333739'),
    shadowColor: Colors.black45,
  appBarTheme: AppBarTheme(
      backgroundColor: HexColor('333739'),
      elevation: 0.0,
      titleTextStyle:  TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
          color: Colors.white
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: mainColor,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
      backgroundColor: HexColor('333739')
  ),
  textTheme:  TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white
      )
  ),
  fontFamily: 'Roboto-Regular'
);