import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constant/shared_color.dart';
import 'package:flutter_task/core/constant/shared_object.dart';
import 'package:flutter_task/core/network/local/chache_helper.dart';
import 'package:flutter_task/core/theme/darkmode/cubitdark.dart';
import 'package:flutter_task/features/home/view/home_layot.dart';
import 'package:flutter_task/features/register/controller/cubit.dart';
import 'package:flutter_task/features/register/controller/states.dart';
//ignore: must_be_immutable
class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  var fullNameController = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  var cityController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit , RegisterStates>(
        listener: (context , state)async
        {
          if(state is SuccessRegisterState)
          {
            await ChachedHelper.setData(key: 'isLog', value: isLogged = true);
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeLayot())
            );
          }
        },
        builder: (context , state)
        {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: mainColor,
              actions: [
                IconButton(
                  onPressed: ()async{
                    await NewsCubitDark.get(context).changeMode();
                  },
                  icon: const Icon(Icons.brightness_6),
                )
              ],
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 8.0.h),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/register.jpg'),
                    Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w900
                        )
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        'register now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey
                        )
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'username must not empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'User Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      controller: fullNameController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Full Name must not empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_pin),
                          labelText: 'Full Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'phone must not empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
                          labelText: 'Phone',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: cubit.isVisible,
                      textInputAction: TextInputAction.next,
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'password must not empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: ()
                            {
                              cubit.changeIcon();
                            },
                            icon: Icon(
                                cubit.suffix
                            ),
                          ),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      controller: cityController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'city must not empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_on),
                          labelText: 'City',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ConditionalBuilder(
                      condition: state is !LoadingRegisterState,
                      builder: (BuildContext context)
                      { return Center(
                        child: ElevatedButton(
                            onPressed: (){
                              if(formKey.currentState!.validate())
                              {
                                cubit.registerUser(
                                    userName: nameController.text,
                                    password: passwordController.text,
                                    fullName: fullNameController.text,
                                    phoneNumber: phoneController.text,
                                    city: cityController.text
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r)
                                )
                            ),
                            child: const Center(
                              child: Text(
                                  'REGISTER'
                              ),
                            )),
                      );},
                      fallback: (BuildContext context) {
                        return const Center(child: CircularProgressIndicator(color: mainColor,));
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
