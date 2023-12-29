import 'package:flutter/material.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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
