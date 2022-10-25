import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;

  var menuList = [
    {
      "photo1": "https://i.ibb.co/wYr63vw/cargo.png",
      "menu_title": "Menu Order",
      "on_tap": const MenuOrderView()
    },
    {
      "photo1": "https://i.ibb.co/4t3wzBk/product.png",
      "menu_title": "Menu Item",
      "on_tap": const MenuAdminView()
    },
    {
      "photo1": "https://i.ibb.co/HVDj3Dw/note.png",
      "menu_title": "Menu list",
      "on_tap": const ItemMenuListView()
    },
    {
      "photo1": "https://i.ibb.co/DC9rpXp/file.png",
      "menu_title": "Order compleate",
      "on_tap": const OrderCompleateView()
    },
  ];

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
