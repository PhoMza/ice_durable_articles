import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = "";
  String _email = "";

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  void _getProfile() async {
    // เรียก API จาก PHP
    final response = await http.get(Uri.parse("http://172.20.10.3/ice_project/profile.php?id=29"));

    // แปลงข้อมูล JSON
    final users = json.decode(response.body);

    // ตั้งค่าค่าเริ่มต้น
    _name = users["name"];
    _email = users["email"];

    // อัปเดต UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_name),
            Text(_email),
          ],
        ),
      ),
    );
  }
}
 

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   String _name = "";
//   String _email = "";

//   @override
//   void initState() {
//     super.initState();
//     _getProfile();
//   }

//   void _getProfile() async {
//     // เรียก API จาก PHP
//     final response = await http.get(Uri.parse("http://10.0.101.125/ice_project/profile.php?id=28"));  // ตั้งค่า URL

//     // แปลงข้อมูล JSON
//     final users = json.decode(response.body);

//     // ตั้งค่าค่าเริ่มต้น
//     _name = users["name"];
//     _email = users["email"];

//     // อัปเดต UI
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_name),
//             Text(_email),
//           ],
//         ),
//       ),
//     );
//   }
// }
