import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

class FormMainMenuView extends StatefulWidget {
  const FormMainMenuView({Key? key}) : super(key: key);

  Widget build(context, FormMainMenuController controller) {
    controller.view = this;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Main Screen",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuAdminView()),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 180.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.red[200],
                ),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      MenuServices.bennerMenu[index],
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: MenuServices.bennerMenu.length,
                  pagination: const SwiperPagination(),
                  autoplay: true,
                ),
              ),
              SizedBox(
                height: 430,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.0,
                      height: 650,
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
                            itemBuilder: (context, index) {
                              Map<String, dynamic> item = (data.docs[index]
                                  .data() as Map<String, dynamic>);
                              item["id"] = data.docs[index].id;
                              return InkWell(
                                onTap: () {
                                  controller.selectedMenu =
                                      item['id'].toString();
                                  controller.refrest;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: (controller.selectedMenu ==
                                              item['id'].toString())
                                          ? Colors.amber[50]
                                          : Colors.white,
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey[900]!,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          16.0,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Container(
                                          height: 75.0,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "${item['img_photo']}",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(
                                                10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${item['menu_name']}",
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    //bagian data menu list

                    Expanded(
                      child: SizedBox(
                        width: 100.0,
                        height: 430,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("menu_item")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) return const Text("Error");
                            if (snapshot.data == null) return Container();
                            if (snapshot.data!.docs.isEmpty) {
                              return const Text("No Data");
                            }
                            final data = snapshot.data!;
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              controller: ScrollController(),
                              child: SizedBox(
                                width: 100,
                                height: 430,
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 5,
                                  children: List.generate(
                                    data.docs.length,
                                    (index) {
                                      Map<String, dynamic> item =
                                          (data.docs[index].data()
                                              as Map<String, dynamic>);
                                      item["id"] = data.docs[index].id;
                                      if (controller.selectedMenu.isNotEmpty) {
                                        if (!item["uid"]
                                            .toString()
                                            .toLowerCase()
                                            .contains(controller.selectedMenu
                                                .toLowerCase())) {
                                          return Container();
                                        }
                                      }
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailItemView(
                                                      item: item,
                                                    )),
                                          );
                                        },
                                        child: Container(
                                          height: 120.0,
                                          width: 140.0,
                                          margin:
                                              const EdgeInsets.only(top: 10.0),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                5.0,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 80.0,
                                                width: 80.0,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        "${item['photo']}",
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(
                                                        5.0,
                                                      ),
                                                    )),
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                "${item['menu_title']}",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 140.0,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 25.0,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      " Pesanan Saya | ${controller.selectedService}",
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OrderItemView()),
                          );
                        },
                        child: const Text(
                          " Lihat Order",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[900]!,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total IDR ${controller.alltotal.toString()} | Item ${controller.orderSelected.length}",
                      style: const TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // <-- Radius
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Batalkan Pesanan"),
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      // controller.addDataMenu();
                    },
                    child: const Text("Selesai"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<FormMainMenuView> createState() => FormMainMenuController();
}
