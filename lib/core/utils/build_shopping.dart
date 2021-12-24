import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constant/shared_color.dart';
import 'package:flutter_task/features/home/model/transaction.dart';
import 'build_shoppings_item.dart';


class BuildShopping extends StatelessWidget {
  const BuildShopping({Key? key, required this.transaction}) : super(key: key);
  final List<Transaction> transaction;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: true,
        builder: (context) => ListView.separated(
            itemBuilder: (context , index)=>BuildShoppingsItem(transaction: transaction, index: index,),
            separatorBuilder: (context , index) => SizedBox(height: 10.h,),
            itemCount: transaction.length
        ),
        fallback: (context) => const Center(child: CircularProgressIndicator(color: mainColor,))
    );
  }
}
