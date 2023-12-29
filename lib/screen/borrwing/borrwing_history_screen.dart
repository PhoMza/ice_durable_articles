import 'package:flutter/material.dart';
import 'package:ice_durable_articles/screen/borrwing/widgets/modelBottomSheetyClass.dart';
import 'package:ice_durable_articles/screen/borrwing/widgets/modelBottomSheetyMonth.dart';
import 'package:ice_durable_articles/screen/borrwing/widgets/modelBottomSheetyRoom.dart';
import 'package:ice_durable_articles/screen/borrwing/widgets/modelBottomSheetyYear.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/text_strings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HistoryBorrwingScreen extends StatefulWidget {
  const HistoryBorrwingScreen({super.key});

  @override
  State<HistoryBorrwingScreen> createState() => _HistoryBorrwingScreenState();
}

class _HistoryBorrwingScreenState extends State<HistoryBorrwingScreen> {
  void updatedValueYear(data) async {
    setState(() {
      sheetValue = data;
      tsheetValueYear = data;
    });
    Navigator.pop(context);
  }

  void updatedValueMonth(data) async {
    setState(() {
      sheetValue = data;
      tsheetValueMonth = data;
    });
    Navigator.pop(context);
  }

  void updatedValueClass(data) async {
    setState(() {
      sheetValue = data;
      tsheetValueClass = data;
    });
    Navigator.pop(context);
  }

  void updatedValueRoom(data) async {
    setState(() {
      sheetValue = data;
      tsheetValueRoom = data;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "ประวิตการยืมคืนครุภัณฑ์",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: tRedColor,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tRedColor,
                  ),
                  onPressed: () {},
                  child: ModelBottomSheetYear(
                    model: tsheetValueYear,
                    callbackFuntion: updatedValueYear,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tRedColor,
                    ),
                    onPressed: () {},
                    child: ModelBottomSheetMonth(
                      model: tsheetValueMonth,
                      callbackFuntion: updatedValueMonth,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tRedColor,
                    ),
                    onPressed: () {},
                    child: ModelBottomSheetClass(
                      model: tsheetValueClass,
                      callbackFuntion: updatedValueClass,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tRedColor,
                    ),
                    onPressed: () {},
                    child: ModelBottomSheetRoom(
                      model: tsheetValueRoom,
                      callbackFuntion: updatedValueRoom,
                    )),
              ),
            ],
          ),
          Container(

          )
        ],
        //     Divider(),
        //     HistoryProfile(
        //       title: "Somkiat Chukorn",
        //       icon: LineAwesomeIcons.tools,
        //       textColor: tBlackColor,
        //       endIcon: true,
        //       onPress: () {},
        //     ),
        //     Divider(),
        //     HistoryProfile(
        //       title: "Somkiat Chukorn",
        //       icon: LineAwesomeIcons.tools,
        //       textColor: tBlackColor,
        //       endIcon: true,
        //       onPress: () {},
        //     ),
        //     Divider(),
        //     HistoryProfile(
        //       title: "Somkiat Chukorn",
        //       icon: LineAwesomeIcons.tools,
        //       textColor: tBlackColor,
        //       endIcon: true,
        //       onPress: () {},
        //     ),
      ),
    );
  }
}

class HistoryProfile extends StatelessWidget {
  const HistoryProfile({
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
        //ส่วนข้างหลัง
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

// Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: tRedColor,
//                       ),
//                       onPressed: () {},
//                       child: ModelBottomSheetYear(
//                         model: tsheetValueYear,
//                         callbackFuntion: updatedValueYear,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: tRedColor,
//                         ),
//                         onPressed: () {},
//                         child: ModelBottomSheetMonth(
//                           model: tsheetValueMonth,
//                           callbackFuntion: updatedValueMonth,
//                         )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: tRedColor,
//                         ),
//                         onPressed: () {},
//                         child: ModelBottomSheetClass(
//                           model: tsheetValueClass,
//                           callbackFuntion: updatedValueClass,
//                         )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: tRedColor,
//                         ),
//                         onPressed: () {},
//                         child: ModelBottomSheetRoom(
//                           model: tsheetValueRoom,
//                           callbackFuntion: updatedValueRoom,
//                         )),
//                   ),
//                 ],
//               ),