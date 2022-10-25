import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/menu_order_view.dart';

class MenuOrderController extends State<MenuOrderView> implements MvcController {
  static late MenuOrderController instance;
  late MenuOrderView view;

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