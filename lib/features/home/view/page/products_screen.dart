import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constant/shared_color.dart';
import 'package:flutter_task/core/utils/build_products_item.dart';
import 'package:flutter_task/features/home/controller/cubit.dart';
import 'package:flutter_task/features/home/controller/states.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context , state){},
      builder: (context , state)
      {
        HomeCubit cubit = HomeCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.product != null,
            builder: (context) => ListView.separated(
                itemBuilder: (context , index) => BuildProducts(product: cubit.product!, index: index,),
                separatorBuilder: (context , index) => SizedBox(height: 10.h,),
                itemCount: cubit.product!.products.length),
            fallback: (context) => const Center(child: CircularProgressIndicator(color: mainColor,))
        );
      },
    );

  }
}
