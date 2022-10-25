import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

void main() async {
  await initialize();

  // Widget mainView = const MenuAdminView();
  // Widget mainView = const DashboardView();
  // Widget mainView = const CompleateStatus();
  // Widget mainView = const WaitingView();
  Widget mainView = const MainDashboardView();
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
