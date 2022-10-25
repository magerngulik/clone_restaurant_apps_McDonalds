import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

import '../../detail_item/view/order_compleate.dart';

class OrderItemController extends State<OrderItemView>
    implements MvcController {
  static late OrderItemController instance;
  late OrderItemView view;
  int totalPriceOrder = 0;
  int allOrderPrice = 0;
  bool statusAdd = false;
  jumlah() {
    for (var i = 0;
        i < FormMainMenuController.instance.orderSelected.length;
        i++) {
      var item = FormMainMenuController.instance.orderSelected[i];
      int harga = item['price'];
      int qty = item['jumlah'];
      debugPrint("qty: $qty");
      debugPrint("harga: $harga");
      setState(() {});
      int total = harga * qty;
      allOrderPrice = total + allOrderPrice;
    }
  }

  deleteAll() async {
    bool confirm = false;
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(30.0),
          child: Wrap(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Warning",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Apakah anda ingin menghapus daftar pesanan anda?',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[600],
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("No"),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            confirm = true;
                            Navigator.pop(context);
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
    if (confirm) {
      FormMainMenuController.instance.orderSelected.clear();
      FormMainMenuController.instance.alltotal = 0;
      FormMainMenuController.instance.refrest;
      allOrderPrice = 0;
      refresh;
      print("Confirmed!");
    }
  }

  tambahPesanan() async {
    debugPrint(
        "SelectService: ${SelectServiceController.instance.serviceSelected}");
    debugPrint(
        "SelectPayment: ${SelectPaymentController.instance.paymentSelected}");
    debugPrint("Total Price: $allOrderPrice");
    debugPrint("item: ${FormMainMenuController.instance.orderSelected}");

    try {
      await FirebaseFirestore.instance.collection("order_list").add({
        "select_service": SelectServiceController.instance.serviceSelected,
        "select_payment": SelectPaymentController.instance.paymentSelected,
        "Total Price": allOrderPrice,
        "items": FormMainMenuController.instance.orderSelected,
        "date_created": DateTime.now()
      });
      FormMainMenuController.instance.orderSelected.clear();
      FormMainMenuController.instance.alltotal = 0;
      FormMainMenuController.instance.refrest;

      Get.offAll(const CompleateStatus());
    } catch (e) {
      debugPrint("Status: Gagal memasukan data");
    }
  }

  get refresh {
    update();
  }

  @override
  void initState() {
    jumlah();
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
