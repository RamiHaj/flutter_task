import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_task/core/constant/end_points.dart';
import 'package:flutter_task/core/network/remote/dio_helper.dart';
import 'package:flutter_task/features/home/controller/states.dart';
import 'package:flutter_task/features/home/model/boxes.dart';
import 'package:flutter_task/features/home/model/product_model.dart';
import 'package:flutter_task/features/home/model/transaction.dart';
import 'package:flutter_task/features/home/view/page/products_screen.dart';
import 'package:flutter_task/features/home/view/page/shopping_screen.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [const ProductScreen(), const ShoppingScreen()];

  int currentIndex = 0;

  void changeindex(int index) {
    currentIndex = index;
    emit(ShopBottomIndexState());
  }

  Product? product;

  void getProducts() async {
    emit(LoadingGetProductState());
    try {
      Response value = await DioHelper.getData(url: allProducts);
      product = Product.fromjson(value.data);
      emit(SuccessGetProductState());
    } catch (error) {
      emit(ErrorGetProductState());
    }
  }

  final List<Transaction> transActions = [];

  Future addTransactios(String name, int price, double rate, String description,
      String image, String nameMar, String address) async {
    final transaction = Transaction()
      ..name = name
      ..price = price
      ..rate = rate
      ..description = description
      ..imageUrl = image
      ..nameMarket = nameMar
      ..address = address;
    final box = Boxes.getTransactions();
    box.add(transaction);
    await showNotification(
        title: 'flutter_task',
        body: 'new product has been added successfully',
        payLoad: 'flutter_task.abs'
    );
    emit(SuccessAddHiveState());
  }

  void deleteTransactions(Transaction transaction)async {
    transaction.delete();
    await showNotification(
        title: 'flutter_task',
        body: ' product has been deleted successfully',
        payLoad: 'flutter_task.abs'
    );
    emit(SuccessDeleteHiveState());
  }

  static final notification = FlutterLocalNotificationsPlugin();

  static Future notificationDetails()async
  {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
          'channelId',
          'channelName',
          channelDescription: 'channelDescription',
          importance: Importance.max,
          icon: '@mipmap/ic_launcher'
      ),
      //iOS: IOSNotificationDetails()
    );
  }

  Future<void> showNotification({
  int id=0,
  String? title,
  String? body,
  String? payLoad,
})async
  {
    notification.show(id, title, body, await notificationDetails() , payload: payLoad);
    emit(SuccessSendNotificationState());
  }


}
