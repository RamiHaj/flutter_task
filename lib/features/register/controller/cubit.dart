import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/constant/end_points.dart';
import 'package:flutter_task/core/network/remote/dio_helper.dart';
import 'package:flutter_task/features/register/controller/states.dart';
import 'package:flutter_task/features/register/model/register_model.dart';

class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit() : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;

  IconData suffix = Icons.visibility_off;

  void changeIcon()
  {
    isVisible = !isVisible;
    suffix = isVisible ? Icons.visibility_off : Icons.visibility;
    emit(ChangeIconState());
  }

  RegisterModel? registerModel;

  void registerUser({
  required String userName,
  required String password,
  required String fullName,
  required String phoneNumber,
  required String city,
})async
  {
    emit(LoadingRegisterState());
    try
    {
      Response value = await DioHelper.postData(
          url: register,
          data:
          {
            'userName':userName,
            'password':password,
            'fullName':fullName,
            'phoneNumber':phoneNumber,
            'city':city,
          }
      );
      registerModel = RegisterModel.fromJson(value.data);
      emit(SuccessRegisterState());
    }catch(error)
    {
      print(error.toString());
      emit(ErrorRegisterState());
    }
  }
}