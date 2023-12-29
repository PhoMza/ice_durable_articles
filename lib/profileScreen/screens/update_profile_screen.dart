import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_durable_articles/profileScreen/screens/profile_screen_Admin.dart';
import 'package:ice_durable_articles/profileScreen/screens/widgets/upload_image.dart';
// import 'package:ice_durable_articles/features/core/screens/profile/update_profile_screen.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/image_strings.dart';
import 'package:ice_durable_articles/src/size_strings.dart';
import 'package:ice_durable_articles/src/text_strings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:get/get.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreenAD()));
            },
            icon: const Icon(LineAwesomeIcons.angle_left)),
        centerTitle: true,
        title: Text(
          tEditProfile,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: tRedColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              //เปลี่ยน sizedเป็น stack
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
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: tRedColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UploadImage()),
                        );
                      },
                      icon: Icon(LineAwesomeIcons.camera),
                      // size: 20.0,
                      color: Colors.white,
                    ),
                      // LineAwesomeIcons.alternate_pencil,
                      // size: 20.0,
                      // color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tFullName),
                          prefixIcon: Icon(Icons.person_outline_rounded)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tEmail), prefixIcon: Icon(Icons.email)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tPhoneNo), prefixIcon: Icon(Icons.phone)),
                    ),
                    const SizedBox(height: tFormHeight),

                    //เสร็จสิ้น botton
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateProfileScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: tRedColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(
                          "บันทึก",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: tFormHeight,
                    ),
                    // Row(
                    //   children: [
                    //     Text.rich(
                    //       TextSpan(
                    //         text: tJoined,
                    //         style: TextStyle(fontSize: 12),
                    //         children: [
                    //           TextSpan(text: tJoined,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12))
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
