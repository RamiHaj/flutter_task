import 'package:flutter_task/features/home/model/transaction.dart';
import 'package:hive/hive.dart';

class Boxes
{
  static Box<Transaction> getTransactions() =>
      Hive.box<Transaction>('transaction');
}