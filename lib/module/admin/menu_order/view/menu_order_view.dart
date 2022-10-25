import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

class MenuOrderView extends StatefulWidget {
  const MenuOrderView({Key? key}) : super(key: key);

  Widget build(context, MenuOrderController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Menu Order List"),
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
                    .collection("order_list")
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
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailMenuOrderView(
                                      item: item,
                                    )),
                          );
                        },
                        child: Container(
                          height: 100.0,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Card(
                            child: ListTile(
                              title: Text(
                                "${item['select_service']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text("${item['select_payment']}",
                                  style: const TextStyle(fontSize: 18)),
                              trailing: Text("${item['Total Price']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
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
  State<MenuOrderView> createState() => MenuOrderController();
}
