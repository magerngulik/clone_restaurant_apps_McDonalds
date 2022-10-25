import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../controller/order_compleate_controller.dart';

class OrderCompleateView extends StatefulWidget {
  const OrderCompleateView({Key? key}) : super(key: key);

  Widget build(context, OrderCompleateController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Order Completed"),
        actions: const [
          ImageIcon(
            NetworkImage(
              "https://cdn.pixabay.com/photo/2021/09/22/17/17/mcdonalds-6647433_1280.png",
            ),
            size: 30.0,
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("complete_order")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No Data");
                  }
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item =
                          (data.docs[index].data() as Map<String, dynamic>);
                      item["id"] = data.docs[index].id;
                      int no = index + 1;
                      var itemDetail = item['item_order']['Total Price'];
                      var date = item["created_at"]?.toDate();

                      var dateline =
                          "${date.day} - ${date.month} - ${date.year}";
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            child: Text(
                              "$no",
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text("$itemDetail"),
                          subtitle: Text(dateline),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<OrderCompleateView> createState() => OrderCompleateController();
}
