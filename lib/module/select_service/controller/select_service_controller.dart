import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../../waiting/controller/waiting_controller.dart';
import '../view/select_service_view.dart';

class SelectServiceController extends State<SelectServiceView>
    implements MvcController {
  static late SelectServiceController instance;
  late SelectServiceView view;
  bool status = false;
  var testExample = WaitingController.instance.test;
  String serviceSelected = "";

  var selectedMenu = [
    {
      "image": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "title_ind": "MAKAN DI SINI",
      "title_eng": "eat hear"
    },
    {
      "image": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "title": "BAWA PULANG",
      "title_eng": "take away"
    },
  ];

  get refresh {
    setState(() {});
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
