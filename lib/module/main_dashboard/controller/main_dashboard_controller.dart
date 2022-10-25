import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/main_dashboard_view.dart';

class MainDashboardController extends State<MainDashboardView> implements MvcController {
  static late MainDashboardController instance;
  late MainDashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}