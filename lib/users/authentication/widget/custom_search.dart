import 'package:flutter/material.dart';
import 'package:ice_durable_articles/src/color_strings.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key, required this.onChange});

  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3),
            blurRadius: 12,
          ),
        ],
      ),
      child: TextFormField(
        onChanged: (String val) {
          onChange(val);
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: const TextStyle(fontSize: 20, color: Colors.grey)),
      ),
    );
  }
}
