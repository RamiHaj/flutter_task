import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/constant/end_points.dart';
import 'package:flutter_task/core/network/remote/dio_helper.dart';
import 'package:flutter_task/features/login/controller/status.dart';
import 'package:flutter_task/features/login/model/login_model.dart';

class LoginCubit extends Cubit<LoginStatus>
{
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);



  bool isVisible = true;

  IconData suffix = Icons.visibility_off;

  void changeIcon()
  {
    isVisible = !isVisible;
    suffix = isVisible ? Icons.visibility_off : Icons.visibility;
    emit(ChangeIcon());
  }

  LoginModel? loginModel;

  void loginUser({
  required String userName,
  required String password,
})async
  {
    emit(LoadingLoginState());
    try
    {
      var value = await DioHelper.postData(
          url: login,
          data:
          {
            'userName':userName,
            'password':password,
          }
      );
      loginModel = LoginModel.fromjson(value.data);
      emit(SuccessLoginState());
    }catch(error)
    {
      print(error.toString());
      emit(ErrorLoginState());
    }
  }

}