import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

class DetailMenuOrderController extends State<DetailMenuOrderView>
    implements MvcController {
  static late DetailMenuOrderController instance;
  late DetailMenuOrderView view;

  addToCompleateOrder() {
    // debugPrint("variableName: ${view.item}");
    String id = view.item!["id"];
    debugPrint("id Doc: $id");
    MenuServices.addCompleteOrder(item: view.item as Map);
    MenuServices.deleteMenuOrder(id);
    Get.back();
    // https://i.ibb.co/7bNdx0w/17924.jpg
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
