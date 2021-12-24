import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constant/shared_color.dart';
import 'package:flutter_task/core/constant/shared_object.dart';
import 'package:flutter_task/core/network/local/chache_helper.dart';
import 'package:flutter_task/core/theme/darkmode/cubitdark.dart';
import 'package:flutter_task/features/home/view/home_layot.dart';
import 'package:flutter_task/features/login/controller/cubit.dart';
import 'package:flutter_task/features/login/controller/status.dart';
import 'package:flutter_task/features/register/view/register.dart';
//ignore: must_be_immutable
class Login extends StatelessWidget {
    Login({Key? key}) : super(key: key);

   var emailController = TextEditingController();

   var passwordController = TextEditingController();

   var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit , LoginStatus>(
        listener: (context , state)async
        {
          if(state is SuccessLoginState)
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
          LoginCubit cubit = LoginCubit.get(context);
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
                padding:  EdgeInsets.symmetric(horizontal: 8.0.h),
                child: Column(
                  children: [
                    Image.asset('assets/images/login.jpg'),
                    Text(
                        'LOGIN',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 25.sp
                        )
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        'login now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey
                        )
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'user must not empty';
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
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: cubit.isVisible,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value)
                      {
                        if(formKey.currentState!.validate())
                        {
                          // LoginCubit.UserLogin(
                          //     email: EmailController.text,
                          //     password: PasswordController.text);
                        }
                      },
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
                    ConditionalBuilder(
                      condition: state is !LoadingLoginState,
                      builder: (BuildContext context)
                      { return Center(
                        child: ElevatedButton(
                            onPressed: (){
                              if(formKey.currentState!.validate())
                              {
                                cubit.loginUser(
                                    userName: emailController.text,
                                    password: passwordController.text
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r)
                                )
                            ),
                            child:  const Center(
                              child: Text(
                                  'LOGIN'
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                            'Don\'t have an account?'
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Register())
                              );
                            },
                            child: const Text('REGISTER'))
                      ],
                    )
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
