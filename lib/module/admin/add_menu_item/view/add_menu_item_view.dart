import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/shared/widget/button/button.dart';
import 'package:fhe_template/shared/widget/textfield/textfield.dart';
import 'package:flutter/material.dart';
import '../../../../shared/widget/image_picker/image_picker.dart';
import '../controller/add_menu_item_controller.dart';

class AddMenuItemView extends StatefulWidget {
  const AddMenuItemView({Key? key}) : super(key: key);

  Widget build(context, AddMenuItemController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Tambah Menu Baru"),
        actions: const [
          ImageIcon(
            NetworkImage(
              "https://cdn.pixabay.com/photo/2021/09/22/17/17/mcdonalds-6647433_1280.png",
            ),
            size: 24.0,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExTextField(
                id: "title_menu",
                label: "Title",
                onChanged: (value) {
                  controller.title = value;
                },
              ),
              ExTextField(
                id: "price",
                label: "Price",
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  controller.price = text;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: QimagePicker(
                  onChanged: (value) {
                    controller.image = value;
                  },
                  label: "Photo product",
                  value: "https://i.ibb.co/S32HNjD/no-image.jpg",
                  id: "photo",
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 40.0,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("menu_list")
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
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> item =
                            (data.docs[index].data() as Map<String, dynamic>);
                        item["id"] = data.docs[index].id;
                        return InkWell(
                          onTap: () {
                            controller.selectedMenu = item["id"];
                            controller.refresh;
                          },
                          child: Container(
                            width: 100.0,
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.only(right: 10.0),
                            decoration: BoxDecoration(
                              border: (controller.selectedMenu == item['id'])
                                  ? Border.all(
                                      width: 2.0,
                                      color: Colors.grey[900]!,
                                    )
                                  : const Border(),
                              color: Colors.red[400],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${item["menu_name"]}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ExButton(
                onPressed: () {
                  controller.addDataItemMenu();
                  controller.refresh;
                },
                label: "SIMPAN",
                fontSize: 18,
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<AddMenuItemView> createState() => AddMenuItemController();
}
