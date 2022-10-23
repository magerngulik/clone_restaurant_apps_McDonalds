import 'package:fhe_template/module/select_service/controller/select_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/select_payment_view.dart';

class SelectPaymentController extends State<SelectPaymentView>
    implements MvcController {
  static late SelectPaymentController instance;
  late SelectPaymentView view;
  String paymentSelected = "";

  var status = SelectServiceController.instance.status;
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
