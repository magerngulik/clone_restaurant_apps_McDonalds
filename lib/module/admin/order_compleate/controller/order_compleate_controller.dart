import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/order_compleate_view.dart';

class OrderCompleateController extends State<OrderCompleateView> implements MvcController {
  static late OrderCompleateController instance;
  late OrderCompleateView view;

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