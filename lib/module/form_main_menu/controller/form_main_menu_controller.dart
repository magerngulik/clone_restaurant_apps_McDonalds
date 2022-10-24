import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

class FormMainMenuController extends State<FormMainMenuView>
    implements MvcController {
  static late FormMainMenuController instance;
  late FormMainMenuView view;
  var selectedMenu = "";
  String selectedService = SelectServiceController.instance.serviceSelected;
  List orderSelected = [];
  int total = 0;
  int alltotal = 0;

  hitungTotal() {
    for (var i = 0; i < orderSelected.length; i++) {
      var item = orderSelected[i];
      var harga = int.parse(item["price"].toString());
      var jumlah = int.parse(item["jumlah"].toString());
      total = harga * jumlah;
      alltotal = total + alltotal;
    }
  }

  addDataMenu() async {
    for (var i = 0; i < MenuServices.menu_list.length; i++) {
      var item = MenuServices.menu_list[i];
      await FirebaseFirestore.instance.collection("menu_list").add({
        "menu_name": item['menu_name'],
        "img_photo": item['img_photo'],
      });
    }
  }

  addDataToOrder(
      {required String uid,
      required String title,
      required int jumlah,
      required String foto,
      required int price}) {
    orderSelected.add({
      "uid_item": uid,
      "title": title,
      "jumlah": jumlah,
      "photo": foto,
      "price": price
    });
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
    hitungTotal();
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
