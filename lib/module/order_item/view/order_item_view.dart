import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

class OrderItemView extends StatefulWidget {
  const OrderItemView({Key? key}) : super(key: key);

  Widget build(context, OrderItemController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Daftar pesanan"),
        actions: [
          IconButton(
            onPressed: () {
              controller.deleteAll();
            },
            icon: const Icon(
              Icons.delete_forever_sharp,
              size: 24.0,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListView.builder(
                itemCount: FormMainMenuController.instance.orderSelected.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (FormMainMenuController.instance.orderSelected.isEmpty) {
                    return Container(
                      color: Colors.red,
                      height: 100,
                      width: 200,
                      child: const Center(
                          child: Text(
                        "Belum ada data",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )),
                    );
                  }
                  var item =
                      FormMainMenuController.instance.orderSelected[index];
                  var harga = int.parse(item["price"].toString());
                  var jumlah = int.parse(item["jumlah"].toString());
                  int total = harga * jumlah;

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                          "${item["photo"]}",
                        ),
                      ),
                      title: Text("${item["title"]}"),
                      subtitle: Text("${item["price"]} x ${item["jumlah"]}"),
                      trailing: Text("$total"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20.0,
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      (FormMainMenuController.instance.orderSelected.isEmpty)
                          ? Colors.grey
                          : Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {
                  if (FormMainMenuController.instance.orderSelected.isEmpty) {
                    return;
                  }
                  controller.tambahPesanan();
                },
                child: const Text("Buat Pesanan"),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    SelectServiceController.instance.serviceSelected,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Total: ${controller.allOrderPrice}",
                    style: const TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    SelectPaymentController.instance.paymentSelected,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<OrderItemView> createState() => OrderItemController();
}
