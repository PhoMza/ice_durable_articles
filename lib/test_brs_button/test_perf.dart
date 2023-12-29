import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ice_durable_articles/api_model/user.dart';
import 'package:ice_durable_articles/utils_of_login/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestPerf extends StatefulWidget {
  const TestPerf({super.key});

  State<TestPerf> createState() => _TestPerfState();
}

class _TestPerfState extends State<TestPerf> {
  @override
  void initState() {
    checkUser();
    super.initState();
  }

  checkUser() async {
    var user = await SharedPerfs().getUser();
    print("CheckUser");
    print(user);
    // print(user["name"]);

    final parsedJson = json.decode(user);
    print(parsedJson['name']);
    print(parsedJson['role']);

    setState(() {
      user = parsedJson['user_id'];
      // Update the state with the parsedJson value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test Perf'),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Test Perf"),
            ],
          ),
        ));
  }
}
