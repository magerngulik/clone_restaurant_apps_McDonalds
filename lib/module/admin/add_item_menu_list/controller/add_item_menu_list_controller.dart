import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/add_item_menu_list_view.dart';

class AddItemMenuListController extends State<AddItemMenuListView> implements MvcController {
  static late AddItemMenuListController instance;
  late AddItemMenuListView view;

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