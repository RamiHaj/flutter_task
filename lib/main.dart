import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constant/shared_object.dart';
import 'package:flutter_task/core/theme/darkmode/cubitdark.dart';
import 'package:flutter_task/core/theme/darkmode/statusdark.dart';
import 'package:flutter_task/features/home/controller/cubit.dart';
import 'package:flutter_task/features/home/view/home_layot.dart';
import 'package:flutter_task/features/login/view/login.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bloc_observer.dart';
import 'core/network/local/chache_helper.dart';
import 'core/network/remote/dio_helper.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'features/home/model/transaction.dart';
import 'features/on_boarding/view/on_boarding.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ChachedHelper.init();
  await DioHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transaction');
  Bloc.observer = MyBlocObserver();
  dynamic onBoardingFinish = false;
  onBoardingFinish =ChachedHelper.getData(key: 'onBoarding');
  dynamic onLoggedFinish = false;
  onLoggedFinish = ChachedHelper.getData(key: 'isLog');
  late Widget start;
  if(onBoardingFinish != null){
    if(onLoggedFinish == null)
    {
      start = Login();
    }else
    {
      start = const HomeLayot();
    }
  }else
  {
    start = const OnBoarding();
  }
  runApp( MyApp(startApp: start,));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.startApp}) : super(key: key);
  final Widget startApp;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..getProducts()),
        BlocProvider(create: (context) => NewsCubitDark()..changeMode(fromShared: isDark)),
      ],
      child: BlocConsumer<NewsCubitDark , NewsDarkStatus>(
        listener: (context , state){},
        builder: (context , state)
        {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            builder:()=> MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              home: startApp,
            ),
          );
        },
      ),
    );
  }
}


