import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/add_menu_item_view.dart';

class AddMenuItemController extends State<AddMenuItemView>
    implements MvcController {
  static late AddMenuItemController instance;
  late AddMenuItemView view;
  String? title;
  String? price;
  String? image;
  String? selectedMenu;

  addDataItemMenu() async {
    debugPrint("title: $title");
    debugPrint("price: $price");
    debugPrint("image: $image");
    debugPrint("selectedMenu: $selectedMenu");

    if (title == "" || title == null) {
      const snackBar = SnackBar(
        content: Text('Title belum di masukan!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (price == "" || price == null) {
      const snackBar = SnackBar(
        content: Text('Price belum di masukan!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (image == "" || image == null) {
      const snackBar = SnackBar(
        content: Text('Gambar belum di masukan!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (selectedMenu == "" || selectedMenu == null) {
      const snackBar = SnackBar(
        content: Text('Menu belum di pilih!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    try {
      await FirebaseFirestore.instance.collection("menu_item").add({
        "menu_title": title,
        "photo": image,
        "price": price,
        "date_created": DateTime.now(),
        "uid": selectedMenu,
      });
      Get.back();
    } catch (e) {
      debugPrint("Status: Gagal Menambahkan");
    }
  }

  get refresh {
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
