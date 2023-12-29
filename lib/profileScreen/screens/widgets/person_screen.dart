import 'package:flutter/material.dart';
import 'package:ice_durable_articles/profileScreen/screens/profile_screen_Admin.dart';
import 'package:ice_durable_articles/profileScreen/screens/widgets/add_person.dart';
import 'package:ice_durable_articles/profileScreen/screens/widgets/edit_person.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/text_strings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PersonScreenAD extends StatelessWidget {
  const PersonScreenAD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreenAD()));
              },
              icon: const Icon(LineAwesomeIcons.angle_left)),
          centerTitle: true,
          title: Text(
            tPerson,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: tRedColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: "เพิ่มบุคลากร",
                icon: Icons.assignment_add,
                textColor: tBlackColor,
                endIcon: true,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddPersonScreen()));
                },
              ),
              ProfileMenuWidget(
                title: "รายชื่อบุคลากร",
                icon: Icons.account_circle_outlined,
                textColor: tBlackColor,
                endIcon: true,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "เปลี่ยนรหัสผ่านบุคลากร",
                icon: Icons.key,
                textColor: tBlackColor,
                endIcon: true,
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditPerson()));
                },
              ),
            ],
          ),
        ));
  }
}
