import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/network/local/chache_helper.dart';
import 'package:flutter_task/features/login/view/login.dart';
import 'package:flutter_task/features/on_boarding/controller/states.dart';
import 'package:flutter_task/features/on_boarding/model/boarding_model.dart';

class BoardingCubit extends Cubit<BoardingStatus>
{
  BoardingCubit() : super(InitialBoardingState());

  static BoardingCubit get(context) => BlocProvider.of(context);

  var boardController = PageController();

  List<BoradingModel> borading =
  [
    BoradingModel(
        images: 'assets/images/shop.jpg',
        title: 'OnTitle1',
        body: 'OnBorading1'
    ),
    BoradingModel(
        images: 'assets/images/shop1.jpg',
        title: 'OnTitle2',
        body: 'OnBorading2'
    ),
    BoradingModel(
        images: 'assets/images/shop2.jpg',
        title: 'OnTitle3',
        body: 'OnBorading3'
    ),
  ];

  bool isLast= false;

  void changeIndexPageView(int index)
  {
    if(index == borading.length - 1)
    {
      isLast = true;
      emit(SuccessChangeIndex());
    }else
    {
      isLast = false;
      emit(SuccessChangeIndex());
    }
  }

  void changeIndexFloatingButton(context)
  {
    if(isLast)
    {
      submit(context);
    }else
    {
      boardController.nextPage(
          duration: const Duration(microseconds: 750),
          curve: Curves.fastLinearToSlowEaseIn);
    }
  }

  void submit(context)async
  {
    var value =await ChachedHelper.setData(key: 'onBoarding', value: true);
    if(value)
    {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Login()),
              (route) => false);
    }
  }
}