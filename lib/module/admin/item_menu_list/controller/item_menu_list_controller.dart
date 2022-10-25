import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/item_menu_list_view.dart';

class ItemMenuListController extends State<ItemMenuListView> implements MvcController {
  static late ItemMenuListController instance;
  late ItemMenuListView view;

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