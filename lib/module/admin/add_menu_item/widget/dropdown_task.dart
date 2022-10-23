import 'package:flutter/material.dart';

class DropdownTask extends StatefulWidget {
  final String value;
  final Function(String value) onChanged;
  final String? label;
  final List<String>? listitem;

  const DropdownTask({
    Key? key,
    required this.value,
    required this.onChanged,
    this.label,
    this.listitem,
  }) : super(key: key);

  @override
  State<DropdownTask> createState() => _DropdownTaskState();
}

class _DropdownTaskState extends State<DropdownTask> {
  @override
  Widget build(BuildContext context) {
    List<String> list = widget.listitem as List<String>;
    String dropdownValue = widget.listitem![0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 4.0,
                right: 4.0,
                top: 4.0,
                bottom: 4.0,
              ),
              child: Text(
                widget.label!,
              ),
            ),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            dropdownColor: Colors.white,
            icon: const Icon(Icons.select_all),
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            onChanged: (String? value) {
              dropdownValue = value!;
              widget.onChanged(dropdownValue);
              debugPrint("variableName: $dropdownValue");
              setState(() {});
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
