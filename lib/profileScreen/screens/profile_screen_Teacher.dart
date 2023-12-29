import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ice_durable_articles/routes.dart';
// import 'package:ice_durable_articles/screen/listview_admin.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/image_strings.dart';
import 'package:ice_durable_articles/src/size_strings.dart';
import 'package:ice_durable_articles/src/text_strings.dart';
import 'package:ice_durable_articles/utils_of_login/shared_prefs.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreenTC extends StatelessWidget {
  const ProfileScreenTC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => ListviewAdmin()));
        //     },
        //     icon: const Icon(LineAwesomeIcons.angle_left)),
        centerTitle: true,
        title: Text(
          tProfileTeacher,
          style: TextStyle(color: Colors.white,fontSize: tMediumSize),
        ),
        backgroundColor: tRedColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: AssetImage(tProfileImage),
                      )),
                ),
                // pencil
                Positioned(
                  bottom: 0,
                  right: 1,
                  child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: tRedColor,
                      ),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        size: 20.0,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              tProfileHeading,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              tProfileSubHeading,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: tRedColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text(
                  tEditProfile,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(), //แบ่งฉซน จัดให้อยู่ตรงกลาง
            const SizedBox(height: 10),

            //
            ProfileMenuWidget(
              title: tMenu1,
              icon: LineAwesomeIcons.user,
              textColor: tBlackColor,
              endIcon: true,
              onPress: () {},
            ),
            // ProfileMenuWidget(
            //   title: tMenu2,
            //   icon: LineAwesomeIcons.user_cog,
            //   textColor: tBlackColor,
            //   endIcon: true,
            //   onPress: () {},
            // ),
            // ProfileMenuWidget(
            //   title: tListStudent,
            //   icon: LineAwesomeIcons.clipboard_list,
            //   textColor: tBlackColor,
            //   endIcon: true,
            //   onPress: () {},
            // ),
            const Divider(),
            ProfileMenuWidget(
              title: "เปลี่ยนรหัสผ่าน",
              icon: LineAwesomeIcons.lock,
              textColor: tBlackColor,
              endIcon: true,
              onPress: () {},
            ),
           ProfileMenuWidget(
              title: "ออกจากระบบ",
              icon: LineAwesomeIcons.alternate_sign_out,
              textColor: tBlackColor,
              endIcon: true,
              onPress: () {
                //logout ออกจากระบบ
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("ออกจากระบบ ?"),
                    content: Text("คุณต้องการออกจากระบบใช่ไหม ?"),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: tRedColor),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("ยกเลิก"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: tGreenColor),
                        onPressed: () async {
                          await SharedPerfs().removeUser();
                          Get.offAllNamed(GetRoutes.login);
                        },
                        child: Text("ยืนยัน"), // login
                      ),
                    ],
                  ),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    //เพื่อแก้ไขแต่ละช่อง
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });
//กำหนด ฟังก์ชั่น สำหรับ แก้ไขแต่ละส่วน
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: tRedColor.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: tRedColor,
          ),
        ),
        title: Text(
          title,
          style:
              Theme.of(context).textTheme.titleMedium?.apply(color: textColor),
        ),
        //ส่วนช้างหลัง
        trailing: endIcon
            ? Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                alignment: Alignment.center,
                // child: const Icon(LineAwesomeIcons.cog),
                child: Icon(
                  LineAwesomeIcons.angle_right,
                  size: 18.0,
                  color: Colors.grey,
                ))
            : null);
  }
}
