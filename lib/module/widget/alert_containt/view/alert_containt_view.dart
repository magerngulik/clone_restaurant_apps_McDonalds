import 'package:flutter/material.dart';
import '../controller/alert_containt_controller.dart';
import '../widget/HyperAlert.dart';

class AlertContaintView extends StatefulWidget {
  const AlertContaintView({Key? key}) : super(key: key);

  Widget build(context, AlertContaintController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("AlertContaint"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {
                  var snackbar = const SnackBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      duration: Duration(milliseconds: 1500),
                      content: ExAlertBasic(
                        message: "Its, error",
                        type: "basic-danger",
                      ));

                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                child: const Text("basic danger"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          var snackbar = const SnackBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              duration: Duration(milliseconds: 1500),
                              content: ExAlertBasic(
                                message: "Its, error",
                                type: "basic-danger",
                              ));

                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        child: const Text("basic danger"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          var snackbar = const SnackBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              duration: Duration(milliseconds: 1500),
                              content: ExAlertBasic(
                                message: "Its, error",
                                type: "basic-warning",
                              ));

                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        child: const Text("basic warning"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          var snackbar = const SnackBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              duration: Duration(milliseconds: 1500),
                              content: ExAlertBasic(
                                message: "Its, error",
                                type: "basic-info",
                              ));

                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        child: const Text("basic-info"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          var snackbar = const SnackBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              duration: Duration(milliseconds: 1500),
                              content: ExAlertBasic(
                                message: "Its, error",
                                type: "basic-success",
                              ));

                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        child: const Text("basic-success"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          var snackbar = const SnackBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              duration: Duration(milliseconds: 1500),
                              content: ExAlertBasic(
                                message: "Its, error",
                                type: "outline-danger",
                              ));

                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        child: const Text("outline danger"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          var snackbar = const SnackBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              duration: Duration(milliseconds: 1500),
                              content: ExAlertBasic(
                                message: "Its, error",
                                type: "outline-warning",
                              ));

                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        child: const Text("outline warning"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          var snackbar = const SnackBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              duration: Duration(milliseconds: 1500),
                              content: ExAlertBasic(
                                message: "Its, error",
                                type: "outline-info",
                              ));

                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        child: const Text("outline info"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          var snackbar = const SnackBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              duration: Duration(milliseconds: 1500),
                              content: ExAlertBasic(
                                message: "Its, error",
                                type: "outline-success",
                              ));

                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        child: const Text("outline success"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<AlertContaintView> createState() => AlertContaintController();
}
