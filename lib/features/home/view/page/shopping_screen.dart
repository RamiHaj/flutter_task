import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/utils/build_shopping.dart';
import 'package:flutter_task/features/home/controller/cubit.dart';
import 'package:flutter_task/features/home/controller/states.dart';
import 'package:flutter_task/features/home/model/boxes.dart';
import 'package:flutter_task/features/home/model/transaction.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit , HomeStates>(
      listener: (context , state){},
      builder: (context , state){
        return Scaffold(
          body: ValueListenableBuilder<Box<Transaction>>(
            valueListenable: Boxes.getTransactions().listenable(),
            builder: (context , box , _)
            {
              final transactions = box.values.toList().cast<Transaction>();
              return BuildShopping(transaction: transactions,);
            },
          )
        );
      },
    );
  }
}
