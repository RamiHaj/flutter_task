import 'package:flutter_task/core/network/local/chache_helper.dart';

bool isDark= ChachedHelper.getData(key: "isDark") ?? false;

bool isLogged = ChachedHelper.getData(key: "isLog") ?? false;