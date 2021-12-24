import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constant/shared_color.dart';
import 'package:flutter_task/core/utils/build_boarding.dart';
import 'package:flutter_task/features/on_boarding/controller/cubit.dart';
import 'package:flutter_task/features/on_boarding/controller/states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoardingCubit(),
      child: BlocConsumer<BoardingCubit , BoardingStatus>(
        listener: (context , state){},
        builder: (context , state)
        {
          BoardingCubit cubit = BoardingCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                TextButton(
                    onPressed: ()
                    {
                      cubit.submit(context);
                    },
                    child: const Text(
                      'SKIP',
                    )
                )
              ],
            ),
            body: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0.h),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: cubit.boardController,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (int index)
                      {
                        cubit.changeIndexPageView(index);
                      },
                      itemBuilder: (context , index) => BuildBoardingItem(boradingModel: cubit.borading[index],),
                      itemCount: cubit.borading.length,
                    ),
                  ),
                   SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                          controller: cubit.boardController,
                          effect: const ExpandingDotsEffect(
                              activeDotColor: mainColor,
                              dotColor: Colors.grey,
                              dotHeight: 10,
                              dotWidth: 10,
                              spacing: 5,
                              expansionFactor: 4
                          ),
                          count: cubit.borading.length),
                      const Spacer(),
                      FloatingActionButton(
                          onPressed: ()
                          {
                            cubit.changeIndexFloatingButton(context);
                          },
                          child : const Icon(Icons.arrow_forward_ios_outlined)
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
