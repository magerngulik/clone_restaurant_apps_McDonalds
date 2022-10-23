import 'package:fhe_template/module/select_payment/view/select_payment_view.dart';
import 'package:flutter/material.dart';
import '../controller/select_service_controller.dart';
import '../widget/card_select_service.dart';

class SelectServiceView extends StatefulWidget {
  const SelectServiceView({Key? key}) : super(key: key);

  Widget build(context, SelectServiceController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100.0,
            ),
            Image.network(
              "https://cdn.pixabay.com/photo/2021/09/22/17/17/mcdonalds-6647433_1280.png",
              width: 128.0,
              height: 128.0,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 70.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    controller.serviceSelected = "Makan di sini";
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectPaymentView()),
                    );
                  },
                  child: CardSelectService(
                    image:
                        "https://bigbytes.express/wp-content/uploads/2021/07/CHEESY-BURGER-MCDO-WITH-DRINK-AND-FRIES-1024x819.jpg",
                    title: (controller.status == false)
                        ? "MAKAN DI SINI"
                        : "EAT HERE",
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                InkWell(
                  onTap: () {
                    controller.serviceSelected = "Bawa pulang";
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectPaymentView()),
                    );
                  },
                  child: CardSelectService(
                    image:
                        "https://www.whiteboardjournal.com/wp-content/uploads/2018/04/Unknown-3.jpeg",
                    title: (controller.status == false)
                        ? "BAWA PULANG"
                        : "TAKE IT HOME",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              label: Text(
                (controller.status == false) ? "English" : "Indonesia",
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
              onPressed: () {
                var getStatus = controller.status;
                controller.status = !getStatus;
                controller.refresh;
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<SelectServiceView> createState() => SelectServiceController();
}
