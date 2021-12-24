import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constant/shared_color.dart';
import 'package:flutter_task/features/home/controller/cubit.dart';
import 'package:flutter_task/features/home/controller/states.dart';

class HomeLayot extends StatelessWidget {
  const HomeLayot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: BlocConsumer<HomeCubit , HomeStates>(
        listener: (context , state){},
        builder: (context , state)
        {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: AnimatedBottomNavigationBar(
              onTap: (index ) {
                cubit.changeindex(index);
              },
              activeIndex: cubit.currentIndex,
              icons:const [
                Icons.home,
                Icons.shopping_cart
              ],
              activeColor: mainColor,
              gapLocation: GapLocation.center,
              leftCornerRadius: 32.r,
              rightCornerRadius: 32.r,
            ),
          );
        },
      ),
    );
  }
}
