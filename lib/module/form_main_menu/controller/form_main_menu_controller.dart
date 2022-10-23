import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/services/menu_services.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/form_main_menu_view.dart';

class FormMainMenuController extends State<FormMainMenuView>
    implements MvcController {
  static late FormMainMenuController instance;
  late FormMainMenuView view;
  var selectedMenu = "";

  addDataMenu() async {
    for (var i = 0; i < MenuServices.menu_list.length; i++) {
      var item = MenuServices.menu_list[i];
      await FirebaseFirestore.instance.collection("menu_list").add({
        "menu_name": item['menu_name'],
        "img_photo": item['img_photo'],
      });
    }
  }

  addDataItemMenu(String uid) async {
    try {
      await FirebaseFirestore.instance.collection("menu_item").add({
        "menu_title": "Himalayan Latte Frappe",
        "photo":
            "https://www.mcdelivery.co.id/id/static/1666452811275/assets/62/products/100220.png?",
        "price": 43000,
        "date_created": DateTime.now(),
        "uid": uid,
      });
    } catch (e) {}
  }

  get refrest {
    update();
  }

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
