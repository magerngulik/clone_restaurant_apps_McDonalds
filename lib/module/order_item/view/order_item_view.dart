import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

class OrderItemView extends StatefulWidget {
  const OrderItemView({Key? key}) : super(key: key);

  Widget build(context, OrderItemController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("OrderItem"),
        actions: const [],
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
                  var item =
                      FormMainMenuController.instance.orderSelected[index];
                  var harga = int.parse(item["price"].toString());
                  var jumlah = int.parse(item["jumlah"].toString());
                  var total = harga * jumlah;
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
    );
  }

  @override
  State<OrderItemView> createState() => OrderItemController();
}
