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
        actions: const [],
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
                          Container(
                            height: 125.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "${item['photo1']}",
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(
                                  10.0,
                                ),
                              ),
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