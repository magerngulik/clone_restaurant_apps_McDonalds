import 'package:flutter/material.dart';
import '../controller/detail_menu_order_controller.dart';

class DetailMenuOrderView extends StatefulWidget {
  Map? item;
  DetailMenuOrderView({this.item, Key? key}) : super(key: key);

  Widget build(context, DetailMenuOrderController controller) {
    controller.view = this;
    var itemList = item!['items'] as List;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Detail Menu Order"),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  enabled: false,
                  initialValue: "${item!['Total Price']}",
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'Total price',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  enabled: false,
                  initialValue: "${item!['select_payment']}",
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'Jenis pembayaran',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 11),
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Menu pesanan",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
              ListView.builder(
                itemCount: itemList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var itemLists = itemList[index];
                  var jumlah = itemLists['jumlah'];
                  var harga = itemLists['price'];
                  var total = jumlah * harga;
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                          "${itemLists['photo']}",
                        ),
                      ),
                      title: Text(
                        "${itemLists['title']}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                          "${itemLists['jumlah']} x ${itemLists['price']}"),
                      trailing: Text(
                        "$total",
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
          onPressed: () {
            controller.addToCompleateOrder();
          },
          child: const Text("Proses Order"),
        ),
      ),
    );
  }

  @override
  State<DetailMenuOrderView> createState() => DetailMenuOrderController();
}
