import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/alert_containt_view.dart';

class AlertContaintController extends State<AlertContaintView> implements MvcController {
  static late AlertContaintController instance;
  late AlertContaintView view;

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