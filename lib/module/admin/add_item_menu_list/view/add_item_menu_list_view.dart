import 'package:flutter/material.dart';
import '../controller/add_item_menu_list_controller.dart';

class AddItemMenuListView extends StatefulWidget {
  const AddItemMenuListView({Key? key}) : super(key: key);

  Widget build(context, AddItemMenuListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("AddItemMenuList"),
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
  State<AddItemMenuListView> createState() => AddItemMenuListController();
}