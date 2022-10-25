import 'package:flutter/material.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Menu Admin"),
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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: controller.menuList.length,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.menuList[index];
                  Widget menu = item['on_tap'] as Widget;
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => menu),
                      );
                    },
                    child: Container(
                      height: 150.0,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10.0,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          // Container(
                          //   height: 125.0,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //       image: NetworkImage(
                          //         "${item['photo1']}",
                          //       ),
                          //       fit: BoxFit.fitHeight,
                          //     ),
                          //     borderRadius: const BorderRadius.vertical(
                          //       top: Radius.circular(
                          //         10.0,
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0,
                                right: 20.0,
                                left: 20.0,
                                bottom: 10.0),
                            child: ImageIcon(
                              color: Colors.white,
                              NetworkImage(
                                "${item['photo1']}",
                              ),
                              size: 80.0,
                            ),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            "${item['menu_title']}",
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
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
          ],
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
