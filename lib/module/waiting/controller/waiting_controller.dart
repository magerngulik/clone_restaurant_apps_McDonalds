import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/waiting_view.dart';

class WaitingController extends State<WaitingView> implements MvcController {
  static late WaitingController instance;
  late WaitingView view;

  var test = "ini tesh";

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
