import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject
{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int price;
  @HiveField(2)
  late double rate;
  @HiveField(3)
  late String description;
  @HiveField(4)
  late String imageUrl;
  @HiveField(5)
  late String nameMarket;
  @HiveField(6)
  late String address;
}