import 'package:flutter/material.dart';

class ExAlertBasic extends StatefulWidget {
  final String? message;
  final String? type;
  final IconData? icon;

  const ExAlertBasic({
    Key? key,
    required this.message,
    required this.type,
    this.icon,
  }) : super(key: key);

  @override
  State<ExAlertBasic> createState() => _ExAlertBasicState();
}

class _ExAlertBasicState extends State<ExAlertBasic> {
  @override
  Widget build(BuildContext context) {
    var basicColor1 = const Color(0xffFFEAE9);
    var basicColor2 = const Color(0xffFFF4E7);
    var basicColor3 = const Color(0xffE5F8FE);
    var basicColor4 = const Color(0xffEEFCE5);

    var basicContaint1 = Colors.red;
    var basicContaint2 = Colors.orange;
    var basicContaint3 = Colors.blue;
    var basicContaint4 = Colors.green;

    var outlineColor1 = const Color(0xffE09FA3);
    var outlineColor2 = const Color(0xffD9B875);
    var outlineColor3 = const Color(0xffA6D2DF);
    var outlineColor4 = const Color(0xff92C372);

    Color? colorContainer;
    Color? colorContaint;
    Color? colorBorder;
    bool? statusBorder;

    switch (widget.type) {
      case "basic-danger":
        {
          colorContainer = basicColor1;
          statusBorder = false;
          colorContaint = basicContaint1;
        }
        break;

      case "basic-warning":
        {
          colorContainer = basicColor2;
          statusBorder = false;
          colorContaint = basicContaint2;
        }
        break;

      case "basic-info":
        {
          colorContainer = basicColor3;
          statusBorder = false;
          colorContaint = basicContaint3;
        }
        break;

      case "basic-success":
        {
          colorContainer = basicColor4;
          statusBorder = false;
          colorContaint = basicContaint4;
        }
        break;
      case "outline-danger":
        {
          colorContainer = Colors.white;
          statusBorder = true;
          colorContaint = basicContaint1;
          colorBorder = outlineColor1;
        }
        break;
      case "outline-warning":
        {
          colorContainer = Colors.white;
          statusBorder = true;
          colorContaint = basicContaint2;
          colorBorder = outlineColor2;
        }
        break;
      case "outline-info":
        {
          colorContainer = Colors.white;
          statusBorder = true;
          colorContaint = basicContaint3;
          colorBorder = outlineColor3;
        }
        break;
      case "outline-success":
        {
          colorContainer = Colors.white;
          statusBorder = true;
          colorContaint = basicContaint4;
          colorBorder = outlineColor4;
        }
        break;

      default:
        {
          colorContainer = basicColor1;
          statusBorder = false;
          colorContaint = basicContaint1;
        }
        break;
    }

    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        border: (statusBorder == true)
            ? Border.all(
                width: 2.0,
                color: colorBorder ?? Colors.red,
              )
            : const Border(),
        color: colorContainer,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 20.0,
          ),
          Icon(
            widget.icon ?? Icons.dangerous,
            size: 24.0,
            color: colorContaint,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            "${widget.message}",
            style: TextStyle(
              fontSize: 20.0,
              color: colorContaint,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
