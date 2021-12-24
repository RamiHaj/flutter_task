import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/on_boarding/model/boarding_model.dart';

class BuildBoardingItem extends StatelessWidget {
  const BuildBoardingItem({Key? key, required this.boradingModel}) : super(key: key);
  final BoradingModel boradingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(boradingModel.images),
        ),
        Text(
            boradingModel.title,
            style: Theme.of(context).textTheme.bodyText1
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
            boradingModel.body,
            style: Theme.of(context).textTheme.bodyText2
        ),
      ],
    );
  }
}
