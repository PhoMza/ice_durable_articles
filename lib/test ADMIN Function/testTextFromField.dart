import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestTextFromField extends StatefulWidget {
  const TestTextFromField({super.key});

  @override
  State<TestTextFromField> createState() => Test_TextFromFieldState();
}

class Test_TextFromFieldState extends State<TestTextFromField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Text From Field"),
      ),
      body: Column(
        children: [
          TextFormField(
            // focusNode: FocusNode(),
            // keyboardType: keyboardTypeText,
            // controller: _noteController,
            decoration: InputDecoration(
              hintText: "กรุณากรอกหมายเหตุ",
              hintStyle: TextStyle(
                fontSize: 20,
              ),
              // contentPadding: EdgeInsets.symmetric(vertical: 20),
              // border: OutlineInputBorder(
              // borderRadius: BorderRadius.circular(20),
            ),
            // alignLabelWithHint: true,
          ),
          // textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}
