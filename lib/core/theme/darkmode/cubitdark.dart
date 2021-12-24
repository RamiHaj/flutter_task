import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/constant/shared_object.dart';
import 'package:flutter_task/core/network/local/chache_helper.dart';
import 'package:flutter_task/core/theme/darkmode/statusdark.dart';


class NewsCubitDark extends Cubit<NewsDarkStatus>
{
  NewsCubitDark() : super(NewsInitialDarkState());

  static NewsCubitDark get(context) => BlocProvider.of(context);


  Future<void> changeMode({bool? fromShared}) async {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeModeStatus());
    }
    else {
      isDark = !isDark;
      ChachedHelper.setData(key: "isDark", value: isDark).then((value) {
        emit(NewsChangeModeStatus());
      });
    }
  }
}