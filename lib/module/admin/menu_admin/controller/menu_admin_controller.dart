import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/menu_admin_view.dart';

class MenuAdminController extends State<MenuAdminView> implements MvcController {
  static late MenuAdminController instance;
  late MenuAdminView view;

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