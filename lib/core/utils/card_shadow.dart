import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<BoxShadow>  get getCardShadow => [
   BoxShadow(
      offset: const Offset(0.0,0.0),
      color: ThemeData.light().shadowColor.withOpacity(.1),
      blurRadius: 10,
      spreadRadius: 0.5
  )
];