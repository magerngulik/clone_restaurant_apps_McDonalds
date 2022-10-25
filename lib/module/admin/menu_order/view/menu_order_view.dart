import 'package:flutter/material.dart';
import '../controller/menu_order_controller.dart';

class MenuOrderView extends StatefulWidget {
  const MenuOrderView({Key? key}) : super(key: key);

  Widget build(context, MenuOrderController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("MenuOrder"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              //body
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<MenuOrderView> createState() => MenuOrderController();
}