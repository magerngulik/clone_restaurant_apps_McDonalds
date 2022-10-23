import 'package:fhe_template/module/form_main_menu/view/form_main_menu_view.dart';
import 'package:flutter/material.dart';
import '../controller/select_payment_controller.dart';
import '../widget/card_select_payment.dart';

class SelectPaymentView extends StatefulWidget {
  const SelectPaymentView({Key? key}) : super(key: key);

  Widget build(context, SelectPaymentController controller) {
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
                    controller.paymentSelected = "Non Tunai";
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormMainMenuView()),
                    );
                  },
                  child: CardSelectPayment(
                    image:
                        "https://s.kaskus.id/c320x320/images/fjb/2020/05/23/convert_ovo_point_dana_gopay_linkaja_shopeepay_menjadi_uang_tunai_2186220_1590245791.png",
                    title: (controller.status == false)
                        ? "BAYAR DI SINI NON TUNAI"
                        : "PAY HERE CASHLESS",
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                InkWell(
                  onTap: () {
                    controller.paymentSelected = "Tunai";
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormMainMenuView()),
                    );
                  },
                  child: CardSelectPayment(
                    image:
                        "https://www.seekpng.com/png/detail/135-1359149_donation-clipart-cash-payment-money-icon-round-png.png",
                    title: (controller.status == false)
                        ? "BAYAR DI KONTER TUNAI DAN NON TUNAI"
                        : "PAY AT COUNTER CASH & CASHLESS",
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
  State<SelectPaymentView> createState() => SelectPaymentController();
}
