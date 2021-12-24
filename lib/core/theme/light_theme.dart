import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constant/shared_color.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: mainColor,
    scaffoldBackgroundColor: Colors.white,
    shadowColor: Colors.black45,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        actionsIconTheme: const IconThemeData(
            color: Colors.black
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        )
    ),
    bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: mainColor,
        elevation: 20.0,
        backgroundColor: Colors.white
    ),
    textTheme:  TextTheme(
        bodyText1: TextStyle(
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black
        ),
        bodyText2: TextStyle(
            fontSize: 10.0.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black
        ),
    ),
    fontFamily: 'Roboto-Regular'
);