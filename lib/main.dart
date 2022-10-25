import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

import 'module/detail_item/view/order_compleate.dart';

void main() async {
  await initialize();

  // Widget mainView = const MenuAdminView();
  // Widget mainView = const DashboardView();
  Widget mainView = const CompleateStatus();
  runApp(
    MaterialApp(
      navigatorKey: Get.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: mainView,
    ),
  );
}
