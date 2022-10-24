import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/order_item_view.dart';

class OrderItemController extends State<OrderItemView> implements MvcController {
  static late OrderItemController instance;
  late OrderItemView view;

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