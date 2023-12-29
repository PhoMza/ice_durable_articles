import 'package:flutter/material.dart';

class EditPassword extends StatelessWidget {
  const EditPassword({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 204, 36, 24),
        title: Text(

          "ข้อมูลบุคลากร",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 30,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              "สร้างรหัสผ่านใหม่",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "username",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 70,
              child: TextFormField(
                decoration: InputDecoration(
                  helperText: 'ใส่ username',
                  helperStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Password",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 70,
              child: TextFormField(
                decoration: InputDecoration(
                  helperText: 'ตั้งรหัสผ่าน ให้เกิน 8 ตัวอักษร',
                  helperStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Confirm Password",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 70,
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  helperText: 'ยืนยัน รหัสผ่านอีกครั้ง',
                  helperStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility_off),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
           SizedBox(height: 50,),
            Center(
              child: ElevatedButton(
                child: Text('ยืนยันการแก้ไข'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  fixedSize: Size(350, 70,),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  primary: Color.fromARGB(255, 204, 36, 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}