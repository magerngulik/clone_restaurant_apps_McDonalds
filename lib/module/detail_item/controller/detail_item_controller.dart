import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

class DetailItemController extends State<DetailItemView>
    implements MvcController {
  static late DetailItemController instance;
  late DetailItemView view;
  int jmlOrder = 0;

  onOrder(String uid, String title, String foto, int price) {
    if (jmlOrder == 0) {
      const snackBar = SnackBar(
        content: Text('Masukan jumlah pesanan!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    debugPrint("uid: $uid");
    debugPrint("title: $title");
    debugPrint("foto: $foto");
    debugPrint("price: $price");

    FormMainMenuController.instance.addDataToOrder(
        uid: uid, title: title, jumlah: jmlOrder, foto: foto, price: price);
    FormMainMenuController.instance.refrest;
    Navigator.pop(context);
  }

  get minus {
    if (jmlOrder == 0) {
      return;
    }
    jmlOrder--;
  }

  get add {
    jmlOrder++;
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
