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
      debugPrint("jumlah: $jumlah");
      debugPrint("harga: $harga");
      total = harga * jumlah;
      alltotal = total + alltotal;
      setState(() {});
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

  get refrest {
    update();
  }

  @override
  void initState() {
    int alltotal = 0;
    hitungTotal();

    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
