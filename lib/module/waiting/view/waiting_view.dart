import 'package:fhe_template/module/select_service/view/select_service_view.dart';
import 'package:flutter/material.dart';
import '../controller/waiting_controller.dart';

class WaitingView extends StatefulWidget {
  const WaitingView({Key? key}) : super(key: key);

  Widget build(context, WaitingController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                color: Colors.red[200],
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://i.ibb.co/3pPYd14/freeban.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectServiceView()),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 40.0,
                    ),
                    Image.network(
                      "https://cdn.pixabay.com/photo/2021/09/22/17/17/mcdonalds-6647433_1280.png",
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.fill,
                    ),
                    const Spacer(),
                    const Text(
                      "Sentuh Untuk Mulai",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 50.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<WaitingView> createState() => WaitingController();
}
