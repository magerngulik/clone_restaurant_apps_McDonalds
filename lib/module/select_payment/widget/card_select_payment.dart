import 'package:flutter/material.dart';

class CardSelectPayment extends StatefulWidget {
  final String? image;
  final String? title;

  const CardSelectPayment({
    Key? key,
    this.image,
    this.title,
  }) : super(key: key);

  @override
  State<CardSelectPayment> createState() => _CardSelectPaymentState();
}

class _CardSelectPaymentState extends State<CardSelectPayment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.0,
          ),
        ),
      ),
      child: Card(
        elevation: 2,
        shadowColor: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 160,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "${widget.image}",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    5.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              "${widget.title}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
