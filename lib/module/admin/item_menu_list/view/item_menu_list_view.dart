import 'package:flutter/material.dart';
import '../controller/item_menu_list_controller.dart';

class ItemMenuListView extends StatefulWidget {
  const ItemMenuListView({Key? key}) : super(key: key);

  Widget build(context, ItemMenuListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ItemMenuList"),
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
  State<ItemMenuListView> createState() => ItemMenuListController();
}